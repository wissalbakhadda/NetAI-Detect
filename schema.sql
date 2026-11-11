CREATE TABLE metrics (
    id SERIAL PRIMARY KEY,
    ts TIMESTAMP DEFAULT NOW(),
    router_id TEXT,
    region TEXT,
    latency_ms REAL,
    packet_loss REAL,
    jitter_ms REAL,
    rx_bytes_s REAL,
    tx_bytes_s REAL,
    errors INT,
    drops INT,
    cpu REAL,
    ram REAL,
    iface_up BOOLEAN
);

CREATE TABLE faults (
    id SERIAL PRIMARY KEY,
    router_id TEXT,
    fault_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP
);
