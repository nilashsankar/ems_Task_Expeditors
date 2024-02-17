--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2024-02-17 22:23:44

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 204 (class 1259 OID 16950)
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
-- TOC entry 208 (class 1259 OID 16990)
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
-- TOC entry 207 (class 1259 OID 16988)
-- Name: expense_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expense_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expense_detail_id_seq OWNER TO postgres;

--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 207
-- Name: expense_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expense_detail_id_seq OWNED BY public.expense_detail.id;


--
-- TOC entry 206 (class 1259 OID 16978)
-- Name: expense_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expense_status (
    id integer NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.expense_status OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16968)
-- Name: expense_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expense_type (
    id integer NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.expense_type OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16940)
-- Name: hiring_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hiring_status (
    id integer NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.hiring_status OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16868)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16898)
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
-- TOC entry 202 (class 1259 OID 16914)
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
-- TOC entry 201 (class 1259 OID 16912)
-- Name: task_allocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_allocation_id_seq OWNER TO postgres;

--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 201
-- Name: task_allocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_allocation_id_seq OWNED BY public.task_allocation.id;


--
-- TOC entry 199 (class 1259 OID 16896)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO postgres;

--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 199
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- TOC entry 198 (class 1259 OID 16880)
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
-- TOC entry 197 (class 1259 OID 16878)
-- Name: user_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_detail_id_seq OWNER TO postgres;

--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_detail_id_seq OWNED BY public.user_detail.id;


--
-- TOC entry 2735 (class 2604 OID 16993)
-- Name: expense_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail ALTER COLUMN id SET DEFAULT nextval('public.expense_detail_id_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 16901)
-- Name: task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 16917)
-- Name: task_allocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation ALTER COLUMN id SET DEFAULT nextval('public.task_allocation_id_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 16883)
-- Name: user_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detail ALTER COLUMN id SET DEFAULT nextval('public.user_detail_id_seq'::regclass);


--
-- TOC entry 2906 (class 0 OID 16950)
-- Dependencies: 204
-- Data for Name: candidate; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2910 (class 0 OID 16990)
-- Dependencies: 208
-- Data for Name: expense_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2908 (class 0 OID 16978)
-- Dependencies: 206
-- Data for Name: expense_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.expense_status VALUES (1, 'Accepted');
INSERT INTO public.expense_status VALUES (2, 'Rejected');
INSERT INTO public.expense_status VALUES (3, 'Amount credited');


--
-- TOC entry 2907 (class 0 OID 16968)
-- Dependencies: 205
-- Data for Name: expense_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.expense_type VALUES (1, 'Holidays');
INSERT INTO public.expense_type VALUES (2, 'Team Lunch');
INSERT INTO public.expense_type VALUES (3, 'Travel');
INSERT INTO public.expense_type VALUES (4, 'Business');


--
-- TOC entry 2905 (class 0 OID 16940)
-- Dependencies: 203
-- Data for Name: hiring_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hiring_status VALUES (1, 'Waiting');
INSERT INTO public.hiring_status VALUES (2, 'Selected');
INSERT INTO public.hiring_status VALUES (3, 'On hold');
INSERT INTO public.hiring_status VALUES (4, 'Rejected');
INSERT INTO public.hiring_status VALUES (5, 'User created');


--
-- TOC entry 2898 (class 0 OID 16868)
-- Dependencies: 196
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role VALUES (1, 'Manager');
INSERT INTO public.role VALUES (2, 'Developer');
INSERT INTO public.role VALUES (3, 'Admin');
INSERT INTO public.role VALUES (4, 'Accountant');


--
-- TOC entry 2902 (class 0 OID 16898)
-- Dependencies: 200
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2904 (class 0 OID 16914)
-- Dependencies: 202
-- Data for Name: task_allocation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2900 (class 0 OID 16880)
-- Dependencies: 198
-- Data for Name: user_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_detail VALUES (1, 'nilash', 'nilash@gmail.com', 3, '2024-02-15 05:20:59');
INSERT INTO public.user_detail VALUES (3, 'daya', 'daya@gamil.com', 1, '2024-02-15 23:28:53.185628');
INSERT INTO public.user_detail VALUES (4, 'yogi', 'yogi@gamil.com', 1, '2024-02-16 10:01:40.694879');


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 207
-- Name: expense_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expense_detail_id_seq', 1, false);


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 201
-- Name: task_allocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_allocation_id_seq', 1, false);


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 199
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_id_seq', 1, false);


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_detail_id_seq', 4, true);


--
-- TOC entry 2755 (class 2606 OID 16957)
-- Name: candidate candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 16998)
-- Name: expense_detail expense_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT expense_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 16985)
-- Name: expense_status expense_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_status
    ADD CONSTRAINT expense_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 16987)
