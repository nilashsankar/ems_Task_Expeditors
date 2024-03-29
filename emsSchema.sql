--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-22 00:12:29

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16612)
-- Name: candidate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    interviewer_id integer NOT NULL,
    status_id integer NOT NULL,
    scheduled_at timestamp without time zone NOT NULL
);


ALTER TABLE public.candidate OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16648)
-- Name: expense_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expense_detail (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type_id integer NOT NULL,
    status_id integer NOT NULL,
    spent_at timestamp without time zone NOT NULL,
    amount double precision,
    description character varying NOT NULL,
    accounted_at timestamp without time zone NOT NULL,
    accounted_by integer,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.expense_detail OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16647)
-- Name: expense_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expense_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expense_detail_id_seq OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 226
-- Name: expense_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expense_detail_id_seq OWNED BY public.expense_detail.id;


--
-- TOC entry 225 (class 1259 OID 16638)
-- Name: expense_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expense_status (
    id integer NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.expense_status OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16629)
-- Name: expense_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expense_type (
    id integer NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.expense_type OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16603)
-- Name: hiring_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hiring_status (
    id integer NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.hiring_status OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16538)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16564)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by integer NOT NULL
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16578)
-- Name: task_allocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_allocation (
    id integer NOT NULL,
    task_id integer NOT NULL,
    developer_id integer NOT NULL,
    assigned_by integer NOT NULL,
    assigned_at timestamp without time zone NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.task_allocation OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16577)
-- Name: task_allocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_allocation_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 220
-- Name: task_allocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_allocation_id_seq OWNED BY public.task_allocation.id;


--
-- TOC entry 218 (class 1259 OID 16563)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 218
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- TOC entry 217 (class 1259 OID 16548)
-- Name: user_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_detail (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_detail OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16547)
-- Name: user_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_detail_id_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_detail_id_seq OWNED BY public.user_detail.id;


--
-- TOC entry 4726 (class 2604 OID 16651)
-- Name: expense_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail ALTER COLUMN id SET DEFAULT nextval('public.expense_detail_id_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 16567)
-- Name: task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 16581)
-- Name: task_allocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation ALTER COLUMN id SET DEFAULT nextval('public.task_allocation_id_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 16551)
-- Name: user_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detail ALTER COLUMN id SET DEFAULT nextval('public.user_detail_id_seq'::regclass);


--
-- TOC entry 4919 (class 0 OID 16612)
-- Dependencies: 223
-- Data for Name: candidate; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4923 (class 0 OID 16648)
-- Dependencies: 227
-- Data for Name: expense_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4921 (class 0 OID 16638)
-- Dependencies: 225
-- Data for Name: expense_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.expense_status VALUES (1, 'Accepted');
INSERT INTO public.expense_status VALUES (2, 'Rejected');
INSERT INTO public.expense_status VALUES (3, 'Amount credited');


--
-- TOC entry 4920 (class 0 OID 16629)
-- Dependencies: 224
-- Data for Name: expense_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.expense_type VALUES (1, 'Holidays');
INSERT INTO public.expense_type VALUES (2, 'Team Lunch');
INSERT INTO public.expense_type VALUES (3, 'Travel');
INSERT INTO public.expense_type VALUES (4, 'Business');


--
-- TOC entry 4918 (class 0 OID 16603)
-- Dependencies: 222
-- Data for Name: hiring_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hiring_status VALUES (1, 'Waiting');
INSERT INTO public.hiring_status VALUES (2, 'Selected');
INSERT INTO public.hiring_status VALUES (3, 'On hold');
INSERT INTO public.hiring_status VALUES (4, 'Rejected');
INSERT INTO public.hiring_status VALUES (5, 'User created');


--
-- TOC entry 4911 (class 0 OID 16538)
-- Dependencies: 215
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role VALUES (1, 'Manager');
INSERT INTO public.role VALUES (2, 'Developer');
INSERT INTO public.role VALUES (3, 'Admin');
INSERT INTO public.role VALUES (4, 'Accountant');


--
-- TOC entry 4915 (class 0 OID 16564)
-- Dependencies: 219
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.task VALUES (1, 'RC application ', 'test rc application', '2024-02-01 01:01:04', 3);
INSERT INTO public.task VALUES (2, 'Apple Vision Pro application ', 'test Apple application', '2024-02-01 01:01:05', 3);


--
-- TOC entry 4917 (class 0 OID 16578)
-- Dependencies: 221
-- Data for Name: task_allocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.task_allocation VALUES (2, 2, 4, 3, '2024-02-01 01:01:10', 'Incomplete');
INSERT INTO public.task_allocation VALUES (4, 1, 5, 3, '2024-02-01 01:01:33', 'Completed');
INSERT INTO public.task_allocation VALUES (1, 1, 4, 3, '2024-02-01 01:01:09', 'Completed');
INSERT INTO public.task_allocation VALUES (5, 2, 5, 3, '2024-02-01 01:22:22', 'Completed');


--
-- TOC entry 4913 (class 0 OID 16548)
-- Dependencies: 217
-- Data for Name: user_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_detail VALUES (1, 'nilash', 'nilash@@gmail.com', 3, '2024-02-01 01:01:01');
INSERT INTO public.user_detail VALUES (3, 'daya', 'daya@gmail.com', 1, '2024-02-01 01:01:01');
INSERT INTO public.user_detail VALUES (4, 'rocket', 'roc@gmail.com', 2, '2024-02-01 01:01:01');
INSERT INTO public.user_detail VALUES (5, 'luffy', 'luff@gmail.com', 2, '2024-02-01 01:01:59');


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 226
-- Name: expense_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expense_detail_id_seq', 1, false);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 220
-- Name: task_allocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_allocation_id_seq', 5, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 218
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_id_seq', 2, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_detail_id_seq', 5, true);


