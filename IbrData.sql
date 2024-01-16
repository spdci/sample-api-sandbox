-- Insert data into the 'person' table
-- Insert data into the 'person' table
INSERT INTO person (id,household_status, benefiting_entity, sex, birth_date, sub_region_code,
                    marital_status, poverty_score, is_disabled, household_identifier)
VALUES (1,'Head of household', 'Person', 'male', '2022-01-01T11:20:00', 'SR',
        'S', 75.5, 'Not Disabled', 'Household1'),
       (2,'Not Disabled head of household (Mother)', 'Household', 'female', '2022-01-01T11:20:00', 'US', 'M', 60.2, 'Disabled', 'Household2'),
       (3,'Not Disabled head of household (Father)', 'Person', 'male', '2022-01-01T11:20:00', 'GB', 'D', 45.8, 'Not Disabled', 'Household3'),
       (4,'Unknown', 'Person', 'male', '2022-01-01T11:20:00', 'AU', 'W', 80.0, 'Disabled', 'Household4'),
       (5,'Unknown', 'Household', 'female', '2022-01-01T11:20:00', 'IN', 'S', 65.3, 'Not Disabled', 'Household5');

-- Insert data into the 'identifier' table
INSERT INTO identifier (id,person_id, identifier_type, identifier_value)
VALUES (1,1, 'UIN', '847951632'),
       (2,2, 'BRN', '847951631'),
       (3,3, 'MRN', '747951632'),
       (4,4, 'UIN', '847951632'),
       (5,5, 'BRN', '847951532');

-- Insert data into the 'name' table
INSERT INTO names (id,person_id, surname, given_name, second_name, maiden_name, prefix, suffix)
VALUES (1,1, 'Doe', 'John', 'Middle', 'Maiden', 'Mr.', 'Jr.'),
       (2,2, 'Smith', 'Alice', '', '', 'Ms.', 'Sr.'),
       (3,3, 'Johnson', 'Robert', 'James', '', 'Dr.', 'PhD'),
       (4,4, 'Brown', 'Emily', '', '', 'Mrs.', ''),
       (5, 5,'Lee', 'David', '', '', 'Mr.', '');

-- Insert data into the 'programme' table
INSERT INTO programme (id,person_id, programme_name, programme_identifier, registration_date, enrolment_date, suspension_date, graduation_date, enrolment_status)
VALUES (1, 1,'ProgramA', 'ID001', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active'),
       (2, 2,'ProgramB', 'ID002', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Inactive'),
       (3, 3,'ProgramC', 'ID003', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active'),
       (4,4, 'ProgramD', 'ID004', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Inactive'),
       (5,5, 'ProgramE', 'ID005', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active');

-- Insert data into the 'benefit' table
INSERT INTO benefit (id,person_id, benefit_type, benefit_date, benefit_value)
VALUES (1, 1,'TypeA', '2022-01-01T11:20:00', 'Value100'),
       (2, 2,'TypeB', '2022-01-01T11:20:00', 'Value200'),
       (3, 3,'TypeC', '2022-01-01T11:20:00', 'Value300'),
       (4, 4,'TypeD', '2022-01-01T11:20:00', 'Value400'),
       (5, 5,'TypeE', '2022-01-01T11:20:00', 'Value500');

-- Insert data into the 'payroll' table
INSERT INTO payroll (id,person_id, payroll_amount, payment_credit_date, payment_credit_amount, payment_charges, payment_status)
VALUES (1,1, 'EUR 100.50', '2022-01-01T11:20:00', 'EUR 90.00', 'EUR 5.00', 'Successful'),
       (2,2, 'USD 150.75', '2022-01-01T11:20:00', 'USD 120.00', 'USD 8.00', 'Successful'),
       (3, 3,'GBP 200.00', '2022-01-01T11:20:00', 'GBP 180.00', 'GBP 10.00', 'Successful'),
       (4,4, 'INR 250.25', '2022-01-01T11:20:00', 'INR 220.00', 'INR 12.00', 'Successful'),
       (5,5, 'AUD 300.50', '2022-01-01T11:20:00', 'AUD 270.00', 'AUD 15.00', 'Successful');
