--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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

SET default_table_access_method = heap;

--
-- Name: applicants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicants (
    id integer NOT NULL,
    speciality character varying(255),
    salary integer,
    experience integer,
    resume_text character varying,
    phone_number character varying(50),
    email character varying(50),
    is_archived boolean,
    created_at timestamp without time zone,
    user_id integer
);


ALTER TABLE public.applicants OWNER TO postgres;

--
-- Name: applicants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicants_id_seq OWNER TO postgres;

--
-- Name: applicants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicants_id_seq OWNED BY public.applicants.id;


--
-- Name: employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(255),
    company_description character varying,
    contact character varying(255),
    website character varying(255),
    is_confirmed boolean,
    created_at timestamp without time zone,
    user_id integer
);


ALTER TABLE public.employers OWNER TO postgres;

--
-- Name: employers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employers_id_seq OWNER TO postgres;

--
-- Name: employers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employers_id_seq OWNED BY public.employers.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    created_at timestamp without time zone,
    applicant_id integer,
    vacancy_id integer
);


ALTER TABLE public.feedbacks OWNER TO postgres;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedbacks_id_seq OWNER TO postgres;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    surname character varying(255),
    phone_number character varying(50),
    email character varying(50),
    password character varying,
    role character varying(30),
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vacancies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancies (
    id integer NOT NULL,
    name character varying(255),
    description character varying,
    place character varying(255),
    salary integer,
    experience integer,
    tags character varying(50)[],
    is_confirmed boolean,
    is_archived boolean,
    created_at timestamp without time zone,
    employer_id integer
);


ALTER TABLE public.vacancies OWNER TO postgres;

--
-- Name: vacancies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacancies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vacancies_id_seq OWNER TO postgres;

--
-- Name: vacancies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacancies_id_seq OWNED BY public.vacancies.id;


--
-- Name: applicants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants ALTER COLUMN id SET DEFAULT nextval('public.applicants_id_seq'::regclass);


--
-- Name: employers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers ALTER COLUMN id SET DEFAULT nextval('public.employers_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vacancies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);


--
-- Data for Name: applicants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicants (id, speciality, salary, experience, resume_text, phone_number, email, is_archived, created_at, user_id) FROM stdin;
1	java	2000000	1	tôi là ứng viên test cho web	098765445	hieudk@gmail.com	f	2025-01-17 22:12:25.056031	8
2	java	2000000	1	tôi là tien nguyen học KHTN gpt 3.9	098765733	tiennguyen@gmail.com	f	2025-01-17 22:51:49.725683	9
\.


--
-- Data for Name: employers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employers (id, company_name, company_description, contact, website, is_confirmed, created_at, user_id) FROM stdin;
1	CongTyX	Công ty X cung cấp giải pháp về chứng khoán	congtyx@gmail.com	congtyx.com	t	2025-01-17 21:39:59.464689	3
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedbacks (id, created_at, applicant_id, vacancy_id) FROM stdin;
1	2025-01-17 22:21:51.052414	1	5
2	2025-01-17 23:01:04.612246	2	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, surname, phone_number, email, password, role, created_at) FROM stdin;
2	Vuong	Ha	0987654444	vuongha@gmail.com	$2b$12$zdXfO6G0bfVTQNz0eWTvEuQXleryHcFG6jEHbt5MVi4JG2yKwnl4q	user	2025-01-17 21:37:36.280017
1	admin	Quản trị	0987654321	admin@gmail.com	$2b$12$zdXfO6G0bfVTQNz0eWTvEuQXleryHcFG6jEHbt5MVi4JG2yKwnl4q	admin	2025-01-17 21:38:39
3	user	mot	0987654322	usermot@gmail.com	$2b$12$yeKfc.wWht3g16WP3LnbauaQUq0ax1mNvfXEUCCHZFWope21nNy3y	employer	2025-01-17 21:39:29.11946
4	user	hai	0987654323	usermothai@gmail.com	$2b$12$rVSPT3j1OTYqjIysQpO9UuBDS0hYsOIKONKB5ZUJZV7pAM4jS5Gm.	user	2025-01-17 21:42:15.49803
5	Hai	Nam Pham	098765422	namhaipham@gmail.com	$2b$12$3wDXBEcwzHUH36OsD/I1M.MfvPfeUAcXZPSiUVrhR39M0GB3SkzKa	user	2025-01-17 21:45:13.287006
6	Dung	Đinh Quang	0987654378	dinhquangdung@gmail.com	$2b$12$x7VlYnM8iJkLAQHiQ3oJUu8qQHoIXqFTtwxvHVJTyQO7yK/1sLdHK	user	2025-01-17 21:47:32.000558
7	user	test	0987326423	testusermot@gmail.com	$2b$12$jthDbVrimpgJUlw2doCXI.ZW.tzxm1zU1wFb0aR4GBxn9hD95/nJa	user	2025-01-17 22:07:07.663037
8	Hiếu	Nguyễn	098765445	hieudk@gmail.com	$2b$12$vCbZcmijHW0yiSQkx5x9Vu9ZowlPCkH.RNMi4l3tW5x9su0ZIKWw2	applicant	2025-01-17 22:09:37.397291
9	Tien	Nguyen	098765733	tiennguyen@gmail.com	$2b$12$l2wr.YEPBbhf2HY48aq6d.8jTNVGw/m6AVj88UH50Sbio2jLWwE4K	applicant	2025-01-17 22:49:57.921816
\.


