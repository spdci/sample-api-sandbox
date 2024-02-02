--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

-- Started on 2024-02-02 15:39:18 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3522 (class 1262 OID 13757)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 3522
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 888 (class 1247 OID 16466)
-- Name: marital_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.marital_status AS ENUM (
    'S',
    'M',
    'W',
    'A',
    'D',
    'L',
    'U'
);


ALTER TYPE public.marital_status OWNER TO postgres;

--
-- TOC entry 885 (class 1247 OID 16457)
-- Name: sex; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sex AS ENUM (
    'male',
    'female',
    'other',
    'unknown'
);


ALTER TYPE public.sex OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16533)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    address_line1 character varying(100),
    address_line2 character varying(100),
    locality character varying(50),
    sub_region_code character varying(20),
    region_code character varying(30),
    postal_code character varying(30),
    country_code character varying(30),
    social_person_id integer
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16532)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 227
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- TOC entry 239 (class 1259 OID 16630)
-- Name: address_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16428)
-- Name: benefit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benefit (
    id integer NOT NULL,
    benefit_type character varying(50),
    benefit_date character varying(100),
    benefit_value character varying(20),
    person_id integer
);


ALTER TABLE public.benefit OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16427)
-- Name: benefit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benefit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.benefit_id_seq OWNER TO postgres;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 217
-- Name: benefit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.benefit_id_seq OWNED BY public.benefit.id;


--
-- TOC entry 240 (class 1259 OID 16631)
-- Name: benefit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benefit_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.benefit_seq OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16593)
-- Name: bounds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bounds (
    id integer NOT NULL,
    northeast_id integer,
    southwest_id integer,
    geometry_id integer
);


ALTER TABLE public.bounds OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16592)
-- Name: bounds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bounds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bounds_id_seq OWNER TO postgres;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 237
-- Name: bounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bounds_id_seq OWNED BY public.bounds.id;


--
-- TOC entry 241 (class 1259 OID 16632)
-- Name: bounds_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bounds_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bounds_seq OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16581)
-- Name: geo_coordinate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geo_coordinate (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    geometry_id integer
);


ALTER TABLE public.geo_coordinate OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16580)
-- Name: geo_coordinate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geo_coordinate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_coordinate_id_seq OWNER TO postgres;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 235
-- Name: geo_coordinate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geo_coordinate_id_seq OWNED BY public.geo_coordinate.id;


--
-- TOC entry 242 (class 1259 OID 16633)
-- Name: geo_coordinate_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geo_coordinate_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_coordinate_seq OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16545)
-- Name: geo_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geo_location (
    id integer NOT NULL,
    address_id integer
);


ALTER TABLE public.geo_location OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16544)
-- Name: geo_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geo_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_location_id_seq OWNER TO postgres;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 229
-- Name: geo_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geo_location_id_seq OWNED BY public.geo_location.id;


--
-- TOC entry 243 (class 1259 OID 16634)
-- Name: geo_location_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geo_location_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_location_seq OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16569)
-- Name: geometry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geometry (
    id integer NOT NULL,
    plus_code_id integer
);


ALTER TABLE public.geometry OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16568)
-- Name: geometry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geometry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geometry_id_seq OWNER TO postgres;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 233
-- Name: geometry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geometry_id_seq OWNED BY public.geometry.id;


--
-- TOC entry 244 (class 1259 OID 16635)
-- Name: geometry_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geometry_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geometry_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16392)
-- Name: identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identifier (
    id integer NOT NULL,
    identifier_type character varying(50),
    identifier_value character varying(50),
    person_id integer
);


ALTER TABLE public.identifier OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16404)
-- Name: names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.names (
    id integer NOT NULL,
    surname character varying(50),
    given_name character varying(50),
    second_name character varying(50),
    maiden_name character varying(50),
    prefix character varying(10),
    suffix character varying(10),
    person_id integer
);


ALTER TABLE public.names OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16440)
-- Name: payroll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payroll (
    id integer NOT NULL,
    payroll_amount character varying(20),
    payment_credit_date character varying(30),
    payment_credit_amount character varying(20),
    payment_charges character varying(20),
    payment_status character varying(10),
    person_id integer
);


ALTER TABLE public.payroll OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16385)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    household_status character varying(50),
    benefiting_entity character varying(50),
    sex character varying(10),
    birth_date character varying(30),
    sub_region_code character varying(20),
    marital_status character varying(10),
    poverty_score numeric(50,0),
    is_disabled character varying(20),
    household_identifier character varying(50)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16416)
