-- V3__Create_casts.sql
-- Postgres casts between varchar and the enumerations using built-in IN/OUT functions.

-------------------------
-- sca_operation_type_enum
-------------------------
CREATE CAST (varchar AS sca_operation_type_enum)
    WITH INOUT
    AS IMPLICIT;

-------------------------
-- sca_status_enum
-------------------------
CREATE CAST (varchar AS sca_status_enum)
    WITH INOUT
    AS IMPLICIT;

-------------------------
-- sca_audit_event_type_enum
-------------------------
CREATE CAST (varchar AS sca_audit_event_type_enum)
    WITH INOUT
    AS IMPLICIT;
