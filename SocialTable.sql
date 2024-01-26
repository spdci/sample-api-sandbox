--Enums
create type sex as ENUM ('male', 'female','other','unknown');

create type marital_status as ENUM ('S','M','W','A','D','L','U');

CREATE TABLE if not exists social_person
(
    id                         SERIAL PRIMARY KEY,
    sex                        sex         not null,
    birth_date                 varchar(30) not null,
    marital_status             marital_status,
    is_disabled                varchar(20),
    disability_identifier_id   int references identifier (id),
    disability_type            varchar(100)[],
    functional_limitation_type varchar(100)[],
    functional_severity        varchar(100)[],
    nationality                VARCHAR(100)[],
    employment_status          varchar(30),
    is_deceased                varchar(30),
    death_date                 varchar(30),
    ethnicity                  varchar(100)[],
    phone_number               Varchar(100)[],
    email                      varchar(200)[],
    household_identifier       varchar(50) not null,
    household_status           varchar(30),
--     poverty_score              int,
    parent1_identifier_id      int references identifier (id),
    parent2_identifier_id      int references identifier (id),
    registration_date          varchar(30) not null,
    last_updated               varchar(30)
);


INSERT INTO social_person
(sex, birth_date, marital_status, is_disabled, disability_type,
 functional_limitation_type, functional_severity, nationality,
 employment_status, is_deceased, death_date, ethnicity,
 phone_number, email, household_identifier, household_status,
  registration_date, last_updated, disability_identifier_id, parent1_identifier_id, parent2_identifier_id)
VALUES ('male', '1990-01-01', 'S', 'No', ARRAY ['Physical'],
        ARRAY ['None'], ARRAY ['None'], ARRAY ['US'],
        'Employed', 'No', NULL, ARRAY ['Caucasian'],
        ARRAY ['123-456-7890'], ARRAY ['john.doe@email.com'], 'Household1', 'Head',
         '2024-01-24', '2024-01-24', 1, 2, 3),

       ('female', '1985-05-15', 'M', 'Yes', ARRAY ['Physical'],
        ARRAY ['Mobility'], ARRAY ['Moderate'], ARRAY ['Canadian'],
        'Unemployed', 'No', NULL, ARRAY ['Asian'],
        ARRAY ['987-654-3210'], ARRAY ['jane.smith@email.com'], 'Household2', 'Spouse',
        '2024-01-23', '2024-01-23', 2, 3, 5),

       ('male', '1978-08-20', 'D', 'No', ARRAY ['None'],
        ARRAY ['None'], ARRAY ['None'], ARRAY ['British'],
        'Employed', 'No', NULL, ARRAY ['African'],
        ARRAY ['555-123-4567'], ARRAY ['bob.jones@email.com'], 'Household3', 'S',
        '2024-01-22', '2024-01-22', NULL, 1, 4),

       ('female', '1995-12-10', 'S', 'Yes', ARRAY ['Hearing'],
        ARRAY ['Communication'], ARRAY ['Severe'], ARRAY ['Indian'],
        'Unemployed', 'No', NULL, ARRAY ['Hispanic'],
        ARRAY ['111-222-3333'], ARRAY ['sara.jackson@email.com'], 'Household4', 'Head',
        '2024-01-21', '2024-01-21', 5, 2, 3),

       ('male', '1980-03-25', 'M', 'No', ARRAY ['None'],
        ARRAY ['None'], ARRAY ['None'], ARRAY ['American'],
        'Employed', 'Yes', '2023-05-10', ARRAY ['Other'],
        ARRAY ['999-888-7777'], ARRAY ['mike.williams@email.com'], 'Household5', 'Spouse',
         '2024-01-20', '2024-01-20', 4, NULL, 2);