--
-- Data for Name: vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancies (id, name, description, place, salary, experience, tags, is_confirmed, is_archived, created_at, employer_id) FROM stdin;
1	Devops Engineer	Sử dụng Jenkins cho CI CD	Hà Nội	10000000	1	{Web}	t	f	2025-01-17 21:41:19.784935	1
2	Java Senior	Làm web cho công ty, dự án nước ngoài	Hồ Chí Minh	32000000	7	{web}	t	f	2025-01-17 21:59:03.416248	1
3	Ai Engineer	Thiết kế AI cho thiết bị ngoài trời, siêu thị, sân bóng	Đà Nẵng	2000000	0	{AI}	t	f	2025-01-17 22:02:55.906951	1
4	Php	triển khai php cho web công ty	Hà Nội	3500000	0	{Web}	t	f	2025-01-17 22:04:19.106642	1
5	Java Intern	xây dựng ứng dụng cho doanh nghiệp	Đà Nẵng	5000000	1	{Web}	t	f	2025-01-17 22:05:15.776085	1
7	Nodejs	CÔng việc làm nodejs về web	Hồ Chí Minh	5000000	1	{web}	t	f	2025-01-17 22:15:36.383853	1
6	Data Scientist Junior	Xây dựng mô hình thuật toán cho công ty	Hồ Chí Minh	17000000	2	{AI,Data}	t	f	2025-01-17 22:06:07.965462	1
8	Data Analyst	phân tích yêu cầu khách hàng	Đà Nẵng	5000000	1	{data}	t	f	2025-01-17 22:56:10.200987	1
\.


--
-- Name: applicants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicants_id_seq', 2, true);


--
-- Name: employers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employers_id_seq', 1, true);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: vacancies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacancies_id_seq', 8, true);


--
-- Name: applicants applicants_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants
    ADD CONSTRAINT applicants_email_key UNIQUE (email);


--
-- Name: applicants applicants_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants
    ADD CONSTRAINT applicants_phone_number_key UNIQUE (phone_number);


--
-- Name: applicants applicants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants
    ADD CONSTRAINT applicants_pkey PRIMARY KEY (id);


--
-- Name: employers employers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_number_key UNIQUE (phone_number);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vacancies vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);


--
-- Name: applicants applicants_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants
    ADD CONSTRAINT applicants_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: employers employers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: feedbacks feedbacks_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicants(id);


--
-- Name: feedbacks feedbacks_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- Name: vacancies vacancies_employer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_employer_id_fkey FOREIGN KEY (employer_id) REFERENCES public.employers(id);


--
-- PostgreSQL database dump complete
--

