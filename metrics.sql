
CREATE TABLE metrics (
    metric_id BIGSERIAL PRIMARY KEY,

    device_id BIGINT NOT NULL,
    link_id BIGINT,
    latency_ms NUMERIC(10,2),
    packet_loss NUMERIC(10,2),
    throughput_mbps NUMERIC(10,2),
    bandwidth NUMERIC(10,2),
    jitter_ms NUMERIC(10,2),

    CONSTRAINT fk_metrics_device
        FOREIGN KEY (device_id)
        REFERENCES devices(device_id),

    CONSTRAINT fk_metrics_link
        FOREIGN KEY (link_id)
        REFERENCES network_links(link_id),

    CHECK (latency_ms IS NULL OR latency_ms >= 0),
    CHECK (packet_loss IS NULL OR packet_loss BETWEEN 0 AND 100),
    CHECK (throughput_mbps IS NULL OR throughput_mbps >= 0),
    CHECK (bandwidth IS NULL OR bandwidth BETWEEN 0 AND 100),
    CHECK (jitter_ms IS NULL OR jitter_ms >= 0)


);

CREATE INDEX idx_metrics_device
ON metrics(device_id);

CREATE INDEX idx_metrics_link
ON metrics(link_id);
