--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: Bitki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bitki" (
    "bitkiTipi" text NOT NULL,
    "tohumSayısı" text NOT NULL,
    "bitkiÖzellikleri" text NOT NULL
);


ALTER TABLE public."Bitki" OWNER TO postgres;

--
-- Name: Damlama Sistemi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Damlama Sistemi" (
    "damlamaAraligi" integer NOT NULL,
    "suMiktarı" integer NOT NULL,
    "muslukSayisi" integer NOT NULL
);


ALTER TABLE public."Damlama Sistemi" OWNER TO postgres;

--
-- Name: Destek Birimi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Destek Birimi" (
    "telefonNo" integer NOT NULL,
    email character varying NOT NULL,
    "calismaSaatleri" date NOT NULL,
    "calisanSayisi" integer NOT NULL
);


ALTER TABLE public."Destek Birimi" OWNER TO postgres;

--
-- Name: Gübreleme Sistemi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Gübreleme Sistemi" (
    "gübreTürü" character varying NOT NULL,
    "gübreMiktarı" character varying NOT NULL,
    "gübreYoğunluğu" character varying NOT NULL,
    "toprakMiktarı" integer NOT NULL,
    "bitkiTipi" text NOT NULL
);


ALTER TABLE public."Gübreleme Sistemi" OWNER TO postgres;

--
-- Name: Havalandırma Sistemi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Havalandırma Sistemi" (
    "ortamdakiCO2" text NOT NULL,
    "ortamdakiO2" text NOT NULL,
    "icSıcaklık" text NOT NULL
);


ALTER TABLE public."Havalandırma Sistemi" OWNER TO postgres;

--
-- Name: Işık Sensörü; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Işık Sensörü" (
    "alınanIşıkMiktarı" integer NOT NULL,
    "ışıkAlmaSüresi" integer NOT NULL
);


ALTER TABLE public."Işık Sensörü" OWNER TO postgres;

--
-- Name: Konum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Konum" (
    "seraKonumu" text NOT NULL,
    "bulunduğuİl" text NOT NULL,
    "bulunduguİlce" text NOT NULL
);


ALTER TABLE public."Konum" OWNER TO postgres;

--
-- Name: Kullanıcı; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kullanıcı" (
    "kullanıcıNo" character varying NOT NULL,
    "seraSayısı" character varying NOT NULL,
    "yetiştirilenBitkiler" character varying NOT NULL,
    "seraKonumu" character varying NOT NULL
);


ALTER TABLE public."Kullanıcı" OWNER TO postgres;

--
-- Name: Nem Ölçer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Nem Ölçer" (
    "havadakiNem" text NOT NULL,
    "icSıcaklık" text NOT NULL,
    "damlamaAralığı" integer NOT NULL
);


ALTER TABLE public."Nem Ölçer" OWNER TO postgres;

--
-- Name: PH Ölçer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PH Ölçer" (
    "toprağınPH'sı" integer NOT NULL
);


ALTER TABLE public."PH Ölçer" OWNER TO postgres;

--
-- Name: Sera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sera" (
    "seraNo" integer NOT NULL,
    "seraSahibi" text NOT NULL,
    "seraTürü" text NOT NULL,
    "seraKonumu" text NOT NULL
);


ALTER TABLE public."Sera" OWNER TO postgres;

--
-- Name: Sıcaklık Ölçer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sıcaklık Ölçer" (
    "icSıcaklık" text NOT NULL,
    "dısSıcaklık" text NOT NULL,
    "havadakiNem" text NOT NULL
);


ALTER TABLE public."Sıcaklık Ölçer" OWNER TO postgres;

--
-- Name: Toprak Bilgisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Toprak Bilgisi" (
    "toprakMiktarı" integer NOT NULL,
    "toprakZenginliği" text NOT NULL,
    "toprakTürü" text NOT NULL
);


ALTER TABLE public."Toprak Bilgisi" OWNER TO postgres;

--
-- Name: Yönetici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Yönetici" (
    "yöneticiNo" integer NOT NULL,
    email text NOT NULL,
    isim text NOT NULL,
    soyisim text NOT NULL
);