-- Name: expense_status expense_status_status_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_status
    ADD CONSTRAINT expense_status_status_key UNIQUE (status);


--
-- TOC entry 2757 (class 2606 OID 16975)
-- Name: expense_type expense_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_type
    ADD CONSTRAINT expense_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 16977)
-- Name: expense_type expense_type_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_type
    ADD CONSTRAINT expense_type_type_key UNIQUE (type);


--
-- TOC entry 2751 (class 2606 OID 16947)
-- Name: hiring_status hiring_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring_status
    ADD CONSTRAINT hiring_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 16949)
-- Name: hiring_status hiring_status_status_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring_status
    ADD CONSTRAINT hiring_status_status_key UNIQUE (status);


--
-- TOC entry 2737 (class 2606 OID 16877)
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 2739 (class 2606 OID 16875)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 16922)
-- Name: task_allocation task_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT task_allocation_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 16924)
-- Name: task_allocation task_allocation_task_id_developer_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT task_allocation_task_id_developer_id_key UNIQUE (task_id, developer_id);


--
-- TOC entry 2745 (class 2606 OID 16906)
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 16890)
-- Name: user_detail user_detail_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT user_detail_email_key UNIQUE (email);


--
-- TOC entry 2743 (class 2606 OID 16888)
-- Name: user_detail user_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT user_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 16958)
-- Name: candidate fk_candidate_interviewer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk_candidate_interviewer_id FOREIGN KEY (interviewer_id) REFERENCES public.user_detail(id);


--
-- TOC entry 2772 (class 2606 OID 16963)
-- Name: candidate fk_candidate_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk_candidate_status_id FOREIGN KEY (status_id) REFERENCES public.hiring_status(id);


--
-- TOC entry 2776 (class 2606 OID 17014)
-- Name: expense_detail fk_expense_detail_accounted_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_accounted_by FOREIGN KEY (accounted_by) REFERENCES public.user_detail(id);


--
-- TOC entry 2774 (class 2606 OID 17004)
-- Name: expense_detail fk_expense_detail_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_status_id FOREIGN KEY (status_id) REFERENCES public.expense_status(id);


--
-- TOC entry 2775 (class 2606 OID 17009)
-- Name: expense_detail fk_expense_detail_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_type_id FOREIGN KEY (type_id) REFERENCES public.expense_type(id);


--
-- TOC entry 2773 (class 2606 OID 16999)
-- Name: expense_detail fk_expense_detail_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_detail
    ADD CONSTRAINT fk_expense_detail_user_id FOREIGN KEY (user_id) REFERENCES public.user_detail(id);


--
-- TOC entry 2770 (class 2606 OID 16935)
-- Name: task_allocation fk_task_allocation_assigned_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_assigned_by FOREIGN KEY (assigned_by) REFERENCES public.user_detail(id);


--
-- TOC entry 2769 (class 2606 OID 16930)
-- Name: task_allocation fk_task_allocation_developer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_developer_id FOREIGN KEY (developer_id) REFERENCES public.user_detail(id);


--
-- TOC entry 2768 (class 2606 OID 16925)
-- Name: task_allocation fk_task_allocation_task_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_allocation
    ADD CONSTRAINT fk_task_allocation_task_id FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- TOC entry 2767 (class 2606 OID 16907)
-- Name: task fk_task_created_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT fk_task_created_by FOREIGN KEY (created_by) REFERENCES public.user_detail(id);


--
-- TOC entry 2766 (class 2606 OID 16891)
-- Name: user_detail fk_user_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_detail
    ADD CONSTRAINT fk_user_role_id FOREIGN KEY (role_id) REFERENCES public.role(id);


-- Completed on 2024-02-17 22:23:45

--
-- PostgreSQL database dump complete
--

