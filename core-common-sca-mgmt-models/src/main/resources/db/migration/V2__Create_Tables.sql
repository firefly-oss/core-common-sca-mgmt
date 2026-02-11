-- V2__Create_Tables.sql
-- Core and related tables for SCA operations

------------------------------------------------------------------------------
-- TABLE: sca_operation
------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sca_operation (
                               id                UUID PRIMARY KEY,
                               reference_id      VARCHAR(255)  NOT NULL,
                               operation_type    sca_operation_type_enum NOT NULL,
                               party_id          VARCHAR(255),
                               status            sca_status_enum NOT NULL,
                               created_at        TIMESTAMP      NOT NULL DEFAULT NOW(),
                               expires_at        TIMESTAMP,
                               last_updated      TIMESTAMP,
                               cancelled_at      TIMESTAMP
);

------------------------------------------------------------------------------
-- TABLE: sca_challenge
------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sca_challenge (
                               id               UUID PRIMARY KEY,
                               sca_operation_id UUID        NOT NULL REFERENCES sca_operation(id),
                               challenge_code   VARCHAR(255)  NOT NULL,
                               created_at       TIMESTAMP     NOT NULL DEFAULT NOW(),
                               expires_at       TIMESTAMP,
                               used             BOOLEAN       NOT NULL DEFAULT FALSE
);

------------------------------------------------------------------------------
-- TABLE: sca_attempt
------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sca_attempt (
                             id                UUID PRIMARY KEY,
                             sca_challenge_id  UUID        NOT NULL REFERENCES sca_challenge(id),
                             attempt_value     VARCHAR(255)  NOT NULL,
                             attempted_at      TIMESTAMP     NOT NULL DEFAULT NOW(),
                             success           BOOLEAN       NOT NULL DEFAULT FALSE,
                             ip_address        VARCHAR(45)
);

------------------------------------------------------------------------------
-- TABLE: sca_operation_history
------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sca_operation_history (
                                       id                UUID PRIMARY KEY,
                                       sca_operation_id  UUID          NOT NULL REFERENCES sca_operation(id),
                                       status            sca_status_enum NOT NULL,
                                       event_time        TIMESTAMP       NOT NULL DEFAULT NOW(),
                                       comments          TEXT
);

------------------------------------------------------------------------------
-- TABLE: sca_audit
------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sca_audit (
                           id                UUID PRIMARY KEY,
                           sca_operation_id  UUID                   NOT NULL REFERENCES sca_operation(id),
                           sca_challenge_id  UUID                   REFERENCES sca_challenge(id),
                           party_id          VARCHAR(255),
                           event_type        sca_audit_event_type_enum NOT NULL,
                           event_time        TIMESTAMP                NOT NULL DEFAULT NOW(),
                           details           TEXT
);