ALTER TABLE public."Yönetici" OWNER TO postgres;

--
-- Name: Üye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Üye" (
    "üyeNo" integer NOT NULL,
    ad text NOT NULL,
    soyad text NOT NULL,
    "kullaniciAdi" text NOT NULL,
    sifre text NOT NULL,
    email text
);


ALTER TABLE public."Üye" OWNER TO postgres;

--
-- Data for Name: Bitki; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Bitki" ("bitkiTipi", "tohumSayısı", "bitkiÖzellikleri") FROM stdin;
\.


--
-- Data for Name: Damlama Sistemi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Damlama Sistemi" ("damlamaAraligi", "suMiktarı", "muslukSayisi") FROM stdin;
\.


--
-- Data for Name: Destek Birimi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Destek Birimi" ("telefonNo", email, "calismaSaatleri", "calisanSayisi") FROM stdin;
\.


--
-- Data for Name: Gübreleme Sistemi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Gübreleme Sistemi" ("gübreTürü", "gübreMiktarı", "gübreYoğunluğu", "toprakMiktarı", "bitkiTipi") FROM stdin;
\.


--
-- Data for Name: Havalandırma Sistemi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Havalandırma Sistemi" ("ortamdakiCO2", "ortamdakiO2", "icSıcaklık") FROM stdin;
\.


--
-- Data for Name: Işık Sensörü; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Işık Sensörü" ("alınanIşıkMiktarı", "ışıkAlmaSüresi") FROM stdin;
\.


--
-- Data for Name: Konum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Konum" ("seraKonumu", "bulunduğuİl", "bulunduguİlce") FROM stdin;
\.


--
-- Data for Name: Kullanıcı; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kullanıcı" ("kullanıcıNo", "seraSayısı", "yetiştirilenBitkiler", "seraKonumu") FROM stdin;
1111	5	domates	erzurum
2222	10	salatal�k	erzurum
\.


--
-- Data for Name: Nem Ölçer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Nem Ölçer" ("havadakiNem", "icSıcaklık", "damlamaAralığı") FROM stdin;
\.


--
-- Data for Name: PH Ölçer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PH Ölçer" ("toprağınPH'sı") FROM stdin;
\.


--
-- Data for Name: Sera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sera" ("seraNo", "seraSahibi", "seraTürü", "seraKonumu") FROM stdin;
\.


--
-- Data for Name: Sıcaklık Ölçer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sıcaklık Ölçer" ("icSıcaklık", "dısSıcaklık", "havadakiNem") FROM stdin;
\.


--
-- Data for Name: Toprak Bilgisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Toprak Bilgisi" ("toprakMiktarı", "toprakZenginliği", "toprakTürü") FROM stdin;
\.


--
-- Data for Name: Yönetici; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Yönetici" ("yöneticiNo", email, isim, soyisim) FROM stdin;
\.


--
-- Data for Name: Üye; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Üye" ("üyeNo", ad, soyad, "kullaniciAdi", sifre, email) FROM stdin;
123	furkan	bingül	furkan	1111	mfurkanbingul@gmail.com
111	sefa\n	bingül	sefa	2222	mfurkanbingul@gmail.com
222	admin	admin	admin	password	mfurkanbingul@gmail.com
\.


--
-- Name: Bitki Bitki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bitki"
    ADD CONSTRAINT "Bitki_pkey" PRIMARY KEY ("bitkiTipi");


--
-- Name: Damlama Sistemi Damlama Sistemi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Damlama Sistemi"
    ADD CONSTRAINT "Damlama Sistemi_pkey" PRIMARY KEY ("damlamaAraligi");


--
-- Name: Destek Birimi Destek Birimi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Destek Birimi"
    ADD CONSTRAINT "Destek Birimi_pkey" PRIMARY KEY ("telefonNo");


--
-- Name: Gübreleme Sistemi Gübreleme Sistemi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gübreleme Sistemi"
    ADD CONSTRAINT "Gübreleme Sistemi_pkey" PRIMARY KEY ("gübreTürü");