-- Name: programme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programme (
    id integer NOT NULL,
    programme_name character varying(50),
    programme_identifier character varying(50),
    registration_date character varying(30),
    enrolment_date character varying(30),
    suspension_date character varying(30),
    graduation_date character varying(30),
    enrolment_status character varying(10),
    person_id integer
);


ALTER TABLE public.programme OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16451)
-- Name: ibr_person_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ibr_person_view AS
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
   FROM (((((public.person p
     LEFT JOIN public.identifier i ON ((p.id = i.person_id)))
     LEFT JOIN public.names n ON ((p.id = n.person_id)))
     LEFT JOIN public.programme pr ON ((p.id = pr.person_id)))
     LEFT JOIN public.benefit b ON ((p.id = b.person_id)))
     LEFT JOIN public.payroll py ON ((p.id = py.person_id)));


ALTER TABLE public.ibr_person_view OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 24576)
-- Name: ibr_person_view_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ibr_person_view_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ibr_person_view_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16391)
-- Name: identifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.identifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identifier_id_seq OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 211
-- Name: identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.identifier_id_seq OWNED BY public.identifier.id;


--
-- TOC entry 245 (class 1259 OID 16636)
-- Name: identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.identifier_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identifier_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16403)
-- Name: names_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.names_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.names_id_seq OWNER TO postgres;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 213
-- Name: names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.names_id_seq OWNED BY public.names.id;


--
-- TOC entry 246 (class 1259 OID 16637)
-- Name: names_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.names_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.names_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16439)
-- Name: payroll_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payroll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payroll_id_seq OWNER TO postgres;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 219
-- Name: payroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payroll_id_seq OWNED BY public.payroll.id;


--
-- TOC entry 247 (class 1259 OID 16638)
-- Name: payroll_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payroll_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payroll_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16384)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 209
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 248 (class 1259 OID 16639)
-- Name: person_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_seq OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16640)
-- Name: person_view_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_view_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_view_seq OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16557)
-- Name: plus_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plus_code (
    id integer NOT NULL,
    global_code character varying(100),
    geo_location_id integer
);


ALTER TABLE public.plus_code OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16556)
-- Name: plus_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plus_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plus_code_id_seq OWNER TO postgres;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 231
-- Name: plus_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plus_code_id_seq OWNED BY public.plus_code.id;


--
-- TOC entry 250 (class 1259 OID 16641)
-- Name: plus_code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plus_code_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plus_code_seq OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16415)
-- Name: programme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_id_seq OWNER TO postgres;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 215
-- Name: programme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programme_id_seq OWNED BY public.programme.id;


--
-- TOC entry 251 (class 1259 OID 16642)
-- Name: programme_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programme_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_seq OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16521)
-- Name: social_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_names (
    id integer NOT NULL,
    surname character varying(50),
    given_name character varying(50),
    second_name character varying(50),
    maiden_name character varying(50),
    prefix character varying(10),
    suffix character varying(10),
    social_person_id integer,
    person_id integer
);


ALTER TABLE public.social_names OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16520)
-- Name: social_names_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_names_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_names_id_seq OWNER TO postgres;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 225
-- Name: social_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_names_id_seq OWNED BY public.social_names.id;


--
-- TOC entry 252 (class 1259 OID 16643)
-- Name: social_names_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_names_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_names_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16482)
-- Name: social_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_person (
    id integer NOT NULL,
    sex public.sex NOT NULL,
    birth_date character varying(30) NOT NULL,
    marital_status public.marital_status,
    is_disabled character varying(20),
    disability_identifier_id integer,
    disability_type character varying(100)[],
    functional_limitation_type character varying(100)[],
    functional_severity character varying(100)[],
    nationality character varying(100)[],
    employment_status character varying(30),
    is_deceased character varying(30),
    death_date character varying(30),
    ethnicity character varying(100)[],
    phone_number character varying(100)[],
    email character varying(200)[],
    household_identifier character varying(50) NOT NULL,
    household_status character varying(30),
    parent1_identifier_id integer,
    parent2_identifier_id integer,
    registration_date character varying(30) NOT NULL,
    last_updated character varying(30),
    household_size integer DEFAULT 5,
    poverty_score integer
);