--
-- TOC entry 4746 (class 2606 OID 16618)
-- Name: candidate candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (id);


--
-- TOC entry 4756 (class 2606 OID 16655)
-- Name: expense_detail expense_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT expense_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 16644)
-- Name: expense_status expense_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_status
    ADD CONSTRAINT expense_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4754 (class 2606 OID 16646)
-- Name: expense_status expense_status_status_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_status
    ADD CONSTRAINT expense_status_status_key UNIQUE (status);


--
-- TOC entry 4748 (class 2606 OID 16635)
-- Name: expense_type expense_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_type
    ADD CONSTRAINT expense_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4750 (class 2606 OID 16637)
-- Name: expense_type expense_type_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_type
    ADD CONSTRAINT expense_type_type_key UNIQUE (type);


--
-- TOC entry 4742 (class 2606 OID 16609)
-- Name: hiring_status hiring_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring_status
    ADD CONSTRAINT hiring_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4744 (class 2606 OID 16611)
-- Name: hiring_status hiring_status_status_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring_status
    ADD CONSTRAINT hiring_status_status_key UNIQUE (status);


--
-- TOC entry 4728 (class 2606 OID 16546)
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 4730 (class 2606 OID 16544)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16585)
-- Name: task_allocation task_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT task_allocation_pkey PRIMARY KEY (id);


--
-- TOC entry 4740 (class 2606 OID 16587)
-- Name: task_allocation task_allocation_task_id_developer_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT task_allocation_task_id_developer_id_key UNIQUE (task_id, developer_id);


--
-- TOC entry 4736 (class 2606 OID 16571)
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 16557)
-- Name: user_detail user_detail_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT user_detail_email_key UNIQUE (email);


--
-- TOC entry 4734 (class 2606 OID 16555)
-- Name: user_detail user_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT user_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 4762 (class 2606 OID 16619)
-- Name: candidate fk_candidate_interviewer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk_candidate_interviewer_id FOREIGN KEY (interviewer_id) REFERENCES public.user_detail(id);


--
-- TOC entry 4763 (class 2606 OID 16624)
-- Name: candidate fk_candidate_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk_candidate_status_id FOREIGN KEY (status_id) REFERENCES public.hiring_status(id);


--
-- TOC entry 4764 (class 2606 OID 16671)
-- Name: expense_detail fk_expense_detail_accounted_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_accounted_by FOREIGN KEY (accounted_by) REFERENCES public.user_detail(id);


--
-- TOC entry 4765 (class 2606 OID 16661)
-- Name: expense_detail fk_expense_detail_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_status_id FOREIGN KEY (status_id) REFERENCES public.expense_status(id);


--
-- TOC entry 4766 (class 2606 OID 16666)
-- Name: expense_detail fk_expense_detail_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_type_id FOREIGN KEY (type_id) REFERENCES public.expense_type(id);


--
-- TOC entry 4767 (class 2606 OID 16656)
-- Name: expense_detail fk_expense_detail_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_user_id FOREIGN KEY (user_id) REFERENCES public.user_detail(id);


--
-- TOC entry 4759 (class 2606 OID 16598)
-- Name: task_allocation fk_task_allocation_assigned_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_assigned_by FOREIGN KEY (assigned_by) REFERENCES public.user_detail(id);


--
-- TOC entry 4760 (class 2606 OID 16593)
-- Name: task_allocation fk_task_allocation_developer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_developer_id FOREIGN KEY (developer_id) REFERENCES public.user_detail(id);


--
-- TOC entry 4761 (class 2606 OID 16588)
-- Name: task_allocation fk_task_allocation_task_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_task_id FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- TOC entry 4758 (class 2606 OID 16572)
-- Name: task fk_task_created_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT fk_task_created_by FOREIGN KEY (created_by) REFERENCES public.user_detail(id);


--
-- TOC entry 4757 (class 2606 OID 16558)
-- Name: user_detail fk_user_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT fk_user_role_id FOREIGN KEY (role_id) REFERENCES public.role(id);


-- Completed on 2024-02-22 00:12:30

--
-- PostgreSQL database dump complete
--

