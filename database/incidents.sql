
CREATE TABLE incidents (
    incident_id BIGSERIAL PRIMARY KEY,

    device_id BIGINT,
    link_id BIGINT,

    incident_type VARCHAR(50) NOT NULL,

    incident_severity VARCHAR(20) NOT NULL,

    description TEXT,

    incident_cause TEXT,

    recommendation TEXT,

    status VARCHAR(20) NOT NULL DEFAULT 'open',

    detection_time TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    resolution_time TIMESTAMPTZ,

    CONSTRAINT fk_incident_device
        FOREIGN KEY (device_id)
        REFERENCES devices(device_id),

    CONSTRAINT fk_incident_link
        FOREIGN KEY (link_id)
        REFERENCES network_links(link_id),

    CONSTRAINT chk_incident_target
        CHECK (device_id IS NOT NULL OR link_id IS NOT NULL),

    CONSTRAINT chk_incident_severity
        CHECK (incident_severity IN (
            'low',
            'medium',
            'high',
            'critical'
        )),

    CONSTRAINT chk_incident_status
        CHECK (status IN (
            'open',
            'investigating',
            'resolved'
        )),

    CONSTRAINT chk_resolution_time
        CHECK (
            resolution_time IS NULL
            OR resolution_time >= detection_time
        )
);