-- INSERT INTO social_person
-- (sex, birth_date, marital_status, is_disabled, disability_type,
--  functional_limitation_type, functional_severity, nationality,
--  employment_status, is_deceased, death_date, ethnicity,
--  phone_number, email, household_identifier, household_status,
--  poverty_score, registration_date, last_updated, disability_identifier_id, parent1_identifier_id, parent2_identifier_id)
-- VALUES ('male', '1990-01-01', 'S', 'No', ARRAY ['Physical'],
--         ARRAY ['None'], ARRAY ['None'], ARRAY ['US'],
--         'Employed', 'No', NULL, ARRAY ['Caucasian'],
--         ARRAY ['123-456-7890'], ARRAY ['john.doe@email.com'], 'Household1', 'Head',
--         20, '2024-01-24', '2024-01-24', 1, 2, 3),
--
--        ('female', '1985-05-15', 'M', 'Yes', ARRAY ['Physical'],
--         ARRAY ['Mobility'], ARRAY ['Moderate'], ARRAY ['Canadian'],
--         'Unemployed', 'No', NULL, ARRAY ['Asian'],
--         ARRAY ['987-654-3210'], ARRAY ['jane.smith@email.com'], 'Household2', 'Spouse',
--         15, '2024-01-23', '2024-01-23', 2, 3, 5),
--
--        ('male', '1978-08-20', 'D', 'No', ARRAY ['None'],
--         ARRAY ['None'], ARRAY ['None'], ARRAY ['British'],
--         'Employed', 'No', NULL, ARRAY ['African'],
--         ARRAY ['555-123-4567'], ARRAY ['bob.jones@email.com'], 'Household3', 'S',
--         45, '2024-01-22', '2024-01-22', NULL, 1, 4),
--
--        ('female', '1995-12-10', 'S', 'Yes', ARRAY ['Hearing'],
--         ARRAY ['Communication'], ARRAY ['Severe'], ARRAY ['Indian'],
--         'Unemployed', 'No', NULL, ARRAY ['Hispanic'],
--         ARRAY ['111-222-3333'], ARRAY ['sara.jackson@email.com'], 'Household4', 'Head',
--         19, '2024-01-21', '2024-01-21', 5, 2, 3),
--
--        ('male', '1980-03-25', 'M', 'No', ARRAY ['None'],
--         ARRAY ['None'], ARRAY ['None'], ARRAY ['American'],
--         'Employed', 'Yes', '2023-05-10', ARRAY ['Other'],
--         ARRAY ['999-888-7777'], ARRAY ['mike.williams@email.com'], 'Household5', 'Spouse',
--         60, '2024-01-20', '2024-01-20', 4, NULL, 2);

--JOIN table

-- Identifier table in IBRTable.sql

CREATE TABLE IF NOT EXISTS social_person_identifier
(
    social_person_id INT REFERENCES social_person (id),
    identifier_id    INT REFERENCES identifier (id),
    PRIMARY KEY (social_person_id, identifier_id)
);

-- Insert dummy data into the social_person_identifier table
INSERT INTO social_person_identifier (social_person_id, identifier_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 5);

CREATE table if not exists social_names
(
    id               SERIAL PRIMARY KEY,
    surname          VARCHAR(50),
    given_name       VARCHAR(50),
    second_name      VARCHAR(50),
    maiden_name      VARCHAR(50),
    prefix           VARCHAR(10),
    suffix           VARCHAR(10),
    social_person_id int references social_person (id)
);

INSERT INTO social_names (id,social_person_id,surname, given_name, second_name, maiden_name, prefix, suffix)
VALUES (1,2,  'Doe', 'John', 'Middle', 'Maiden', 'Mr.', 'Jr.'),
       (2,1, 'Smith', 'Alice', '', '', 'Ms.', 'Sr.'),
       (3,3, 'Johnson', 'Robert', 'James', '', 'Dr.', 'PhD'),
       (4,5, 'Brown', 'Emily', '', '', 'Mrs.', ''),
       ( 5,4,'Lee', 'David', '', '', 'Mr.', '');


CREATE TABLE if not exists address
(
    id               SERIAL PRIMARY KEY,
    address_line1    varchar(100),
    address_line2    varchar(100),
    locality         varchar(50),
    sub_region_code  varchar(20),
    region_code      varchar(30),
    postal_code      varchar(30),
    country_code     varchar(30),
    social_person_id int references social_person (id)
);

INSERT INTO address (address_line1, address_line2, locality, sub_region_code, region_code, postal_code, country_code,
                     social_person_id)
VALUES ('123 Main St', 'Apt 456', 'Cityville', 'SV', 'A123', '12345', 'US', 1),
       ('456 Oak St', 'Suite 789', 'Townsville', 'TN', 'B456', '67890', 'US', 2),
       ('789 Pine St', 'Unit 101', 'Villagetown', 'VT', 'C789', '23456', 'US', 3),
       ('101 Elm St', 'Room 202', 'Hamletsville', 'HM', 'D101', '34567', 'US', 4);

