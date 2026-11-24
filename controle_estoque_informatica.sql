--
-- PostgreSQL database dump
--

\restrict amcpWPsCe6mYNL9cTPG0iIfFU5dbf7RrBXxN6usSOw6c30pcfLmhV370DbyoNWM

-- Dumped from database version 16.15 (Homebrew)
-- Dumped by pg_dump version 16.15 (Homebrew)

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
-- Name: categoria; Type: TABLE; Schema: public; Owner: rodrigodantasramos
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.categoria OWNER TO rodrigodantasramos;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: rodrigodantasramos
--

CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_categoria_seq OWNER TO rodrigodantasramos;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigodantasramos
--

ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;


--
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: rodrigodantasramos
--

CREATE TABLE public.fornecedor (
    id_fornecedor integer NOT NULL,
    nome character varying(100) NOT NULL,
    telefone character varying(20),
    email character varying(100)
);


ALTER TABLE public.fornecedor OWNER TO rodrigodantasramos;

--
-- Name: fornecedor_id_fornecedor_seq; Type: SEQUENCE; Schema: public; Owner: rodrigodantasramos
--

CREATE SEQUENCE public.fornecedor_id_fornecedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fornecedor_id_fornecedor_seq OWNER TO rodrigodantasramos;

--
-- Name: fornecedor_id_fornecedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigodantasramos
--

ALTER SEQUENCE public.fornecedor_id_fornecedor_seq OWNED BY public.fornecedor.id_fornecedor;


--
-- Name: movimentacao; Type: TABLE; Schema: public; Owner: rodrigodantasramos
--

CREATE TABLE public.movimentacao (
    id_movimentacao integer NOT NULL,
    id_produto integer NOT NULL,
    id_fornecedor integer,
    tipo character varying(10) NOT NULL,
    quantidade integer NOT NULL,
    data_movimentacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT movimentacao_check CHECK ((((tipo)::text = 'ENTRADA'::text) OR (id_fornecedor IS NULL))),
    CONSTRAINT movimentacao_quantidade_check CHECK ((quantidade > 0)),
    CONSTRAINT movimentacao_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['ENTRADA'::character varying, 'SAIDA'::character varying])::text[])))
);


ALTER TABLE public.movimentacao OWNER TO rodrigodantasramos;

--
-- Name: movimentacao_id_movimentacao_seq; Type: SEQUENCE; Schema: public; Owner: rodrigodantasramos
--

CREATE SEQUENCE public.movimentacao_id_movimentacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movimentacao_id_movimentacao_seq OWNER TO rodrigodantasramos;

--
-- Name: movimentacao_id_movimentacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigodantasramos
--

ALTER SEQUENCE public.movimentacao_id_movimentacao_seq OWNED BY public.movimentacao.id_movimentacao;


--
-- Name: produto; Type: TABLE; Schema: public; Owner: rodrigodantasramos
--

CREATE TABLE public.produto (
    id_produto integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text,
    id_categoria integer NOT NULL,
    estoque_minimo integer DEFAULT 0 NOT NULL,
    CONSTRAINT produto_estoque_minimo_check CHECK ((estoque_minimo >= 0))
);


ALTER TABLE public.produto OWNER TO rodrigodantasramos;

--
-- Name: produto_id_produto_seq; Type: SEQUENCE; Schema: public; Owner: rodrigodantasramos
--

CREATE SEQUENCE public.produto_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produto_id_produto_seq OWNER TO rodrigodantasramos;

--
-- Name: produto_id_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigodantasramos
--

ALTER SEQUENCE public.produto_id_produto_seq OWNED BY public.produto.id_produto;


--
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- Name: fornecedor id_fornecedor; Type: DEFAULT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.fornecedor ALTER COLUMN id_fornecedor SET DEFAULT nextval('public.fornecedor_id_fornecedor_seq'::regclass);


--
-- Name: movimentacao id_movimentacao; Type: DEFAULT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.movimentacao ALTER COLUMN id_movimentacao SET DEFAULT nextval('public.movimentacao_id_movimentacao_seq'::regclass);


