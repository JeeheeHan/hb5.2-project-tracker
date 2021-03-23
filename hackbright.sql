--
-- PostgreSQL database dump
--

-- Dumped from database version 10.16 (Ubuntu 10.16-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.16 (Ubuntu 10.16-1.pgdg18.04+1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: grades; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.grades (
    github character varying(20),
    title character varying(20),
    grade character varying(20)
);


ALTER TABLE public.grades OWNER TO vagrant;

--
-- Name: project; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.project (
    id integer NOT NULL,
    title character varying(30),
    description text,
    max_grade integer
);


ALTER TABLE public.project OWNER TO vagrant;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO vagrant;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    github character varying(30)
);


ALTER TABLE public.students OWNER TO vagrant;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO vagrant;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.grades (github, title, grade) FROM stdin;
jhacks	Markov	10
Jtest	Sharkwords	50
Etest	Make cards	60
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.project (id, title, description, max_grade) FROM stdin;
1	Markov	Tweets generated from Markov chain	50
2	Sharkwords	word game using JS	45
3	Make cards	Make a card game	65
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.students (id, first_name, last_name, github) FROM stdin;
1	Jane	Hacker	jhacks
2	Jen	Test	Jtest
3	Jen	Test	Jtest
4	Emily	Test	Etest
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.project_id_seq', 3, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.students_id_seq', 4, true);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

