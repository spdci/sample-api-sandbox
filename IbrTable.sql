
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

create table if not exists identifier
(
    id               SERIAL PRIMARY KEY,
    identifier_type  VARCHAR(50),
    identifier_value VARCHAR(50),
    person_id        int REFERENCES person (id)

);

CREATE table if not exists names
(
    id          SERIAL PRIMARY KEY,
    surname     VARCHAR(50),
    given_name  VARCHAR(50),
    second_name VARCHAR(50),
    maiden_name VARCHAR(50),
    prefix      VARCHAR(10),
    suffix      VARCHAR(10),
    person_id        int REFERENCES person (id)

);

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
    person_id        int REFERENCES person (id)

);

CREATE TABLE IF NOT EXISTS benefit
(
    id            SERIAL PRIMARY KEY,
    benefit_type  VARCHAR(50),
    benefit_date  varchar(30),
    benefit_value VARCHAR(20),
    person_id        int REFERENCES person (id)

);

CREATE TABLE IF NOT EXISTS payroll
(
    id                    SERIAL PRIMARY KEY,
    payroll_amount        VARCHAR(20),
    payment_credit_date   varchar(30),
    payment_credit_amount VARCHAR(20),
    payment_charges       VARCHAR(20),
    payment_status        VARCHAR(10),
    person_id        int REFERENCES person (id)

);

