
CREATE TABLE network_links (
    link_id BIGSERIAL PRIMARY KEY,

    source_device_id BIGINT NOT NULL,
    target_device_id BIGINT NOT NULL,

    link_type VARCHAR(100) NOT NULL,

    bandwidth_mbps NUMERIC(10,2),

    status VARCHAR(100) NOT NULL DEFAULT 'active',

    creation_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_source_device
        FOREIGN KEY (source_device_id)
        REFERENCES devices(device_id),

    CONSTRAINT fk_target_device
        FOREIGN KEY (target_device_id)
        REFERENCES devices(device_id),

    CONSTRAINT chk_link_type
        CHECK (link_type IN (
            'ethernet',
            'fiber_optic',
            'wireless',
            'serial',
            'virtual'
        )),

    CONSTRAINT chk_link_status
        CHECK (status IN (
            'active',
            'inactive'
        )),

    CONSTRAINT chk_bandwidth
        CHECK (bandwidth_mbps IS NULL OR bandwidth_mbps > 0),

    CONSTRAINT chk_different_devices
        CHECK (source_device_id <> target_device_id)
);
