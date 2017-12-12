--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

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
-- Name: CartDetails; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE "CartDetails" (
    quantity integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CartId" integer NOT NULL,
    "ProductId" integer NOT NULL,
    "OptionId" integer
);


ALTER TABLE "CartDetails" OWNER TO admin;

--
-- Name: Carts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE "Carts" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer,
    total integer DEFAULT 0
);


ALTER TABLE "Carts" OWNER TO admin;

--
-- Name: Carts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE "Carts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Carts_id_seq" OWNER TO admin;

--
-- Name: Carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE "Carts_id_seq" OWNED BY "Carts".id;


--
-- Name: CatProds; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE "CatProds" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CategoryId" integer NOT NULL,
    "ProductId" integer NOT NULL
);


ALTER TABLE "CatProds" OWNER TO admin;

--
-- Name: Categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE "Categories" (
    id integer NOT NULL,
    type character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Categories" OWNER TO admin;

--
-- Name: Categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE "Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Categories_id_seq" OWNER TO admin;

--
-- Name: Categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE "Categories_id_seq" OWNED BY "Categories".id;


--
-- Name: Options; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE "Options" (
    id integer NOT NULL,
    option character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Options" OWNER TO admin;

--
-- Name: Options_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE "Options_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Options_id_seq" OWNER TO admin;

--
-- Name: Options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE "Options_id_seq" OWNED BY "Options".id;


--
-- Name: Products; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE "Products" (
    id integer NOT NULL,
    name character varying(255),
    quantity integer DEFAULT 1,
    cost double precision,
    url character varying(255),
    "UserId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Products" OWNER TO admin;

--
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE "Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Products_id_seq" OWNER TO admin;

--
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE "Products_id_seq" OWNED BY "Products".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE "SequelizeMeta" OWNER TO admin;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    "isAdmin" boolean DEFAULT false,
    password_hashed character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Users" OWNER TO admin;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE "Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Users_id_seq" OWNER TO admin;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: Carts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Carts" ALTER COLUMN id SET DEFAULT nextval('"Carts_id_seq"'::regclass);


--
-- Name: Categories id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Categories" ALTER COLUMN id SET DEFAULT nextval('"Categories_id_seq"'::regclass);


--
-- Name: Options id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Options" ALTER COLUMN id SET DEFAULT nextval('"Options_id_seq"'::regclass);


--
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Products" ALTER COLUMN id SET DEFAULT nextval('"Products_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: CartDetails; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY "CartDetails" (quantity, "createdAt", "updatedAt", "CartId", "ProductId", "OptionId") FROM stdin;
2	2017-12-06 00:41:46.854-05	2017-12-06 00:41:46.854-05	1	2	2
6	2017-12-06 03:05:00.278-05	2017-12-06 03:11:39.979-05	1	3	3
2	2017-12-06 18:14:09.004-05	2017-12-06 18:14:09.108-05	1	5	3
\.


--
-- Data for Name: Carts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY "Carts" (id, "createdAt", "updatedAt", "UserId", total) FROM stdin;
1	2017-12-05 21:49:43.122-05	2017-12-05 21:49:43.159-05	1	0
2	2017-12-05 21:49:46.084-05	2017-12-05 21:49:46.094-05	2	0
3	2017-12-05 21:49:49.422-05	2017-12-05 21:49:49.427-05	3	0
4	2017-12-08 16:00:55.766-05	2017-12-08 16:00:55.843-05	4	0
5	2017-12-08 17:29:37.703-05	2017-12-08 17:29:37.754-05	5	0
6	2017-12-08 17:37:08.069-05	2017-12-08 17:37:08.117-05	6	0
7	2017-12-08 17:47:01.779-05	2017-12-08 17:47:01.805-05	7	0
\.


--
-- Data for Name: CatProds; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY "CatProds" ("createdAt", "updatedAt", "CategoryId", "ProductId") FROM stdin;
2017-12-05 21:53:24.006-05	2017-12-05 21:53:24.006-05	1	1
2017-12-05 21:53:24.006-05	2017-12-05 21:53:24.006-05	3	1
2017-12-05 21:53:24.006-05	2017-12-05 21:53:24.006-05	10	1
2017-12-05 21:56:41.984-05	2017-12-05 21:56:41.984-05	2	2
2017-12-05 21:56:41.984-05	2017-12-05 21:56:41.984-05	11	2
2017-12-05 22:01:39.823-05	2017-12-05 22:01:39.823-05	1	3
2017-12-05 22:01:39.823-05	2017-12-05 22:01:39.823-05	5	3
2017-12-05 22:01:39.823-05	2017-12-05 22:01:39.823-05	12	3
2017-12-05 22:03:55.893-05	2017-12-05 22:03:55.893-05	1	4
2017-12-05 22:03:55.893-05	2017-12-05 22:03:55.893-05	3	4
2017-12-05 22:03:55.893-05	2017-12-05 22:03:55.893-05	5	4
2017-12-05 22:03:55.893-05	2017-12-05 22:03:55.893-05	13	4
2017-12-05 22:06:51.487-05	2017-12-05 22:06:51.487-05	1	5
2017-12-05 22:06:51.487-05	2017-12-05 22:06:51.487-05	12	5
2017-12-05 22:06:51.487-05	2017-12-05 22:06:51.487-05	14	5
2017-12-05 22:09:11.108-05	2017-12-05 22:09:11.108-05	2	6
2017-12-05 22:09:11.108-05	2017-12-05 22:09:11.108-05	3	6
2017-12-05 22:09:11.108-05	2017-12-05 22:09:11.108-05	7	6
2017-12-05 22:12:57.831-05	2017-12-05 22:12:57.831-05	2	7
2017-12-05 22:12:57.831-05	2017-12-05 22:12:57.831-05	5	7
2017-12-05 22:12:57.831-05	2017-12-05 22:12:57.831-05	12	7
2017-12-05 22:12:57.831-05	2017-12-05 22:12:57.831-05	14	7
2017-12-05 22:24:53.913-05	2017-12-05 22:24:53.913-05	1	8
2017-12-05 22:24:53.913-05	2017-12-05 22:24:53.913-05	5	8
2017-12-05 22:24:53.913-05	2017-12-05 22:24:53.913-05	13	8
2017-12-05 22:27:23.478-05	2017-12-05 22:27:23.478-05	12	9
2017-12-05 22:27:23.478-05	2017-12-05 22:27:23.478-05	16	9
2017-12-05 22:27:23.478-05	2017-12-05 22:27:23.478-05	2	9
2017-12-05 22:34:08.785-05	2017-12-05 22:34:08.785-05	2	10
2017-12-05 22:34:08.785-05	2017-12-05 22:34:08.785-05	4	10
\.


--
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY "Categories" (id, type, "createdAt", "updatedAt") FROM stdin;
1	Mens	2017-12-05 21:49:55.858-05	2017-12-05 21:49:55.858-05
2	Womens	2017-12-05 21:50:00.598-05	2017-12-05 21:50:00.598-05
3	Tops	2017-12-05 21:50:04.908-05	2017-12-05 21:50:04.908-05
4	Bottoms	2017-12-05 21:50:09.183-05	2017-12-05 21:50:09.183-05
5	Outerwear	2017-12-05 21:50:15.408-05	2017-12-05 21:50:15.408-05
6	Tees	2017-12-05 21:50:22.417-05	2017-12-05 21:50:22.417-05
7	Tanks	2017-12-05 21:50:30.083-05	2017-12-05 21:50:30.083-05
8	Jeans	2017-12-05 21:50:34.915-05	2017-12-05 21:50:34.915-05
9	Shorts	2017-12-05 21:50:38.68-05	2017-12-05 21:50:38.68-05
10	Polos	2017-12-05 21:52:58.349-05	2017-12-05 21:52:58.349-05
11	Dresses	2017-12-05 21:56:19.019-05	2017-12-05 21:56:19.019-05
12	Footwear	2017-12-05 22:01:17.387-05	2017-12-05 22:01:17.387-05
13	Jackets	2017-12-05 22:02:05.566-05	2017-12-05 22:02:05.566-05
14	Boots	2017-12-05 22:04:53.487-05	2017-12-05 22:04:53.487-05
15	Bags	2017-12-05 22:07:29.316-05	2017-12-05 22:07:29.316-05
16	Heels	2017-12-05 22:27:15.708-05	2017-12-05 22:27:15.708-05
\.


--
-- Data for Name: Options; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY "Options" (id, option, "createdAt", "updatedAt") FROM stdin;
1	Try	2017-12-05 21:53:24.006-05	2017-12-05 21:53:24.006-05
2	Rent	2017-12-05 21:53:24.006-05	2017-12-05 21:53:24.006-05
3	Buy	2017-12-05 21:53:24.006-05	2017-12-05 21:53:24.006-05
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY "Products" (id, name, quantity, cost, url, "UserId", "createdAt", "updatedAt") FROM stdin;
2	Red Dress	1	45	https://i2-prod.mirror.co.uk/incoming/article10965377.ece/ALTERNATES/s615b/Studio-By-Preen-Red-Dress.jpg	2	2017-12-05 21:56:41.944-05	2017-12-05 21:56:41.944-05
1	Black Polo Tee	3	13	https://images-na.ssl-images-amazon.com/images/I/61Xvh-9Pa7L._SY463_.jpg	1	2017-12-05 21:53:23.963-05	2017-12-05 21:53:23.963-05
3	Gucci Flip Flops	2	210	http://s3.amazonaws.com/hiphopdx-production/2016/10/Future-Scottie-Pippen-Gucci-Flip-Flop-780x585.jpg	1	2017-12-05 22:01:39.792-05	2017-12-05 22:01:39.792-05
4	All Saints Leather Jacker	3	610	https://images.allsaints.com/products/2500/ML016M/5/ML016M-5-1.jpg	3	2017-12-05 22:03:55.845-05	2017-12-05 22:03:55.845-05
5	Rick Owens SS18 Dirt Low Army Boot	2	1583	https://cdn.rickowens.eu/products/37039/large/RU18S5844LMV09_1.jpg	3	2017-12-05 22:06:51.463-05	2017-12-05 22:06:51.463-05
6	Prada Cami	4	244	https://images.yoox.com/12/12069453ts_14_f.jpg	2	2017-12-05 22:09:11.078-05	2017-12-05 22:09:11.078-05
7	Timberland Women's Velvet-Accent Preium Waterproof Boots	2	170	https://images.timberland.com/is/image/timberland/A1KHH001-HERO	1	2017-12-05 22:12:57.783-05	2017-12-05 22:12:57.783-05
8	Supreme/The North Face®Nuptse Jacket (Power Orange)	2	257	http://www.betternikebot.com/wp-content/uploads/2016/11/m9UNQrn_gX0.jpg	1	2017-12-05 22:24:53.799-05	2017-12-05 22:24:53.799-05
9	Frances Valentine Julia Pump	3	169	https://dsw.scene7.com/is/image/DSWShoes/417729_003_ss_01	2	2017-12-05 22:27:23.463-05	2017-12-05 22:27:23.463-05
10	Rachel Zoe Metallic Flare-Leg Pants	1	395	https://slimages.macysassets.com/is/image/MCY/products/8/optimized/9167768_fpx.tif	2	2017-12-05 22:34:08.685-05	2017-12-05 22:34:08.685-05
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY "SequelizeMeta" (name) FROM stdin;
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY "Users" (id, email, "isAdmin", password_hashed, "createdAt", "updatedAt") FROM stdin;
1	user1@test.com	f	$2a$10$MO8R5bTNOpg/9yTzsqx50e1HTSElg23wuWEJl.jtKNBXSgfaPhNTG	2017-12-05 21:49:42.92-05	2017-12-05 21:49:42.92-05
2	user2@test.com	f	$2a$10$BwHZ8R7qidxcgYl7kyOmQ.AwVG5ap4wWeSP6WZYLPVYAyLOhRSIV6	2017-12-05 21:49:45.926-05	2017-12-05 21:49:45.926-05
3	user3@test.com	f	$2a$10$8zo9mdPi2MESa4bvJc2f5uZ33vxmxu/dmd1bpeKRx1EaK9V2qmlFi	2017-12-05 21:49:49.253-05	2017-12-05 21:49:49.253-05
4	user4@test.com	t	$2a$10$me0ne73t6jqTJLBiX8Acxeoj5UjBVYpRnI7vl5AeoSzUJgBeoB3QC	2017-12-08 16:00:55.551-05	2017-12-08 16:00:55.551-05
5	newtest@test.com	f	$2a$10$xIGY/CFuRQyslCFC.fwFPOdPPbiKyRIbYe064o6wDgoXQw2usGIt.	2017-12-08 17:29:37.503-05	2017-12-08 17:29:37.503-05
6	test@test.test	f	$2a$10$jcYREo6xR6nJSN/CCIvWN.49ZozZT3riXbIIR4ZBnG1VjS0Ko3squ	2017-12-08 17:37:07.861-05	2017-12-08 17:37:07.861-05
7	test@test.com	f	$2a$10$wTRvRyNZzbhoOlSSbwKIGOd0K3uLGHV1aDcM65RyrUVYVeZlAEySS	2017-12-08 17:47:01.595-05	2017-12-08 17:47:01.595-05
\.


--
-- Name: Carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('"Carts_id_seq"', 7, true);


--
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('"Categories_id_seq"', 16, true);


--
-- Name: Options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('"Options_id_seq"', 1, false);


--
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('"Products_id_seq"', 10, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('"Users_id_seq"', 7, true);


--
-- Name: CartDetails CartDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "CartDetails"
    ADD CONSTRAINT "CartDetails_pkey" PRIMARY KEY ("CartId", "ProductId");


--
-- Name: Carts Carts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Carts"
    ADD CONSTRAINT "Carts_pkey" PRIMARY KEY (id);


--
-- Name: CatProds CatProds_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "CatProds"
    ADD CONSTRAINT "CatProds_pkey" PRIMARY KEY ("CategoryId", "ProductId");


--
-- Name: Categories Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);


--
-- Name: Options Options_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Options"
    ADD CONSTRAINT "Options_pkey" PRIMARY KEY (id);


--
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: users_email; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX users_email ON "Users" USING btree (email);


--
-- Name: CartDetails CartDetails_CartId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "CartDetails"
    ADD CONSTRAINT "CartDetails_CartId_fkey" FOREIGN KEY ("CartId") REFERENCES "Carts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CartDetails CartDetails_OptionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "CartDetails"
    ADD CONSTRAINT "CartDetails_OptionId_fkey" FOREIGN KEY ("OptionId") REFERENCES "Options"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CartDetails CartDetails_ProductId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "CartDetails"
    ADD CONSTRAINT "CartDetails_ProductId_fkey" FOREIGN KEY ("ProductId") REFERENCES "Products"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Carts Carts_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Carts"
    ADD CONSTRAINT "Carts_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CatProds CatProds_CategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "CatProds"
    ADD CONSTRAINT "CatProds_CategoryId_fkey" FOREIGN KEY ("CategoryId") REFERENCES "Categories"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CatProds CatProds_ProductId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "CatProds"
    ADD CONSTRAINT "CatProds_ProductId_fkey" FOREIGN KEY ("ProductId") REFERENCES "Products"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Products Products_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY "Products"
    ADD CONSTRAINT "Products_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