CREATE TABLE if not exists geo_location
(
    id         SERIAL PRIMARY KEY,
    address_id int references address (id)

);

INSERT INTO geo_location (address_id)
VALUES (1),
       (2),
       (3),
       (4);

-- INSERT INTO geo_location (id,address_id)
-- VALUES (1,2),
--        (2,3),
--        (3,1),
--        (4,4);

CREATE TABLE if not exists plus_code
(
    id              SERIAL PRIMARY KEY,
    global_code     varchar(100),
    geo_location_id int references geo_location (id)
);

INSERT INTO plus_code (global_code, geo_location_id)
VALUES ('8FW4V900+', 1),
       ('ABC12345', 2),
       ('XYZ98765', 3),
       ('123ABC78', 4);

CREATE TABLE if not exists geometry
(
    id           SERIAL PRIMARY KEY,
    plus_code_id int references plus_code (id)
);

INSERT INTO geometry (plus_code_id)
VALUES (1),
       (2),
       (3),
       (4);

CREATE TABLE if not exists geo_coordinate
(
    id          SERIAL PRIMARY
        KEY,
    latitude    numeric(15, 9),
    longitude   numeric(15, 9),
    geometry_id int references geometry (id)
);

INSERT INTO geo_coordinate (latitude, longitude, geometry_id)
VALUES (37.7749, -122.4194, 1), -- San Francisco, CA
       (40.7128, -74.0060, 2),  -- New York, NY
       (34.0522, -118.2437, 3), -- Los Angeles, CA
       (41.8781, -87.6298, 4); -- Chicago, IL


CREATE TABLE if not exists bounds
(
    id           SERIAL PRIMARY KEY,
    northeast_id int references geo_coordinate (id),
    southwest_id int references geo_coordinate (id),
    geometry_id  int references geometry (id)

);

INSERT INTO bounds (geometry_id, northeast_id, southwest_id)
VALUES (1, 1, 2),
       (2, 2, 3),
       (3, 3, 4),
       (4, 4, 1);

--View

CREATE OR REPLACE VIEW social_person_view AS
SELECT sp.id,
       sp.sex,
       sp.birth_date,
       sp.marital_status,
       sp.is_disabled,
       sp.disability_type,
       sp.functional_limitation_type,
       sp.functional_severity,
       sp.nationality,
       sp.employment_status,
       sp.is_deceased,
       sp.death_date,
       sp.ethnicity,
       sp.phone_number,
       sp.email,
       sp.household_identifier,
       sp.household_status,
--        sp.poverty_score,
       sp.registration_date,
       sp.last_updated,
       iden.identifier_type,
       iden.identifier_value,
       n.surname,
       n.given_name,
       n.second_name,
       n.maiden_name,
       n.prefix,
       n.suffix,
       a.address_line1,
       a.address_line2,
       a.locality,
       a.sub_region_code,
       a.region_code,
       a.postal_code,
       a.country_code,
--        gc.latitude,
--        gc.longitude,
       p.global_code
FROM social_person sp
         LEFT JOIN
     identifier iden ON sp.id = iden.person_id
         LEFT JOIN
     social_names n ON sp.id = n.social_person_id
         LEFT JOIN
     address a on sp.id = a.social_person_id
         LEFT JOIN
     geo_location gl on a.id = gl.address_id
--          LEFT JOIN geo_coordinate gc on gl.id = gc.geometry_id
     LEFT JOIN plus_code p on gl.id = p.geo_location_id;


--Inserting dummy data into the geo_coordinate table




-- Inserting dummy data into the plus_code table


-- Inserting dummy data into the geo_location table


-- INSERT INTO address (id,address_line1, address_line2, locality, sub_region_code, region_code, postal_code, country_code,
--                      social_person_id)
-- VALUES (1,'123 Main St', 'Apt 456', 'Cityville', 'SV', 'A123', '12345', 'US', 1),
--        (2,'456 Oak St', 'Suite 789', 'Townsville', 'TN', 'B456', '67890', 'US', 2),
--        (3,'789 Pine St', 'Unit 101', 'Villagetown', 'VT', 'C789', '23456', 'US', 3),
--        (4,'101 Elm St', 'Room 202', 'Hamletsville', 'HM', 'D101', '34567', 'US', 4);


