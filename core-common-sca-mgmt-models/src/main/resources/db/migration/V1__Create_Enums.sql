-- V1__Create_Enums.sql
-- PostgreSQL enumeration types for SCA domain

-- SCA Operation Type
CREATE TYPE sca_operation_type_enum AS ENUM (
    'TRANSFER',
    'PASSWORD_CHANGE'
);

-- SCA Status (used for sca_operation, sca_operation_history)
CREATE TYPE sca_status_enum AS ENUM (
    'PENDING',
    'VERIFIED',
    'FAILED',
    'EXPIRED',
    'CANCELLED'
);

-- Audit Event Type
CREATE TYPE sca_audit_event_type_enum AS ENUM (
    'CREATED',
    'ATTEMPTED',
    'VERIFIED',
    'FAILED',
    'EXPIRED',
    'CANCELLED'
);