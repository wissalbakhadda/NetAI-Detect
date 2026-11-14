CREATE TABLE devices (
    device_id BIGSERIAL PRIMARY KEY,

    device_name VARCHAR(100) NOT NULL,

    device_type VARCHAR(100) NOT NULL,

    ip_address INET UNIQUE,

    location VARCHAR(100),

    status VARCHAR(100) NOT NULL DEFAULT 'active',

    creation_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_device_type
        CHECK (device_type IN (
            'router',
            'switch',
            'server',
            'firewall',
            'access_point'
        )),

    CONSTRAINT chk_device_status
        CHECK (status IN (
            'active',
            'inactive'
        ))
);
