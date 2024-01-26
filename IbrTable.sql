CREATE TABLE if not exists person
(
    id                   SERIAL PRIMARY KEY,
    household_status     VARCHAR(50),
    benefiting_entity    VARCHAR(50),
    sex                  VARCHAR(10),
    birth_date           varchar(30),
    sub_region_code      VARCHAR(20),
    marital_status       VARCHAR(10),
    poverty_score        DECIMAL(50),
    is_disabled          VARCHAR(20),
    household_identifier VARCHAR(50)
);

INSERT INTO person (id,household_status, benefiting_entity, sex, birth_date, sub_region_code,
                    marital_status, poverty_score, is_disabled, household_identifier)
VALUES (1,'Head of household', 'Person', 'male', '2022-01-01T11:20:00', 'SR',
        'S', 75.5, 'Not Disabled', 'Household1'),
       (2,'Not Disabled head of household (Mother)', 'Household', 'female', '2022-01-01T11:20:00', 'US', 'M', 60.2, 'Disabled', 'Household2'),
       (3,'Not Disabled head of household (Father)', 'Person', 'male', '2022-01-01T11:20:00', 'GB', 'D', 45.8, 'Not Disabled', 'Household3'),
       (4,'Unknown', 'Person', 'male', '2022-01-01T11:20:00', 'AU', 'W', 80.0, 'Disabled', 'Household4'),
       (5,'Unknown', 'Household', 'female', '2022-01-01T11:20:00', 'IN', 'S', 65.3, 'Not Disabled', 'Household5');

create table if not exists identifier
(
    id               SERIAL PRIMARY KEY,
    identifier_type  VARCHAR(50),
    identifier_value VARCHAR(50),
    person_id        int REFERENCES person (id)
);

INSERT INTO identifier (id,person_id, identifier_type, identifier_value)
VALUES (1,1, 'UIN', '847951632'),
       (2,2,'BRN', '847951631'),
       (3,NULL, 'MRN', '747951632'),
       (4,4, 'UIN', '847951632'),
       (5,4, 'BRN', '847951532');

CREATE table if not exists names
(
    id          SERIAL PRIMARY KEY,
    surname     VARCHAR(50),
    given_name  VARCHAR(50),
    second_name VARCHAR(50),
    maiden_name VARCHAR(50),
    prefix      VARCHAR(10),
    suffix      VARCHAR(10),
    person_id   int REFERENCES person (id)

);

INSERT INTO names (id,person_id,surname, given_name, second_name, maiden_name, prefix, suffix)
VALUES (1,2,  'Doe', 'John', 'Middle', 'Maiden', 'Mr.', 'Jr.'),
       (2,1, 'Smith', 'Alice', '', '', 'Ms.', 'Sr.'),
       (3,3, 'Johnson', 'Robert', 'James', '', 'Dr.', 'PhD'),
       (4,5, 'Brown', 'Emily', '', '', 'Mrs.', ''),
       ( 5,4,'Lee', 'David', '', '', 'Mr.', '');


CREATE TABLE IF NOT EXISTS programme
(
    id                   SERIAL PRIMARY KEY,
    programme_name       VARCHAR(50),
    programme_identifier VARCHAR(50),
    registration_date    varchar(30),
    enrolment_date       varchar(30),
    suspension_date      varchar(30),
    graduation_date      varchar(30),
    enrolment_status     VARCHAR(10),
    person_id            int REFERENCES person (id)

);

INSERT INTO programme (id,person_id, programme_name, programme_identifier, registration_date, enrolment_date, suspension_date, graduation_date, enrolment_status)
VALUES (1, 2,'ProgramA', 'ID001', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active'),
       (2, 1,'ProgramB', 'ID002', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Inactive'),
       (3, 3,'ProgramC', 'ID003', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active'),
       (4,4, 'ProgramD', 'ID004', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Inactive'),
       (5,5, 'ProgramE', 'ID005', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active');

CREATE TABLE IF NOT EXISTS benefit
(
    id            SERIAL PRIMARY KEY,
    benefit_type  VARCHAR(50),
    benefit_date  varchar(100),
    benefit_value VARCHAR(20),
    person_id     int REFERENCES person (id)

);

INSERT INTO benefit (id,person_id, benefit_type, benefit_date, benefit_value)
VALUES (1, 1,'TypeA', '2022-01-01T11:20:00','Value100'),
       (2, 2,'TypeB', '2022-02-01T11:20:00','Value200'),
       (3, 3,'TypeC', '2022-03-01T11:20:00','Value300'),
       (4, 4,'TypeD', '2022-04-01T11:20:00','Value400'),
       (5, 5,'TypeE', '2022-05-01T11:20:00','Value500');

CREATE TABLE IF NOT EXISTS payroll
(
    id                    SERIAL PRIMARY KEY,
    payroll_amount        VARCHAR(20),
    payment_credit_date   varchar(30),
    payment_credit_amount VARCHAR(20),
    payment_charges       VARCHAR(20),
    payment_status        VARCHAR(10),
    person_id             int REFERENCES person (id)

);

INSERT INTO payroll (id,person_id, payroll_amount, payment_credit_date, payment_credit_amount, payment_charges, payment_status)
VALUES (1,1, 'EUR 100.50', '2022-01-01T11:20:00', 'EUR 90.00', 'EUR 5.00', 'Successful'),
       (2,2, 'USD 150.75', '2022-01-01T11:20:00', 'USD 120.00', 'USD 8.00', 'Successful'),
       (3, 3,'GBP 200.00', '2022-01-01T11:20:00', 'GBP 180.00', 'GBP 10.00', 'Successful'),
       (4,4, 'INR 250.25', '2022-01-01T11:20:00', 'INR 220.00', 'INR 12.00', 'Successful'),
       (5,5, 'AUD 300.50', '2022-01-01T11:20:00', 'AUD 270.00', 'AUD 15.00', 'Successful');

create view public.person_view as
(
SELECT p.id,
       p.household_status,
       p.benefiting_entity,
       p.sex,
       p.birth_date,
       p.sub_region_code,
       p.marital_status,
       p.poverty_score,
       p.is_disabled,
       p.household_identifier,
       i.identifier_type,
       i.identifier_value,
       n.surname,
       n.given_name,
       n.second_name,
       n.maiden_name,
       n.prefix,
       n.suffix,
       pr.programme_name,
       pr.programme_identifier,
       pr.registration_date,
       pr.enrolment_date,
       pr.suspension_date,
       pr.graduation_date,
       pr.enrolment_status,
       b.benefit_type,
       b.benefit_date,
       b.benefit_value,
       py.payroll_amount,
       py.payment_credit_date,
       py.payment_credit_amount,
       py.payment_charges,
       py.payment_status
FROM person p
         LEFT JOIN identifier i ON p.id = i.person_id
         LEFT JOIN names n ON p.id = n.person_id
         LEFT JOIN programme pr ON p.id = pr.person_id
         LEFT JOIN benefit b ON p.id = b.person_id
         LEFT JOIN payroll py ON p.id = py.person_id
);