ALTER TABLE public.social_person OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16481)
-- Name: social_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_person_id_seq OWNER TO postgres;

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 222
-- Name: social_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_person_id_seq OWNED BY public.social_person.id;


--
-- TOC entry 224 (class 1259 OID 16505)
-- Name: social_person_identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_person_identifier (
    social_person_id integer NOT NULL,
    identifier_id integer NOT NULL
);


ALTER TABLE public.social_person_identifier OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 24583)
-- Name: social_person_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.social_person_view AS
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
    sp.household_size,
    sp.poverty_score,
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
    p.global_code
   FROM (((((public.social_person sp
     LEFT JOIN public.identifier iden ON ((sp.id = iden.person_id)))
     LEFT JOIN public.social_names n ON ((sp.id = n.social_person_id)))
     LEFT JOIN public.address a ON ((sp.id = a.social_person_id)))
     LEFT JOIN public.geo_location gl ON ((a.id = gl.address_id)))
     LEFT JOIN public.plus_code p ON ((gl.id = p.geo_location_id)));


ALTER TABLE public.social_person_view OWNER TO postgres;

--
-- TOC entry 3274 (class 2604 OID 16536)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 16431)
-- Name: benefit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefit ALTER COLUMN id SET DEFAULT nextval('public.benefit_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 16596)
-- Name: bounds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bounds ALTER COLUMN id SET DEFAULT nextval('public.bounds_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 16584)
-- Name: geo_coordinate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_coordinate ALTER COLUMN id SET DEFAULT nextval('public.geo_coordinate_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 16548)
-- Name: geo_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_location ALTER COLUMN id SET DEFAULT nextval('public.geo_location_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 16572)
-- Name: geometry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geometry ALTER COLUMN id SET DEFAULT nextval('public.geometry_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 16395)
-- Name: identifier id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identifier ALTER COLUMN id SET DEFAULT nextval('public.identifier_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 16407)
-- Name: names id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names ALTER COLUMN id SET DEFAULT nextval('public.names_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 16443)
-- Name: payroll id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll ALTER COLUMN id SET DEFAULT nextval('public.payroll_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 16388)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 16560)
-- Name: plus_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plus_code ALTER COLUMN id SET DEFAULT nextval('public.plus_code_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 16419)
-- Name: programme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programme ALTER COLUMN id SET DEFAULT nextval('public.programme_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 16524)
-- Name: social_names id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_names ALTER COLUMN id SET DEFAULT nextval('public.social_names_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 16485)
-- Name: social_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_person ALTER COLUMN id SET DEFAULT nextval('public.social_person_id_seq'::regclass);


--
-- TOC entry 3491 (class 0 OID 16533)
-- Dependencies: 228
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address (id, address_line1, address_line2, locality, sub_region_code, region_code, postal_code, country_code, social_person_id) VALUES (1, '123 Main St', 'Apt 456', 'Cityville', 'SV', 'A123', '12345', 'US', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.address (id, address_line1, address_line2, locality, sub_region_code, region_code, postal_code, country_code, social_person_id) VALUES (2, '456 Oak St', 'Suite 789', 'Townsville', 'TN', 'B456', '67890', 'US', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.address (id, address_line1, address_line2, locality, sub_region_code, region_code, postal_code, country_code, social_person_id) VALUES (3, '789 Pine St', 'Unit 101', 'Villagetown', 'VT', 'C789', '23456', 'US', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.address (id, address_line1, address_line2, locality, sub_region_code, region_code, postal_code, country_code, social_person_id) VALUES (4, '101 Elm St', 'Room 202', 'Hamletsville', 'HM', 'D101', '34567', 'US', 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 3482 (class 0 OID 16428)
-- Dependencies: 218
-- Data for Name: benefit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.benefit (id, benefit_type, benefit_date, benefit_value, person_id) VALUES (1, 'TypeA', '2022-01-01T11:20:00', 'Value100', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.benefit (id, benefit_type, benefit_date, benefit_value, person_id) VALUES (2, 'TypeB', '2022-02-01T11:20:00', 'Value200', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.benefit (id, benefit_type, benefit_date, benefit_value, person_id) VALUES (3, 'TypeC', '2022-03-01T11:20:00', 'Value300', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.benefit (id, benefit_type, benefit_date, benefit_value, person_id) VALUES (4, 'TypeD', '2022-04-01T11:20:00', 'Value400', 4) ON CONFLICT DO NOTHING;
INSERT INTO public.benefit (id, benefit_type, benefit_date, benefit_value, person_id) VALUES (5, 'TypeE', '2022-05-01T11:20:00', 'Value500', 5) ON CONFLICT DO NOTHING;


--
-- TOC entry 3501 (class 0 OID 16593)
-- Dependencies: 238
-- Data for Name: bounds; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bounds (id, northeast_id, southwest_id, geometry_id) VALUES (1, 1, 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.bounds (id, northeast_id, southwest_id, geometry_id) VALUES (2, 2, 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.bounds (id, northeast_id, southwest_id, geometry_id) VALUES (3, 3, 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.bounds (id, northeast_id, southwest_id, geometry_id) VALUES (4, 4, 1, 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 3499 (class 0 OID 16581)
-- Dependencies: 236
-- Data for Name: geo_coordinate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.geo_coordinate (id, latitude, longitude, geometry_id) VALUES (1, 37.7749, -122.4194, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.geo_coordinate (id, latitude, longitude, geometry_id) VALUES (2, 40.7128, -74.006, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.geo_coordinate (id, latitude, longitude, geometry_id) VALUES (3, 34.0522, -118.2437, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.geo_coordinate (id, latitude, longitude, geometry_id) VALUES (4, 41.8781, -87.6298, 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 3493 (class 0 OID 16545)
-- Dependencies: 230
-- Data for Name: geo_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.geo_location (id, address_id) VALUES (1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.geo_location (id, address_id) VALUES (2, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.geo_location (id, address_id) VALUES (3, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.geo_location (id, address_id) VALUES (4, 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 3497 (class 0 OID 16569)
-- Dependencies: 234
-- Data for Name: geometry; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.geometry (id, plus_code_id) VALUES (1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.geometry (id, plus_code_id) VALUES (2, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.geometry (id, plus_code_id) VALUES (3, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.geometry (id, plus_code_id) VALUES (4, 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 3476 (class 0 OID 16392)
-- Dependencies: 212
-- Data for Name: identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.identifier (id, identifier_type, identifier_value, person_id) VALUES (1, 'UIN', '847951632', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.identifier (id, identifier_type, identifier_value, person_id) VALUES (2, 'BRN', '847951631', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.identifier (id, identifier_type, identifier_value, person_id) VALUES (3, 'MRN', '747951632', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.identifier (id, identifier_type, identifier_value, person_id) VALUES (4, 'UIN', '847951632', 4) ON CONFLICT DO NOTHING;
INSERT INTO public.identifier (id, identifier_type, identifier_value, person_id) VALUES (5, 'BRN', '847951532', 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 3478 (class 0 OID 16404)
-- Dependencies: 214
-- Data for Name: names; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.names (id, surname, given_name, second_name, maiden_name, prefix, suffix, person_id) VALUES (1, 'Doe', 'John', 'Middle', 'Maiden', 'Mr.', 'Jr.', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.names (id, surname, given_name, second_name, maiden_name, prefix, suffix, person_id) VALUES (2, 'Smith', 'Alice', '', '', 'Ms.', 'Sr.', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.names (id, surname, given_name, second_name, maiden_name, prefix, suffix, person_id) VALUES (3, 'Johnson', 'Robert', 'James', '', 'Dr.', 'PhD', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.names (id, surname, given_name, second_name, maiden_name, prefix, suffix, person_id) VALUES (4, 'Brown', 'Emily', '', '', 'Mrs.', '', 5) ON CONFLICT DO NOTHING;
INSERT INTO public.names (id, surname, given_name, second_name, maiden_name, prefix, suffix, person_id) VALUES (5, 'Lee', 'David', '', '', 'Mr.', '', 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 3484 (class 0 OID 16440)
-- Dependencies: 220
-- Data for Name: payroll; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payroll (id, payroll_amount, payment_credit_date, payment_credit_amount, payment_charges, payment_status, person_id) VALUES (1, 'EUR 100.50', '2022-01-01T11:20:00', 'EUR 90.00', 'EUR 5.00', 'Successful', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.payroll (id, payroll_amount, payment_credit_date, payment_credit_amount, payment_charges, payment_status, person_id) VALUES (2, 'USD 150.75', '2022-01-01T11:20:00', 'USD 120.00', 'USD 8.00', 'Successful', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.payroll (id, payroll_amount, payment_credit_date, payment_credit_amount, payment_charges, payment_status, person_id) VALUES (3, 'GBP 200.00', '2022-01-01T11:20:00', 'GBP 180.00', 'GBP 10.00', 'Successful', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.payroll (id, payroll_amount, payment_credit_date, payment_credit_amount, payment_charges, payment_status, person_id) VALUES (4, 'INR 250.25', '2022-01-01T11:20:00', 'INR 220.00', 'INR 12.00', 'Successful', 4) ON CONFLICT DO NOTHING;
INSERT INTO public.payroll (id, payroll_amount, payment_credit_date, payment_credit_amount, payment_charges, payment_status, person_id) VALUES (5, 'AUD 300.50', '2022-01-01T11:20:00', 'AUD 270.00', 'AUD 15.00', 'Successful', 5) ON CONFLICT DO NOTHING;


--
-- TOC entry 3474 (class 0 OID 16385)
-- Dependencies: 210
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, household_status, benefiting_entity, sex, birth_date, sub_region_code, marital_status, poverty_score, is_disabled, household_identifier) VALUES (1, 'Head of household', 'Person', 'male', '2022-01-01T11:20:00', 'SR', 'S', 76, 'Not Disabled', 'Household1') ON CONFLICT DO NOTHING;
INSERT INTO public.person (id, household_status, benefiting_entity, sex, birth_date, sub_region_code, marital_status, poverty_score, is_disabled, household_identifier) VALUES (2, 'Not Disabled head of household (Mother)', 'Household', 'female', '2022-01-01T11:20:00', 'US', 'M', 60, 'Disabled', 'Household2') ON CONFLICT DO NOTHING;
INSERT INTO public.person (id, household_status, benefiting_entity, sex, birth_date, sub_region_code, marital_status, poverty_score, is_disabled, household_identifier) VALUES (3, 'Not Disabled head of household (Father)', 'Person', 'male', '2022-01-01T11:20:00', 'GB', 'D', 46, 'Not Disabled', 'Household3') ON CONFLICT DO NOTHING;
INSERT INTO public.person (id, household_status, benefiting_entity, sex, birth_date, sub_region_code, marital_status, poverty_score, is_disabled, household_identifier) VALUES (4, 'Unknown', 'Person', 'male', '2022-01-01T11:20:00', 'AU', 'W', 80, 'Disabled', 'Household4') ON CONFLICT DO NOTHING;
INSERT INTO public.person (id, household_status, benefiting_entity, sex, birth_date, sub_region_code, marital_status, poverty_score, is_disabled, household_identifier) VALUES (5, 'Unknown', 'Household', 'female', '2022-01-01T11:20:00', 'IN', 'S', 65, 'Not Disabled', 'Household5') ON CONFLICT DO NOTHING;


--
-- TOC entry 3495 (class 0 OID 16557)
-- Dependencies: 232
-- Data for Name: plus_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.plus_code (id, global_code, geo_location_id) VALUES (1, '8FW4V900+', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.plus_code (id, global_code, geo_location_id) VALUES (2, 'ABC12345', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.plus_code (id, global_code, geo_location_id) VALUES (3, 'XYZ98765', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.plus_code (id, global_code, geo_location_id) VALUES (4, '123ABC78', 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 3480 (class 0 OID 16416)
-- Dependencies: 216
-- Data for Name: programme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programme (id, programme_name, programme_identifier, registration_date, enrolment_date, suspension_date, graduation_date, enrolment_status, person_id) VALUES (1, 'ProgramA', 'ID001', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.programme (id, programme_name, programme_identifier, registration_date, enrolment_date, suspension_date, graduation_date, enrolment_status, person_id) VALUES (2, 'ProgramB', 'ID002', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Inactive', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.programme (id, programme_name, programme_identifier, registration_date, enrolment_date, suspension_date, graduation_date, enrolment_status, person_id) VALUES (3, 'ProgramC', 'ID003', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.programme (id, programme_name, programme_identifier, registration_date, enrolment_date, suspension_date, graduation_date, enrolment_status, person_id) VALUES (4, 'ProgramD', 'ID004', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Inactive', 4) ON CONFLICT DO NOTHING;
INSERT INTO public.programme (id, programme_name, programme_identifier, registration_date, enrolment_date, suspension_date, graduation_date, enrolment_status, person_id) VALUES (5, 'ProgramE', 'ID005', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', '2022-01-01T11:20:00', 'Active', 5) ON CONFLICT DO NOTHING;


--
-- TOC entry 3489 (class 0 OID 16521)
-- Dependencies: 226
-- Data for Name: social_names; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.social_names (id, surname, given_name, second_name, maiden_name, prefix, suffix, social_person_id, person_id) VALUES (1, 'Doe', 'John', 'Middle', 'Maiden', 'Mr.', 'Jr.', 2, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.social_names (id, surname, given_name, second_name, maiden_name, prefix, suffix, social_person_id, person_id) VALUES (2, 'Smith', 'Alice', '', '', 'Ms.', 'Sr.', 1, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.social_names (id, surname, given_name, second_name, maiden_name, prefix, suffix, social_person_id, person_id) VALUES (3, 'Johnson', 'Robert', 'James', '', 'Dr.', 'PhD', 3, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.social_names (id, surname, given_name, second_name, maiden_name, prefix, suffix, social_person_id, person_id) VALUES (4, 'Brown', 'Emily', '', '', 'Mrs.', '', 5, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.social_names (id, surname, given_name, second_name, maiden_name, prefix, suffix, social_person_id, person_id) VALUES (5, 'Lee', 'David', '', '', 'Mr.', '', 4, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3486 (class 0 OID 16482)
-- Dependencies: 223
-- Data for Name: social_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.social_person (id, sex, birth_date, marital_status, is_disabled, disability_identifier_id, disability_type, functional_limitation_type, functional_severity, nationality, employment_status, is_deceased, death_date, ethnicity, phone_number, email, household_identifier, household_status, parent1_identifier_id, parent2_identifier_id, registration_date, last_updated, household_size, poverty_score) VALUES (1, 'male', '1990-01-01', 'S', 'No', 1, '{Physical}', '{None}', '{None}', '{US}', 'Employed', 'No', NULL, '{Caucasian}', '{123-456-7890}', '{john.doe@email.com}', 'Household1', 'Head', 2, 3, '2024-01-24', '2024-01-24', 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.social_person (id, sex, birth_date, marital_status, is_disabled, disability_identifier_id, disability_type, functional_limitation_type, functional_severity, nationality, employment_status, is_deceased, death_date, ethnicity, phone_number, email, household_identifier, household_status, parent1_identifier_id, parent2_identifier_id, registration_date, last_updated, household_size, poverty_score) VALUES (2, 'female', '1985-05-15', 'M', 'Yes', 2, '{Physical}', '{Mobility}', '{Moderate}', '{Canadian}', 'Unemployed', 'No', NULL, '{Asian}', '{987-654-3210}', '{jane.smith@email.com}', 'Household2', 'Spouse', 3, 5, '2024-01-23', '2024-01-23', 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.social_person (id, sex, birth_date, marital_status, is_disabled, disability_identifier_id, disability_type, functional_limitation_type, functional_severity, nationality, employment_status, is_deceased, death_date, ethnicity, phone_number, email, household_identifier, household_status, parent1_identifier_id, parent2_identifier_id, registration_date, last_updated, household_size, poverty_score) VALUES (3, 'male', '1978-08-20', 'D', 'No', NULL, '{None}', '{None}', '{None}', '{British}', 'Employed', 'No', NULL, '{African}', '{555-123-4567}', '{bob.jones@email.com}', 'Household3', 'S', 1, 4, '2024-01-22', '2024-01-22', 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.social_person (id, sex, birth_date, marital_status, is_disabled, disability_identifier_id, disability_type, functional_limitation_type, functional_severity, nationality, employment_status, is_deceased, death_date, ethnicity, phone_number, email, household_identifier, household_status, parent1_identifier_id, parent2_identifier_id, registration_date, last_updated, household_size, poverty_score) VALUES (4, 'female', '1995-12-10', 'S', 'Yes', 5, '{Hearing}', '{Communication}', '{Severe}', '{Indian}', 'Unemployed', 'No', NULL, '{Hispanic}', '{111-222-3333}', '{sara.jackson@email.com}', 'Household4', 'Head', 2, 3, '2024-01-21', '2024-01-21', 5, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.social_person (id, sex, birth_date, marital_status, is_disabled, disability_identifier_id, disability_type, functional_limitation_type, functional_severity, nationality, employment_status, is_deceased, death_date, ethnicity, phone_number, email, household_identifier, household_status, parent1_identifier_id, parent2_identifier_id, registration_date, last_updated, household_size, poverty_score) VALUES (5, 'male', '1980-03-25', 'M', 'No', 4, '{None}', '{None}', '{None}', '{American}', 'Employed', 'Yes', '2023-05-10', '{Other}', '{999-888-7777}', '{mike.williams@email.com}', 'Household5', 'Spouse', NULL, 2, '2024-01-20', '2024-01-20', 5, 6) ON CONFLICT DO NOTHING;


--
-- TOC entry 3487 (class 0 OID 16505)
-- Dependencies: 224
-- Data for Name: social_person_identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.social_person_identifier (social_person_id, identifier_id) VALUES (1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.social_person_identifier (social_person_id, identifier_id) VALUES (1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.social_person_identifier (social_person_id, identifier_id) VALUES (2, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.social_person_identifier (social_person_id, identifier_id) VALUES (2, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.social_person_identifier (social_person_id, identifier_id) VALUES (3, 5) ON CONFLICT DO NOTHING;


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 227
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 4, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 239
-- Name: address_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_seq', 1, false);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 217
-- Name: benefit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benefit_id_seq', 1, false);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 240
-- Name: benefit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benefit_seq', 1, false);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 237
-- Name: bounds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bounds_id_seq', 4, true);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 241
-- Name: bounds_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bounds_seq', 1, false);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 235
-- Name: geo_coordinate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geo_coordinate_id_seq', 4, true);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 242
-- Name: geo_coordinate_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geo_coordinate_seq', 1, false);


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 229
-- Name: geo_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geo_location_id_seq', 4, true);


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 243
-- Name: geo_location_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geo_location_seq', 1, false);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 233
-- Name: geometry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geometry_id_seq', 4, true);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 244
-- Name: geometry_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geometry_seq', 1, false);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 253
-- Name: ibr_person_view_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ibr_person_view_seq', 1, false);


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 211
-- Name: identifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.identifier_id_seq', 1, false);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 245
-- Name: identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.identifier_seq', 1, false);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 213
-- Name: names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.names_id_seq', 1, false);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 246
-- Name: names_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.names_seq', 1, false);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 219
-- Name: payroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payroll_id_seq', 1, false);


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 247
-- Name: payroll_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payroll_seq', 1, false);


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 209
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 1, false);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 248
-- Name: person_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_seq', 1, false);


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 249
-- Name: person_view_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_view_seq', 1, false);


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 231
-- Name: plus_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plus_code_id_seq', 4, true);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 250
-- Name: plus_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plus_code_seq', 1, false);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 215
-- Name: programme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programme_id_seq', 1, false);


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 251
-- Name: programme_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programme_seq', 1, false);


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 225
-- Name: social_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_names_id_seq', 1, false);


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 252
-- Name: social_names_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_names_seq', 1, false);


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 222
-- Name: social_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_person_id_seq', 5, true);


--
-- TOC entry 3301 (class 2606 OID 16538)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 16433)
-- Name: benefit benefit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefit
    ADD CONSTRAINT benefit_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 16598)
-- Name: bounds bounds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bounds
    ADD CONSTRAINT bounds_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 16586)
-- Name: geo_coordinate geo_coordinate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_coordinate
    ADD CONSTRAINT geo_coordinate_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 16550)
-- Name: geo_location geo_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_location
    ADD CONSTRAINT geo_location_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 16574)
-- Name: geometry geometry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 16397)
-- Name: identifier identifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identifier
    ADD CONSTRAINT identifier_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 16409)
-- Name: names names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 16445)
-- Name: payroll payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 16390)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 16562)
-- Name: plus_code plus_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plus_code
    ADD CONSTRAINT plus_code_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 16421)
-- Name: programme programme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programme
    ADD CONSTRAINT programme_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 16526)
-- Name: social_names social_names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_names
    ADD CONSTRAINT social_names_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 16509)
-- Name: social_person_identifier social_person_identifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_person_identifier
    ADD CONSTRAINT social_person_identifier_pkey PRIMARY KEY (social_person_id, identifier_id);


--
-- TOC entry 3293 (class 2606 OID 16489)
-- Name: social_person social_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_person
    ADD CONSTRAINT social_person_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 16629)
-- Name: social_names uk_k9fsubsqksohyki4f2p797j12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_names
    ADD CONSTRAINT uk_k9fsubsqksohyki4f2p797j12 UNIQUE (person_id);


--
-- TOC entry 3324 (class 2606 OID 16539)
-- Name: address address_social_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_social_person_id_fkey FOREIGN KEY (social_person_id) REFERENCES public.social_person(id);


--
-- TOC entry 3315 (class 2606 OID 16434)
-- Name: benefit benefit_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefit
    ADD CONSTRAINT benefit_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3331 (class 2606 OID 16609)
-- Name: bounds bounds_geometry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bounds
    ADD CONSTRAINT bounds_geometry_id_fkey FOREIGN KEY (geometry_id) REFERENCES public.geometry(id);


--
-- TOC entry 3329 (class 2606 OID 16599)
-- Name: bounds bounds_northeast_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bounds
    ADD CONSTRAINT bounds_northeast_id_fkey FOREIGN KEY (northeast_id) REFERENCES public.geo_coordinate(id);


--
-- TOC entry 3330 (class 2606 OID 16604)
-- Name: bounds bounds_southwest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bounds
    ADD CONSTRAINT bounds_southwest_id_fkey FOREIGN KEY (southwest_id) REFERENCES public.geo_coordinate(id);


--
-- TOC entry 3323 (class 2606 OID 16644)
-- Name: social_names fk3609spugwubeuqq3uv11x6bsi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_names
    ADD CONSTRAINT fk3609spugwubeuqq3uv11x6bsi FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3328 (class 2606 OID 16587)
-- Name: geo_coordinate geo_coordinate_geometry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_coordinate
    ADD CONSTRAINT geo_coordinate_geometry_id_fkey FOREIGN KEY (geometry_id) REFERENCES public.geometry(id);


--
-- TOC entry 3325 (class 2606 OID 16551)
-- Name: geo_location geo_location_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geo_location
    ADD CONSTRAINT geo_location_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 3327 (class 2606 OID 16575)
-- Name: geometry geometry_plus_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_plus_code_id_fkey FOREIGN KEY (plus_code_id) REFERENCES public.plus_code(id);


--
-- TOC entry 3312 (class 2606 OID 16398)
-- Name: identifier identifier_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identifier
    ADD CONSTRAINT identifier_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3313 (class 2606 OID 16410)
-- Name: names names_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3316 (class 2606 OID 16446)
-- Name: payroll payroll_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3326 (class 2606 OID 16563)
-- Name: plus_code plus_code_geo_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plus_code
    ADD CONSTRAINT plus_code_geo_location_id_fkey FOREIGN KEY (geo_location_id) REFERENCES public.geo_location(id);


--
-- TOC entry 3314 (class 2606 OID 16422)
-- Name: programme programme_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programme
    ADD CONSTRAINT programme_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3322 (class 2606 OID 16527)
-- Name: social_names social_names_social_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_names
    ADD CONSTRAINT social_names_social_person_id_fkey FOREIGN KEY (social_person_id) REFERENCES public.social_person(id);


--
-- TOC entry 3317 (class 2606 OID 16490)
-- Name: social_person social_person_disability_identifier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_person
    ADD CONSTRAINT social_person_disability_identifier_id_fkey FOREIGN KEY (disability_identifier_id) REFERENCES public.identifier(id);


--
-- TOC entry 3321 (class 2606 OID 16515)
-- Name: social_person_identifier social_person_identifier_identifier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_person_identifier
    ADD CONSTRAINT social_person_identifier_identifier_id_fkey FOREIGN KEY (identifier_id) REFERENCES public.identifier(id);


--
-- TOC entry 3320 (class 2606 OID 16510)
-- Name: social_person_identifier social_person_identifier_social_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_person_identifier
    ADD CONSTRAINT social_person_identifier_social_person_id_fkey FOREIGN KEY (social_person_id) REFERENCES public.social_person(id);


--
-- TOC entry 3318 (class 2606 OID 16495)
-- Name: social_person social_person_parent1_identifier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_person
    ADD CONSTRAINT social_person_parent1_identifier_id_fkey FOREIGN KEY (parent1_identifier_id) REFERENCES public.identifier(id);


--
-- TOC entry 3319 (class 2606 OID 16500)
-- Name: social_person social_person_parent2_identifier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_person
    ADD CONSTRAINT social_person_parent2_identifier_id_fkey FOREIGN KEY (parent2_identifier_id) REFERENCES public.identifier(id);


-- Completed on 2024-02-02 15:39:18 IST

--
-- PostgreSQL database dump complete
--