--
-- Name: produto id_produto; Type: DEFAULT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.produto ALTER COLUMN id_produto SET DEFAULT nextval('public.produto_id_produto_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: rodrigodantasramos
--

COPY public.categoria (id_categoria, nome) FROM stdin;
1	Periféricos
2	Componentes
3	Armazenamento
4	Acessórios
\.


--
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: rodrigodantasramos
--

COPY public.fornecedor (id_fornecedor, nome, telefone, email) FROM stdin;
1	Tech Distribuidora	(79) 3333-1111	contato@techdistribuidora.com
2	Info Center	(79) 3333-2222	vendas@infocenter.com
3	Mundo dos Eletrônicos	(79) 3333-3333	contato@mundoeletro.com
\.


--
-- Data for Name: movimentacao; Type: TABLE DATA; Schema: public; Owner: rodrigodantasramos
--

COPY public.movimentacao (id_movimentacao, id_produto, id_fornecedor, tipo, quantidade, data_movimentacao) FROM stdin;
1	1	1	ENTRADA	10	2026-11-23 10:02:25.948532
2	1	\N	SAIDA	7	2026-11-23 10:02:25.948532
3	2	2	ENTRADA	8	2026-11-23 10:02:25.948532
4	2	\N	SAIDA	3	2026-11-23 10:02:25.948532
5	3	3	ENTRADA	5	2026-11-23 10:02:25.948532
6	3	\N	SAIDA	3	2026-11-23 10:02:25.948532
7	4	1	ENTRADA	6	2026-11-23 10:02:25.948532
8	4	\N	SAIDA	2	2026-11-23 10:02:25.948532
9	5	2	ENTRADA	10	2026-11-23 10:02:25.948532
10	5	\N	SAIDA	6	2026-11-23 10:02:25.948532
11	6	3	ENTRADA	4	2026-11-23 10:02:25.948532
12	6	\N	SAIDA	1	2026-11-23 10:02:25.948532
13	7	1	ENTRADA	8	2026-11-23 10:02:25.948532
14	7	\N	SAIDA	5	2026-11-23 10:02:25.948532
15	8	2	ENTRADA	6	2026-11-23 10:02:25.948532
16	8	\N	SAIDA	2	2026-11-23 10:02:25.948532
17	9	3	ENTRADA	10	2026-11-23 10:02:25.948532
18	9	\N	SAIDA	6	2026-11-23 10:02:25.948532
19	10	1	ENTRADA	12	2026-11-23 10:02:25.948532
20	10	\N	SAIDA	8	2026-11-23 10:02:25.948532
21	11	2	ENTRADA	8	2026-11-23 10:02:25.948532
22	11	\N	SAIDA	2	2026-11-23 10:02:25.948532
23	12	3	ENTRADA	5	2026-11-23 10:02:25.948532
24	12	\N	SAIDA	4	2026-11-23 10:02:25.948532
\.


--
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: rodrigodantasramos
--

COPY public.produto (id_produto, nome, descricao, id_categoria, estoque_minimo) FROM stdin;
1	Mouse Gamer	Mouse óptico gamer USB	1	5
2	Teclado Mecânico	Teclado mecânico USB ABNT2	1	4
3	Monitor 24 polegadas	Monitor LED Full HD	1	3
4	Processador Intel Core i5	Processador Intel Core i5	2	2
5	Memória RAM 8GB	Memória DDR4 8GB	2	5
6	Placa de Vídeo GTX 1660	Placa de vídeo 6GB	2	2
7	SSD 480GB	Unidade de armazenamento SSD	3	4
8	HD 1TB	Disco rígido SATA 1TB	3	3
9	Pen Drive 64GB	Pen drive USB 64GB	3	5
10	Cabo HDMI	Cabo HDMI 2 metros	4	5
11	Adaptador USB	Adaptador USB 3.0	4	4
12	Suporte para Monitor	Suporte articulado para monitor	4	2
\.


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigodantasramos
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 4, true);


--
-- Name: fornecedor_id_fornecedor_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigodantasramos
--

SELECT pg_catalog.setval('public.fornecedor_id_fornecedor_seq', 3, true);


--
-- Name: movimentacao_id_movimentacao_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigodantasramos
--

SELECT pg_catalog.setval('public.movimentacao_id_movimentacao_seq', 29, true);


--
-- Name: produto_id_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigodantasramos
--

SELECT pg_catalog.setval('public.produto_id_produto_seq', 13, true);


--
-- Name: categoria categoria_nome_key; Type: CONSTRAINT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nome_key UNIQUE (nome);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (id_fornecedor);


--
-- Name: movimentacao movimentacao_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_pkey PRIMARY KEY (id_movimentacao);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_produto);


--
-- Name: idx_movimentacao_data; Type: INDEX; Schema: public; Owner: rodrigodantasramos
--

CREATE INDEX idx_movimentacao_data ON public.movimentacao USING btree (data_movimentacao);


--
-- Name: movimentacao movimentacao_id_fornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_id_fornecedor_fkey FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedor(id_fornecedor);


--
-- Name: movimentacao movimentacao_id_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.produto(id_produto);


--
-- Name: produto produto_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigodantasramos
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


--
-- PostgreSQL database dump complete
--

\unrestrict amcpWPsCe6mYNL9cTPG0iIfFU5dbf7RrBXxN6usSOw6c30pcfLmhV370DbyoNWM

