-- Add new values to sca_operation_type_enum
ALTER TYPE sca_operation_type_enum ADD VALUE 'LOGIN' AFTER 'PASSWORD_CHANGE';
ALTER TYPE sca_operation_type_enum ADD VALUE 'LOAN_REQUEST' AFTER 'LOGIN';
ALTER TYPE sca_operation_type_enum ADD VALUE 'ONBOARDING' AFTER 'LOAN_REQUEST';
ALTER TYPE sca_operation_type_enum ADD VALUE 'OTHER' AFTER 'ONBOARDING';