--
-- Name: Havalandırma Sistemi Havalandırma Sistemi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Havalandırma Sistemi"
    ADD CONSTRAINT "Havalandırma Sistemi_pkey" PRIMARY KEY ("ortamdakiCO2");


--
-- Name: Işık Sensörü Işık Sensörü_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Işık Sensörü"
    ADD CONSTRAINT "Işık Sensörü_pkey" PRIMARY KEY ("alınanIşıkMiktarı");


--
-- Name: Konum Konum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Konum"
    ADD CONSTRAINT "Konum_pkey" PRIMARY KEY ("seraKonumu");


--
-- Name: Kullanıcı Kullanıcı_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanıcı"
    ADD CONSTRAINT "Kullanıcı_pkey" PRIMARY KEY ("kullanıcıNo");


--
-- Name: Nem Ölçer Nem Ölçer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nem Ölçer"
    ADD CONSTRAINT "Nem Ölçer_pkey" PRIMARY KEY ("havadakiNem");


--
-- Name: PH Ölçer PH Ölçer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PH Ölçer"
    ADD CONSTRAINT "PH Ölçer_pkey" PRIMARY KEY ("toprağınPH'sı");


--
-- Name: Sera Sera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sera"
    ADD CONSTRAINT "Sera_pkey" PRIMARY KEY ("seraNo");


--
-- Name: Sıcaklık Ölçer Sıcaklık Ölçer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sıcaklık Ölçer"
    ADD CONSTRAINT "Sıcaklık Ölçer_pkey" PRIMARY KEY ("icSıcaklık");


--
-- Name: Toprak Bilgisi Toprak Bilgisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Toprak Bilgisi"
    ADD CONSTRAINT "Toprak Bilgisi_pkey" PRIMARY KEY ("toprakMiktarı");


--
-- Name: Yönetici Yönetici_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yönetici"
    ADD CONSTRAINT "Yönetici_pkey" PRIMARY KEY ("yöneticiNo");


--
-- Name: Üye Üye_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Üye"
    ADD CONSTRAINT "Üye_pkey" PRIMARY KEY ("üyeNo");


--
-- Name: Gübreleme Sistemi Gübreleme Sistemi_bitkiTipi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gübreleme Sistemi"
    ADD CONSTRAINT "Gübreleme Sistemi_bitkiTipi_fkey" FOREIGN KEY ("bitkiTipi") REFERENCES public."Bitki"("bitkiTipi");


--
-- Name: Gübreleme Sistemi Gübreleme Sistemi_toprakMiktarı_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gübreleme Sistemi"
    ADD CONSTRAINT "Gübreleme Sistemi_toprakMiktarı_fkey" FOREIGN KEY ("toprakMiktarı") REFERENCES public."Toprak Bilgisi"("toprakMiktarı");


--
-- Name: Havalandırma Sistemi Havalandırma Sistemi_icSıcaklık_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Havalandırma Sistemi"
    ADD CONSTRAINT "Havalandırma Sistemi_icSıcaklık_fkey" FOREIGN KEY ("icSıcaklık") REFERENCES public."Sıcaklık Ölçer"("icSıcaklık") NOT VALID;


--
-- Name: Nem Ölçer Nem Ölçer_damlamaAralığı_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nem Ölçer"
    ADD CONSTRAINT "Nem Ölçer_damlamaAralığı_fkey" FOREIGN KEY ("damlamaAralığı") REFERENCES public."Damlama Sistemi"("damlamaAraligi");


--
-- Name: Nem Ölçer Nem Ölçer_icSıcaklık_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nem Ölçer"
    ADD CONSTRAINT "Nem Ölçer_icSıcaklık_fkey" FOREIGN KEY ("icSıcaklık") REFERENCES public."Sıcaklık Ölçer"("icSıcaklık");


--
-- Name: Sera Sera_seraKonumu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sera"
    ADD CONSTRAINT "Sera_seraKonumu_fkey" FOREIGN KEY ("seraKonumu") REFERENCES public."Konum"("seraKonumu");


--
-- PostgreSQL database dump complete
--

