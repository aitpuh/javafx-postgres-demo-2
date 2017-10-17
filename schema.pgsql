--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.23
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: demo_user
--

CREATE TABLE tasks (
    task_id integer NOT NULL,
    description text,
    duedate timestamp without time zone,
    complete boolean DEFAULT false
);


ALTER TABLE tasks OWNER TO demo_user;

--
-- Name: tasks_task_id_seq; Type: SEQUENCE; Schema: public; Owner: demo_user
--

CREATE SEQUENCE tasks_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_task_id_seq OWNER TO demo_user;

--
-- Name: tasks_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo_user
--

ALTER SEQUENCE tasks_task_id_seq OWNED BY tasks.task_id;


--
-- Name: user_tasks; Type: TABLE; Schema: public; Owner: demo_user
--

CREATE TABLE user_tasks (
    user_id integer NOT NULL,
    task_id integer NOT NULL
);


ALTER TABLE user_tasks OWNER TO demo_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: demo_user
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(25)
);


ALTER TABLE users OWNER TO demo_user;

--
-- Name: tasks task_id; Type: DEFAULT; Schema: public; Owner: demo_user
--

ALTER TABLE ONLY tasks ALTER COLUMN task_id SET DEFAULT nextval('tasks_task_id_seq'::regclass);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: demo_user
--

COPY tasks (task_id, description, duedate, complete) FROM stdin;
4	Hi	2017-10-26 00:00:00	t
2	New Task	2017-10-10 00:00:00	f
3	New Task	2017-10-10 00:00:00	f
1	Sample task	2017-10-10 15:56:03.227	t
5	Asdf	2017-10-11 00:00:00	f
\.


--
-- Name: tasks_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo_user
--

SELECT pg_catalog.setval('tasks_task_id_seq', 5, true);


--
-- Data for Name: user_tasks; Type: TABLE DATA; Schema: public; Owner: demo_user
--

COPY user_tasks (user_id, task_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: demo_user
--

COPY users (id, name) FROM stdin;
\.


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: demo_user
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (task_id);


--
-- Name: user_tasks user_tasks_pk; Type: CONSTRAINT; Schema: public; Owner: demo_user
--

ALTER TABLE ONLY user_tasks
    ADD CONSTRAINT user_tasks_pk PRIMARY KEY (user_id, task_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: demo_user
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

