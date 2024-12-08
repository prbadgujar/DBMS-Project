--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1 (Debian 17.1-1.pgdg120+1)
-- Dumped by pg_dump version 17.1 (Debian 17.1-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: comments; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.comments (
    comment_id bigint NOT NULL,
    comment character varying(255),
    park_id bigint NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.comments OWNER TO myuser;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.comments ALTER COLUMN comment_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dining_and_sleeping; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.dining_and_sleeping (
    dns_id bigint NOT NULL,
    contact_info character varying(255),
    description character varying(255),
    location character varying(255),
    name character varying(255),
    type character varying(255),
    park_id bigint NOT NULL
);


ALTER TABLE public.dining_and_sleeping OWNER TO myuser;

--
-- Name: dining_and_sleeping_dns_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.dining_and_sleeping ALTER COLUMN dns_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.dining_and_sleeping_dns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: location; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.location (
    loc_id bigint NOT NULL,
    continent character varying(255),
    country character varying(255),
    state character varying(255),
    state_code character varying(255)
);


ALTER TABLE public.location OWNER TO myuser;

--
-- Name: location_loc_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.location ALTER COLUMN loc_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.location_loc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: national_park; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.national_park (
    park_id bigint NOT NULL,
    closure_and_alerts character varying(255),
    entrance_fee double precision,
    name character varying(255),
    operating_hours character varying(255),
    parking_tags integer,
    visitors integer,
    weather character varying(255),
    loc_id bigint
);


ALTER TABLE public.national_park OWNER TO myuser;

--
-- Name: national_park_park_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.national_park ALTER COLUMN park_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.national_park_park_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: places_to_go; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.places_to_go (
    place_id bigint NOT NULL,
    description character varying(255),
    location character varying(255),
    name character varying(255),
    type character varying(255),
    park_id bigint NOT NULL
);


ALTER TABLE public.places_to_go OWNER TO myuser;

--
-- Name: places_to_go_place_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.places_to_go ALTER COLUMN place_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.places_to_go_place_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: things_to_do; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.things_to_do (
    activity_id bigint NOT NULL,
    description character varying(255),
    location character varying(255),
    name character varying(255),
    type character varying(255),
    park_id bigint NOT NULL
);


ALTER TABLE public.things_to_do OWNER TO myuser;

--
-- Name: things_to_do_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.things_to_do ALTER COLUMN activity_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.things_to_do_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    contact character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.users OWNER TO myuser;

--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.comments (comment_id, comment, park_id, user_id) FROM stdin;
\.


--
-- Data for Name: dining_and_sleeping; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.dining_and_sleeping (dns_id, contact_info, description, location, name, type, park_id) FROM stdin;
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.location (loc_id, continent, country, state, state_code) FROM stdin;
1	North America	United States	Alabama	AL
2	North America	United States	Alaska	AK
3	North America	United States	Arizona	AZ
4	North America	United States	Arkansas	AR
5	North America	United States	California	CA
6	North America	United States	Colorado	CO
7	North America	United States	Connecticut	CT
8	North America	United States	Delaware	DE
9	North America	United States	Florida	FL
10	North America	United States	Georgia	GA
11	North America	United States	Hawaii	HI
12	North America	United States	Idaho	ID
13	North America	United States	Illinois	IL
14	North America	United States	Indiana	IN
15	North America	United States	Iowa	IA
16	North America	United States	Kansas	KS
17	North America	United States	Kentucky	KY
18	North America	United States	Louisiana	LA
19	North America	United States	Maine	ME
20	North America	United States	Maryland	MD
21	North America	United States	Massachusetts	MA
22	North America	United States	Michigan	MI
23	North America	United States	Minnesota	MN
24	North America	United States	Mississippi	MS
25	North America	United States	Missouri	MO
26	North America	United States	Montana	MT
27	North America	United States	Nebraska	NE
28	North America	United States	Nevada	NV
29	North America	United States	New Hampshire	NH
30	North America	United States	New Jersey	NJ
31	North America	United States	New Mexico	NM
32	North America	United States	New York	NY
33	North America	United States	North Carolina	NC
34	North America	United States	North Dakota	ND
35	North America	United States	Ohio	OH
36	North America	United States	Oklahoma	OK
37	North America	United States	Oregon	OR
38	North America	United States	Pennsylvania	PA
39	North America	United States	Rhode Island	RI
40	North America	United States	South Carolina	SC
41	North America	United States	South Dakota	SD
42	North America	United States	Tennessee	TN
43	North America	United States	Texas	TX
44	North America	United States	Utah	UT
45	North America	United States	Vermont	VT
46	North America	United States	Virginia	VA
47	North America	United States	Washington	WA
48	North America	United States	West Virginia	WV
49	North America	United States	Wisconsin	WI
50	North America	United States	Wyoming	WY
\.


--
-- Data for Name: national_park; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.national_park (park_id, closure_and_alerts, entrance_fee, name, operating_hours, parking_tags, visitors, weather, loc_id) FROM stdin;
1	\N	\N	Birmingham Civil Rights	\N	\N	\N	\N	1
2	\N	\N	Freedom Riders	\N	\N	\N	\N	1
3	\N	\N	Horseshoe Bend	\N	\N	\N	\N	1
4	\N	\N	Little River Canyon	\N	\N	\N	\N	1
5	\N	\N	Natchez Trace	\N	\N	\N	\N	1
6	\N	\N	Natchez Trace	\N	\N	\N	\N	1
7	\N	\N	Russell Cave	\N	\N	\N	\N	1
8	\N	\N	Selma To Montgomery	\N	\N	\N	\N	1
9	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
10	\N	\N	Tuskegee Airmen	\N	\N	\N	\N	1
11	\N	\N	Tuskegee Institute	\N	\N	\N	\N	1
12	\N	\N	Alagnak	\N	\N	\N	\N	2
13	\N	\N	Alaska Public Lands	\N	\N	\N	\N	2
14	\N	\N	Aleutian Islands World War II	\N	\N	\N	\N	2
15	\N	\N	Aniakchak	\N	\N	\N	\N	2
16	\N	\N	Bering Land Bridge	\N	\N	\N	\N	2
17	\N	\N	Cape Krusenstern	\N	\N	\N	\N	2
18	\N	\N	Denali	\N	\N	\N	\N	2
19	\N	\N	Gates Of The Arctic	\N	\N	\N	\N	2
20	\N	\N	Glacier Bay	\N	\N	\N	\N	2
21	\N	\N	Iñupiat Heritage Center	\N	\N	\N	\N	2
22	\N	\N	Katmai	\N	\N	\N	\N	2
23	\N	\N	Kenai Fjords	\N	\N	\N	\N	2
24	\N	\N	Klondike Gold Rush	\N	\N	\N	\N	2
25	\N	\N	Kobuk Valley	\N	\N	\N	\N	2
26	\N	\N	Lake Clark	\N	\N	\N	\N	2
27	\N	\N	Noatak	\N	\N	\N	\N	2
28	\N	\N	Sitka	\N	\N	\N	\N	2
29	\N	\N	Wrangell - St Elias	\N	\N	\N	\N	2
30	\N	\N	Yukon - Charley Rivers	\N	\N	\N	\N	2
31	\N	\N	Butterfield Overland	\N	\N	\N	\N	3
32	\N	\N	Canyon de Chelly	\N	\N	\N	\N	3
33	\N	\N	Casa Grande Ruins	\N	\N	\N	\N	3
34	\N	\N	Chiricahua	\N	\N	\N	\N	3
35	\N	\N	Coronado	\N	\N	\N	\N	3
36	\N	\N	Fort Bowie	\N	\N	\N	\N	3
37	\N	\N	Glen Canyon	\N	\N	\N	\N	3
38	\N	\N	Grand Canyon	\N	\N	\N	\N	3
39	\N	\N	Grand Canyon-Parashant	\N	\N	\N	\N	3
40	\N	\N	Hubbell Trading Post	\N	\N	\N	\N	3
41	\N	\N	Juan Bautista de Anza	\N	\N	\N	\N	3
42	\N	\N	Lake Mead	\N	\N	\N	\N	3
43	\N	\N	Montezuma Castle	\N	\N	\N	\N	3
44	\N	\N	Navajo	\N	\N	\N	\N	3
45	\N	\N	Old Spanish	\N	\N	\N	\N	3
46	\N	\N	Organ Pipe Cactus	\N	\N	\N	\N	3
47	\N	\N	Petrified Forest	\N	\N	\N	\N	3
48	\N	\N	Pipe Spring	\N	\N	\N	\N	3
49	\N	\N	Saguaro	\N	\N	\N	\N	3
50	\N	\N	Sunset Crater Volcano	\N	\N	\N	\N	3
51	\N	\N	Tonto	\N	\N	\N	\N	3
52	\N	\N	Tumacácori	\N	\N	\N	\N	3
53	\N	\N	Tuzigoot	\N	\N	\N	\N	3
54	\N	\N	Walnut Canyon	\N	\N	\N	\N	3
55	\N	\N	Wupatki	\N	\N	\N	\N	3
56	\N	\N	Arkansas Post	\N	\N	\N	\N	4
57	\N	\N	Buffalo	\N	\N	\N	\N	4
58	\N	\N	Butterfield Overland	\N	\N	\N	\N	3
59	\N	\N	Fort Smith	\N	\N	\N	\N	4
60	\N	\N	Hot Springs	\N	\N	\N	\N	4
61	\N	\N	Little Rock Central High School	\N	\N	\N	\N	4
62	\N	\N	Pea Ridge	\N	\N	\N	\N	4
63	\N	\N	President William Jefferson Clinton Birthplace Home	\N	\N	\N	\N	4
64	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
65	\N	\N	Alcatraz Island	\N	\N	\N	\N	5
66	\N	\N	Butterfield Overland	\N	\N	\N	\N	3
67	\N	\N	Cabrillo	\N	\N	\N	\N	5
68	\N	\N	California	\N	\N	\N	\N	5
69	\N	\N	Castle Mountains	\N	\N	\N	\N	5
70	\N	\N	César E. Chávez	\N	\N	\N	\N	5
71	\N	\N	Channel Islands	\N	\N	\N	\N	5
72	\N	\N	Death Valley	\N	\N	\N	\N	5
73	\N	\N	Devils Postpile	\N	\N	\N	\N	5
74	\N	\N	Eugene O'Neill	\N	\N	\N	\N	5
75	\N	\N	Fort Point	\N	\N	\N	\N	5
76	\N	\N	Golden Gate	\N	\N	\N	\N	5
77	\N	\N	John Muir	\N	\N	\N	\N	5
78	\N	\N	Joshua Tree	\N	\N	\N	\N	5
79	\N	\N	Juan Bautista de Anza	\N	\N	\N	\N	3
80	\N	\N	Lassen Volcanic	\N	\N	\N	\N	5
81	\N	\N	Lava Beds	\N	\N	\N	\N	5
82	\N	\N	Manzanar	\N	\N	\N	\N	5
83	\N	\N	Mojave	\N	\N	\N	\N	5
84	\N	\N	Muir Woods	\N	\N	\N	\N	5
85	\N	\N	Old Spanish	\N	\N	\N	\N	3
86	\N	\N	Pinnacles	\N	\N	\N	\N	5
87	\N	\N	Point Reyes	\N	\N	\N	\N	5
88	\N	\N	Pony Express	\N	\N	\N	\N	5
89	\N	\N	Port Chicago Naval Magazine	\N	\N	\N	\N	5
90	\N	\N	Presidio of San Francisco	\N	\N	\N	\N	5
91	\N	\N	Redwood	\N	\N	\N	\N	5
92	\N	\N	Rosie the Riveter WWII Home Front	\N	\N	\N	\N	5
93	\N	\N	San Francisco Maritime	\N	\N	\N	\N	5
94	\N	\N	Santa Monica Mountains	\N	\N	\N	\N	5
95	\N	\N	Sequoia & Kings Canyon	\N	\N	\N	\N	5
96	\N	\N	Tule Lake	\N	\N	\N	\N	5
97	\N	\N	Whiskeytown	\N	\N	\N	\N	5
98	\N	\N	Yosemite	\N	\N	\N	\N	5
99	\N	\N	Bent's Old Fort	\N	\N	\N	\N	6
100	\N	\N	Black Canyon Of The Gunnison	\N	\N	\N	\N	6
101	\N	\N	California	\N	\N	\N	\N	5
102	\N	\N	Colorado	\N	\N	\N	\N	6
103	\N	\N	Curecanti	\N	\N	\N	\N	6
104	\N	\N	Dinosaur	\N	\N	\N	\N	6
105	\N	\N	Florissant Fossil Beds	\N	\N	\N	\N	6
106	\N	\N	Great Sand Dunes	\N	\N	\N	\N	6
107	\N	\N	Hovenweep	\N	\N	\N	\N	6
108	\N	\N	Mesa Verde	\N	\N	\N	\N	6
109	\N	\N	Old Spanish	\N	\N	\N	\N	3
110	\N	\N	Pony Express	\N	\N	\N	\N	5
111	\N	\N	Rocky Mountain	\N	\N	\N	\N	6
112	\N	\N	Sand Creek Massacre	\N	\N	\N	\N	6
113	\N	\N	Santa Fe	\N	\N	\N	\N	6
114	\N	\N	Yucca House	\N	\N	\N	\N	6
115	\N	\N	Appalachian	\N	\N	\N	\N	7
116	\N	\N	Coltsville	\N	\N	\N	\N	7
117	\N	\N	New England	\N	\N	\N	\N	7
118	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
119	\N	\N	Weir Farm	\N	\N	\N	\N	7
120	\N	\N	Captain John Smith Chesapeake	\N	\N	\N	\N	8
121	\N	\N	Chesapeake Bay	\N	\N	\N	\N	8
122	\N	\N	First State	\N	\N	\N	\N	8
123	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
124	\N	\N	Big Cypress	\N	\N	\N	\N	9
125	\N	\N	Biscayne	\N	\N	\N	\N	9
126	\N	\N	Canaveral	\N	\N	\N	\N	9
127	\N	\N	Castillo de San Marcos	\N	\N	\N	\N	9
128	\N	\N	De Soto	\N	\N	\N	\N	9
129	\N	\N	Dry Tortugas	\N	\N	\N	\N	9
130	\N	\N	Everglades	\N	\N	\N	\N	9
131	\N	\N	Fort Caroline	\N	\N	\N	\N	9
132	\N	\N	Fort Matanzas	\N	\N	\N	\N	9
133	\N	\N	Gulf Islands	\N	\N	\N	\N	9
134	\N	\N	Timucuan	\N	\N	\N	\N	9
135	\N	\N	Andersonville	\N	\N	\N	\N	10
136	\N	\N	Appalachian	\N	\N	\N	\N	7
137	\N	\N	Chattahoochee River	\N	\N	\N	\N	10
138	\N	\N	Chickamauga & Chattanooga	\N	\N	\N	\N	10
139	\N	\N	Cumberland Island	\N	\N	\N	\N	10
140	\N	\N	Fort Frederica	\N	\N	\N	\N	10
141	\N	\N	Fort Pulaski	\N	\N	\N	\N	10
142	\N	\N	Jimmy Carter	\N	\N	\N	\N	10
143	\N	\N	Kennesaw Mountain	\N	\N	\N	\N	10
144	\N	\N	Martin Luther King, Jr.	\N	\N	\N	\N	10
145	\N	\N	Ocmulgee Mounds	\N	\N	\N	\N	10
146	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
147	\N	\N	Ala Kahakai	\N	\N	\N	\N	11
148	\N	\N	Haleakalā	\N	\N	\N	\N	11
149	\N	\N	Hawaiʻi Volcanoes	\N	\N	\N	\N	11
150	\N	\N	Honouliuli	\N	\N	\N	\N	11
151	\N	\N	Kalaupapa	\N	\N	\N	\N	11
152	\N	\N	Kaloko-Honokōhau	\N	\N	\N	\N	11
153	\N	\N	Pearl Harbor	\N	\N	\N	\N	11
154	\N	\N	Puʻuhonua o Hōnaunau	\N	\N	\N	\N	11
155	\N	\N	Puʻukoholā Heiau	\N	\N	\N	\N	11
156	\N	\N	California	\N	\N	\N	\N	5
157	\N	\N	City Of Rocks	\N	\N	\N	\N	12
158	\N	\N	Craters Of The Moon	\N	\N	\N	\N	12
159	\N	\N	Hagerman Fossil Beds	\N	\N	\N	\N	12
160	\N	\N	Ice Age Floods	\N	\N	\N	\N	12
161	\N	\N	Minidoka	\N	\N	\N	\N	12
162	\N	\N	Nez Perce	\N	\N	\N	\N	12
163	\N	\N	Oregon	\N	\N	\N	\N	12
164	\N	\N	Yellowstone	\N	\N	\N	\N	12
165	\N	\N	Emmett Till and Mamie Till-Mobley	\N	\N	\N	\N	13
166	\N	\N	Lincoln Home	\N	\N	\N	\N	13
167	\N	\N	Mormon Pioneer	\N	\N	\N	\N	13
168	\N	\N	New Philadelphia	\N	\N	\N	\N	13
169	\N	\N	Pullman	\N	\N	\N	\N	13
170	\N	\N	Springfield 1908 Race Riot	\N	\N	\N	\N	13
171	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
172	\N	\N	George Rogers Clark	\N	\N	\N	\N	14
173	\N	\N	Indiana Dunes	\N	\N	\N	\N	14
174	\N	\N	Lincoln Boyhood	\N	\N	\N	\N	14
175	\N	\N	Effigy Mounds	\N	\N	\N	\N	15
176	\N	\N	Herbert Hoover	\N	\N	\N	\N	15
177	\N	\N	Mormon Pioneer	\N	\N	\N	\N	13
178	\N	\N	Brown v. Board of Education	\N	\N	\N	\N	16
179	\N	\N	California	\N	\N	\N	\N	5
180	\N	\N	Fort Larned	\N	\N	\N	\N	16
181	\N	\N	Fort Scott	\N	\N	\N	\N	16
182	\N	\N	Nicodemus	\N	\N	\N	\N	16
183	\N	\N	Oregon	\N	\N	\N	\N	12
184	\N	\N	Pony Express	\N	\N	\N	\N	5
185	\N	\N	Santa Fe	\N	\N	\N	\N	6
186	\N	\N	Tallgrass Prairie	\N	\N	\N	\N	16
187	\N	\N	Abraham Lincoln Birthplace	\N	\N	\N	\N	17
188	\N	\N	Big South Fork	\N	\N	\N	\N	17
189	\N	\N	Camp Nelson	\N	\N	\N	\N	17
190	\N	\N	Cumberland Gap	\N	\N	\N	\N	17
191	\N	\N	Fort Donelson	\N	\N	\N	\N	17
192	\N	\N	Mammoth Cave	\N	\N	\N	\N	17
193	\N	\N	Mill Springs Battlefield	\N	\N	\N	\N	17
194	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
195	\N	\N	Cane River Creole	\N	\N	\N	\N	18
196	\N	\N	El Camino Real de los Tejas	\N	\N	\N	\N	18
197	\N	\N	Jean Lafitte	\N	\N	\N	\N	18
198	\N	\N	New Orleans Jazz	\N	\N	\N	\N	18
199	\N	\N	Poverty Point	\N	\N	\N	\N	18
200	\N	\N	Vicksburg	\N	\N	\N	\N	18
201	\N	\N	Acadia	\N	\N	\N	\N	19
202	\N	\N	Appalachian	\N	\N	\N	\N	7
203	\N	\N	Katahdin Woods and Waters	\N	\N	\N	\N	19
204	\N	\N	Maine Acadian Culture	\N	\N	\N	\N	19
205	\N	\N	Roosevelt Campobello	\N	\N	\N	\N	19
206	\N	\N	Saint Croix Island	\N	\N	\N	\N	19
207	\N	\N	Antietam	\N	\N	\N	\N	20
208	\N	\N	Appalachian	\N	\N	\N	\N	7
209	\N	\N	Assateague Island	\N	\N	\N	\N	20
210	\N	\N	Baltimore-Washington	\N	\N	\N	\N	20
211	\N	\N	Captain John Smith Chesapeake	\N	\N	\N	\N	8
212	\N	\N	Catoctin Mountain	\N	\N	\N	\N	20
213	\N	\N	Chesapeake & Ohio Canal	\N	\N	\N	\N	20
214	\N	\N	Chesapeake Bay	\N	\N	\N	\N	8
215	\N	\N	Civil War Defenses of Washington	\N	\N	\N	\N	20
216	\N	\N	Clara Barton	\N	\N	\N	\N	20
217	\N	\N	Fort Foote	\N	\N	\N	\N	20
218	\N	\N	Fort McHenry	\N	\N	\N	\N	20
219	\N	\N	Fort Washington	\N	\N	\N	\N	20
220	\N	\N	George Washington	\N	\N	\N	\N	20
221	\N	\N	Glen Echo	\N	\N	\N	\N	20
222	\N	\N	Greenbelt	\N	\N	\N	\N	20
223	\N	\N	Hampton	\N	\N	\N	\N	20
224	\N	\N	Harmony Hall	\N	\N	\N	\N	20
225	\N	\N	Harpers Ferry	\N	\N	\N	\N	20
226	\N	\N	Harriet Tubman Underground Railroad	\N	\N	\N	\N	20
227	\N	\N	Monocacy	\N	\N	\N	\N	20
228	\N	\N	Oxon Cove Park & Oxon Hill Farm	\N	\N	\N	\N	20
229	\N	\N	Piscataway	\N	\N	\N	\N	20
230	\N	\N	Potomac Heritage	\N	\N	\N	\N	20
231	\N	\N	Star-Spangled Banner	\N	\N	\N	\N	20
232	\N	\N	Thomas Stone	\N	\N	\N	\N	20
233	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
234	\N	\N	Adams	\N	\N	\N	\N	21
235	\N	\N	Appalachian	\N	\N	\N	\N	7
236	\N	\N	Blackstone River Valley	\N	\N	\N	\N	21
237	\N	\N	Boston	\N	\N	\N	\N	21
238	\N	\N	Boston African American	\N	\N	\N	\N	21
239	\N	\N	Boston Harbor Islands	\N	\N	\N	\N	21
240	\N	\N	Cape Cod	\N	\N	\N	\N	21
241	\N	\N	Frederick Law Olmsted	\N	\N	\N	\N	21
242	\N	\N	John Fitzgerald Kennedy	\N	\N	\N	\N	21
243	\N	\N	Longfellow House Washington's Headquarters	\N	\N	\N	\N	21
244	\N	\N	Lowell	\N	\N	\N	\N	21
245	\N	\N	Minute Man	\N	\N	\N	\N	21
246	\N	\N	New Bedford Whaling	\N	\N	\N	\N	21
247	\N	\N	New England	\N	\N	\N	\N	7
248	\N	\N	Salem Maritime	\N	\N	\N	\N	21
249	\N	\N	Saugus Iron Works	\N	\N	\N	\N	21
250	\N	\N	Springfield Armory	\N	\N	\N	\N	21
251	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
252	\N	\N	Isle Royale	\N	\N	\N	\N	22
253	\N	\N	Keweenaw	\N	\N	\N	\N	22
254	\N	\N	North Country	\N	\N	\N	\N	22
255	\N	\N	Pictured Rocks	\N	\N	\N	\N	22
256	\N	\N	River Raisin	\N	\N	\N	\N	22
257	\N	\N	Sleeping Bear Dunes	\N	\N	\N	\N	22
258	\N	\N	Grand Portage	\N	\N	\N	\N	23
259	\N	\N	Mississippi	\N	\N	\N	\N	23
260	\N	\N	North Country	\N	\N	\N	\N	22
261	\N	\N	Pipestone	\N	\N	\N	\N	23
262	\N	\N	Saint Croix	\N	\N	\N	\N	23
263	\N	\N	Voyageurs	\N	\N	\N	\N	23
264	\N	\N	Brices Cross Roads	\N	\N	\N	\N	24
265	\N	\N	Emmett Till and Mamie Till-Mobley	\N	\N	\N	\N	13
266	\N	\N	Gulf Islands	\N	\N	\N	\N	9
267	\N	\N	Medgar and Myrlie Evers Home	\N	\N	\N	\N	24
268	\N	\N	Natchez	\N	\N	\N	\N	24
269	\N	\N	Natchez Trace	\N	\N	\N	\N	1
270	\N	\N	Natchez Trace	\N	\N	\N	\N	1
271	\N	\N	Shiloh	\N	\N	\N	\N	24
272	\N	\N	Tupelo	\N	\N	\N	\N	24
273	\N	\N	Vicksburg	\N	\N	\N	\N	18
274	\N	\N	Butterfield Overland	\N	\N	\N	\N	3
275	\N	\N	California	\N	\N	\N	\N	5
276	\N	\N	Gateway Arch	\N	\N	\N	\N	25
277	\N	\N	George Washington Carver	\N	\N	\N	\N	25
278	\N	\N	Harry S Truman	\N	\N	\N	\N	25
279	\N	\N	Oregon	\N	\N	\N	\N	12
280	\N	\N	Ozark	\N	\N	\N	\N	25
281	\N	\N	Pony Express	\N	\N	\N	\N	5
282	\N	\N	Santa Fe	\N	\N	\N	\N	6
283	\N	\N	Ste. Geneviève	\N	\N	\N	\N	25
284	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
285	\N	\N	Ulysses S Grant	\N	\N	\N	\N	25
286	\N	\N	Wilson's Creek	\N	\N	\N	\N	25
287	\N	\N	Big Hole	\N	\N	\N	\N	26
288	\N	\N	Bighorn Canyon	\N	\N	\N	\N	26
289	\N	\N	Glacier	\N	\N	\N	\N	26
290	\N	\N	Grant-Kohrs Ranch	\N	\N	\N	\N	26
291	\N	\N	Ice Age Floods	\N	\N	\N	\N	12
292	\N	\N	Little Bighorn Battlefield	\N	\N	\N	\N	26
293	\N	\N	Nez Perce	\N	\N	\N	\N	12
294	\N	\N	Yellowstone	\N	\N	\N	\N	12
295	\N	\N	Agate Fossil Beds	\N	\N	\N	\N	27
296	\N	\N	California	\N	\N	\N	\N	5
297	\N	\N	Homestead	\N	\N	\N	\N	27
298	\N	\N	Missouri	\N	\N	\N	\N	27
299	\N	\N	Mormon Pioneer	\N	\N	\N	\N	13
300	\N	\N	Niobrara	\N	\N	\N	\N	27
301	\N	\N	Oregon	\N	\N	\N	\N	12
302	\N	\N	Pony Express	\N	\N	\N	\N	5
303	\N	\N	Scotts Bluff	\N	\N	\N	\N	27
304	\N	\N	California	\N	\N	\N	\N	5
305	\N	\N	Death Valley	\N	\N	\N	\N	5
306	\N	\N	Great Basin	\N	\N	\N	\N	28
307	\N	\N	Lake Mead	\N	\N	\N	\N	3
308	\N	\N	Old Spanish	\N	\N	\N	\N	3
309	\N	\N	Pony Express	\N	\N	\N	\N	5
310	\N	\N	Tule Springs Fossil Beds	\N	\N	\N	\N	28
311	\N	\N	Appalachian	\N	\N	\N	\N	7
312	\N	\N	Saint-Gaudens	\N	\N	\N	\N	29
313	\N	\N	Appalachian	\N	\N	\N	\N	7
314	\N	\N	Delaware Water Gap	\N	\N	\N	\N	30
315	\N	\N	Ellis Island	\N	\N	\N	\N	30
316	\N	\N	Gateway	\N	\N	\N	\N	30
317	\N	\N	Great Egg Harbor River	\N	\N	\N	\N	30
318	\N	\N	Lower Delaware	\N	\N	\N	\N	30
319	\N	\N	Morristown	\N	\N	\N	\N	30
320	\N	\N	New Jersey Pinelands	\N	\N	\N	\N	30
321	\N	\N	Paterson Great Falls	\N	\N	\N	\N	30
322	\N	\N	Thomas Edison	\N	\N	\N	\N	30
323	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
324	\N	\N	Aztec Ruins	\N	\N	\N	\N	31
325	\N	\N	Bandelier	\N	\N	\N	\N	31
326	\N	\N	Butterfield Overland	\N	\N	\N	\N	3
327	\N	\N	Capulin Volcano	\N	\N	\N	\N	31
328	\N	\N	Carlsbad Caverns	\N	\N	\N	\N	31
329	\N	\N	Chaco Culture	\N	\N	\N	\N	31
330	\N	\N	El Camino Real de Tierra Adentro	\N	\N	\N	\N	31
331	\N	\N	El Malpais	\N	\N	\N	\N	31
332	\N	\N	El Morro	\N	\N	\N	\N	31
333	\N	\N	Fort Union	\N	\N	\N	\N	31
334	\N	\N	Gila Cliff Dwellings	\N	\N	\N	\N	31
335	\N	\N	Manhattan Project	\N	\N	\N	\N	31
336	\N	\N	Old Spanish	\N	\N	\N	\N	3
337	\N	\N	Pecos	\N	\N	\N	\N	31
338	\N	\N	Petroglyph	\N	\N	\N	\N	31
339	\N	\N	Salinas Pueblo Missions	\N	\N	\N	\N	31
340	\N	\N	Santa Fe	\N	\N	\N	\N	6
341	\N	\N	Valles Caldera	\N	\N	\N	\N	31
342	\N	\N	White Sands	\N	\N	\N	\N	31
343	\N	\N	African Burial Ground	\N	\N	\N	\N	32
344	\N	\N	Appalachian	\N	\N	\N	\N	7
345	\N	\N	Captain John Smith Chesapeake	\N	\N	\N	\N	8
346	\N	\N	Castle Clinton	\N	\N	\N	\N	32
347	\N	\N	Chesapeake Bay	\N	\N	\N	\N	8
348	\N	\N	Eleanor Roosevelt	\N	\N	\N	\N	32
349	\N	\N	Ellis Island	\N	\N	\N	\N	30
350	\N	\N	Federal Hall	\N	\N	\N	\N	32
351	\N	\N	Fire Island	\N	\N	\N	\N	32
352	\N	\N	Fort Stanwix	\N	\N	\N	\N	32
353	\N	\N	Gateway	\N	\N	\N	\N	30
354	\N	\N	General Grant	\N	\N	\N	\N	32
355	\N	\N	Governors Island	\N	\N	\N	\N	32
356	\N	\N	Hamilton Grange	\N	\N	\N	\N	32
357	\N	\N	Harriet Tubman	\N	\N	\N	\N	32
358	\N	\N	Home Of Franklin D Roosevelt	\N	\N	\N	\N	32
359	\N	\N	Lower East Side Tenement Museum	\N	\N	\N	\N	32
360	\N	\N	Martin Van Buren	\N	\N	\N	\N	32
361	\N	\N	National Parks of New York Harbor	\N	\N	\N	\N	32
362	\N	\N	North Country	\N	\N	\N	\N	22
363	\N	\N	Sagamore Hill	\N	\N	\N	\N	32
364	\N	\N	Saint Paul's Church	\N	\N	\N	\N	32
365	\N	\N	Saratoga	\N	\N	\N	\N	32
366	\N	\N	Statue Of Liberty	\N	\N	\N	\N	32
367	\N	\N	Stonewall	\N	\N	\N	\N	32
368	\N	\N	Theodore Roosevelt Birthplace	\N	\N	\N	\N	32
369	\N	\N	Theodore Roosevelt Inaugural	\N	\N	\N	\N	32
370	\N	\N	Thomas Cole	\N	\N	\N	\N	32
371	\N	\N	Upper Delaware	\N	\N	\N	\N	32
372	\N	\N	Vanderbilt Mansion	\N	\N	\N	\N	32
373	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
374	\N	\N	Women's Rights	\N	\N	\N	\N	32
375	\N	\N	Appalachian	\N	\N	\N	\N	7
376	\N	\N	Blue Ridge	\N	\N	\N	\N	33
377	\N	\N	Cape Hatteras	\N	\N	\N	\N	33
378	\N	\N	Cape Lookout	\N	\N	\N	\N	33
379	\N	\N	Carl Sandburg Home	\N	\N	\N	\N	33
380	\N	\N	Fort Raleigh	\N	\N	\N	\N	33
381	\N	\N	Great Smoky Mountains	\N	\N	\N	\N	33
382	\N	\N	Guilford Courthouse	\N	\N	\N	\N	33
383	\N	\N	Moores Creek	\N	\N	\N	\N	33
384	\N	\N	Overmountain Victory	\N	\N	\N	\N	33
385	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
386	\N	\N	Wright Brothers	\N	\N	\N	\N	33
387	\N	\N	Knife River Indian Villages	\N	\N	\N	\N	34
388	\N	\N	North Country	\N	\N	\N	\N	22
389	\N	\N	Theodore Roosevelt	\N	\N	\N	\N	34
390	\N	\N	Charles Young Buffalo Soldiers	\N	\N	\N	\N	35
391	\N	\N	Cuyahoga Valley	\N	\N	\N	\N	35
392	\N	\N	Dayton Aviation Heritage	\N	\N	\N	\N	35
393	\N	\N	First Ladies	\N	\N	\N	\N	35
394	\N	\N	Hopewell Culture	\N	\N	\N	\N	35
395	\N	\N	James A Garfield	\N	\N	\N	\N	35
396	\N	\N	North Country	\N	\N	\N	\N	22
397	\N	\N	Perry's Victory & International Peace	\N	\N	\N	\N	35
398	\N	\N	William Howard Taft	\N	\N	\N	\N	35
399	\N	\N	Butterfield Overland	\N	\N	\N	\N	3
400	\N	\N	Chickasaw	\N	\N	\N	\N	36
401	\N	\N	Fort Smith	\N	\N	\N	\N	4
402	\N	\N	Oklahoma City	\N	\N	\N	\N	36
403	\N	\N	Santa Fe	\N	\N	\N	\N	6
404	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
405	\N	\N	Washita Battlefield	\N	\N	\N	\N	36
406	\N	\N	California	\N	\N	\N	\N	5
407	\N	\N	Crater Lake	\N	\N	\N	\N	37
408	\N	\N	Fort Vancouver	\N	\N	\N	\N	37
409	\N	\N	Ice Age Floods	\N	\N	\N	\N	12
410	\N	\N	John Day Fossil Beds	\N	\N	\N	\N	37
411	\N	\N	Lewis and Clark	\N	\N	\N	\N	37
412	\N	\N	Nez Perce	\N	\N	\N	\N	12
413	\N	\N	Oregon	\N	\N	\N	\N	12
414	\N	\N	Oregon Caves	\N	\N	\N	\N	37
415	\N	\N	Allegheny Portage Railroad	\N	\N	\N	\N	38
416	\N	\N	Appalachian	\N	\N	\N	\N	7
417	\N	\N	Captain John Smith Chesapeake	\N	\N	\N	\N	8
418	\N	\N	Chesapeake Bay	\N	\N	\N	\N	8
419	\N	\N	Delaware Water Gap	\N	\N	\N	\N	30
420	\N	\N	Edgar Allan Poe	\N	\N	\N	\N	38
421	\N	\N	Eisenhower	\N	\N	\N	\N	38
422	\N	\N	First State	\N	\N	\N	\N	8
423	\N	\N	Flight 93	\N	\N	\N	\N	38
424	\N	\N	Fort Necessity	\N	\N	\N	\N	38
425	\N	\N	Friendship Hill	\N	\N	\N	\N	38
426	\N	\N	Gettysburg	\N	\N	\N	\N	38
427	\N	\N	Gloria Dei Church	\N	\N	\N	\N	38
428	\N	\N	Hopewell Furnace	\N	\N	\N	\N	38
429	\N	\N	Independence	\N	\N	\N	\N	38
430	\N	\N	Johnstown Flood	\N	\N	\N	\N	38
431	\N	\N	Lower Delaware	\N	\N	\N	\N	30
432	\N	\N	North Country	\N	\N	\N	\N	22
433	\N	\N	Potomac Heritage	\N	\N	\N	\N	20
434	\N	\N	Steamtown	\N	\N	\N	\N	38
435	\N	\N	Thaddeus Kosciuszko	\N	\N	\N	\N	38
436	\N	\N	Upper Delaware	\N	\N	\N	\N	32
437	\N	\N	Valley Forge	\N	\N	\N	\N	38
438	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
439	\N	\N	Blackstone River Valley	\N	\N	\N	\N	21
440	\N	\N	Roger Williams	\N	\N	\N	\N	39
441	\N	\N	Touro Synagogue	\N	\N	\N	\N	39
442	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
443	\N	\N	Charles Pinckney	\N	\N	\N	\N	40
444	\N	\N	Congaree	\N	\N	\N	\N	40
445	\N	\N	Cowpens	\N	\N	\N	\N	40
446	\N	\N	Fort Sumter and Fort Moultrie	\N	\N	\N	\N	40
447	\N	\N	Kings Mountain	\N	\N	\N	\N	40
448	\N	\N	Ninety Six	\N	\N	\N	\N	40
449	\N	\N	Overmountain Victory	\N	\N	\N	\N	33
450	\N	\N	Reconstruction Era	\N	\N	\N	\N	40
451	\N	\N	Badlands	\N	\N	\N	\N	41
452	\N	\N	Jewel Cave	\N	\N	\N	\N	41
453	\N	\N	Minuteman Missile	\N	\N	\N	\N	41
454	\N	\N	Missouri	\N	\N	\N	\N	27
455	\N	\N	Mount Rushmore	\N	\N	\N	\N	41
456	\N	\N	Wind Cave	\N	\N	\N	\N	41
457	\N	\N	Andrew Johnson	\N	\N	\N	\N	42
458	\N	\N	Appalachian	\N	\N	\N	\N	7
459	\N	\N	Big South Fork	\N	\N	\N	\N	17
460	\N	\N	Chickamauga & Chattanooga	\N	\N	\N	\N	10
461	\N	\N	Cumberland Gap	\N	\N	\N	\N	17
462	\N	\N	Fort Donelson	\N	\N	\N	\N	17
463	\N	\N	Great Smoky Mountains	\N	\N	\N	\N	33
464	\N	\N	Manhattan Project	\N	\N	\N	\N	31
465	\N	\N	Natchez Trace	\N	\N	\N	\N	1
466	\N	\N	Natchez Trace	\N	\N	\N	\N	1
467	\N	\N	Obed	\N	\N	\N	\N	42
468	\N	\N	Overmountain Victory	\N	\N	\N	\N	33
469	\N	\N	Shiloh	\N	\N	\N	\N	24
470	\N	\N	Stones River	\N	\N	\N	\N	42
471	\N	\N	Trail Of Tears	\N	\N	\N	\N	1
472	\N	\N	Alibates Flint Quarries	\N	\N	\N	\N	43
473	\N	\N	Amistad	\N	\N	\N	\N	43
474	\N	\N	Big Bend	\N	\N	\N	\N	43
475	\N	\N	Big Thicket	\N	\N	\N	\N	43
476	\N	\N	Blackwell School	\N	\N	\N	\N	43
477	\N	\N	Butterfield Overland	\N	\N	\N	\N	3
478	\N	\N	Chamizal	\N	\N	\N	\N	43
479	\N	\N	El Camino Real de los Tejas	\N	\N	\N	\N	18
480	\N	\N	El Camino Real de Tierra Adentro	\N	\N	\N	\N	31
481	\N	\N	Fort Davis	\N	\N	\N	\N	43
482	\N	\N	Guadalupe Mountains	\N	\N	\N	\N	43
483	\N	\N	Lake Meredith	\N	\N	\N	\N	43
484	\N	\N	Lyndon B Johnson	\N	\N	\N	\N	43
485	\N	\N	Padre Island	\N	\N	\N	\N	43
486	\N	\N	Palo Alto Battlefield	\N	\N	\N	\N	43
487	\N	\N	Rio Grande	\N	\N	\N	\N	43
488	\N	\N	San Antonio Missions	\N	\N	\N	\N	43
489	\N	\N	Waco Mammoth	\N	\N	\N	\N	43
490	\N	\N	Arches	\N	\N	\N	\N	44
491	\N	\N	Bryce Canyon	\N	\N	\N	\N	44
492	\N	\N	California	\N	\N	\N	\N	5
493	\N	\N	Canyonlands	\N	\N	\N	\N	44
494	\N	\N	Capitol Reef	\N	\N	\N	\N	44
495	\N	\N	Cedar Breaks	\N	\N	\N	\N	44
496	\N	\N	Dinosaur	\N	\N	\N	\N	6
497	\N	\N	Glen Canyon	\N	\N	\N	\N	3
498	\N	\N	Golden Spike	\N	\N	\N	\N	44
499	\N	\N	Hovenweep	\N	\N	\N	\N	6
500	\N	\N	Mormon Pioneer	\N	\N	\N	\N	13
501	\N	\N	Natural Bridges	\N	\N	\N	\N	44
502	\N	\N	Old Spanish	\N	\N	\N	\N	3
503	\N	\N	Pony Express	\N	\N	\N	\N	5
504	\N	\N	Rainbow Bridge	\N	\N	\N	\N	44
505	\N	\N	Timpanogos Cave	\N	\N	\N	\N	44
506	\N	\N	Zion	\N	\N	\N	\N	44
507	\N	\N	Appalachian	\N	\N	\N	\N	7
508	\N	\N	Marsh - Billings - Rockefeller	\N	\N	\N	\N	45
509	\N	\N	North Country	\N	\N	\N	\N	22
510	\N	\N	Appalachian	\N	\N	\N	\N	7
511	\N	\N	Appomattox Court House	\N	\N	\N	\N	46
512	\N	\N	Arlington House, The Robert E. Lee Memorial	\N	\N	\N	\N	46
513	\N	\N	Assateague Island	\N	\N	\N	\N	20
514	\N	\N	Blue Ridge	\N	\N	\N	\N	33
515	\N	\N	Booker T Washington	\N	\N	\N	\N	46
516	\N	\N	Cape Henry Memorial	\N	\N	\N	\N	46
517	\N	\N	Captain John Smith Chesapeake	\N	\N	\N	\N	8
518	\N	\N	Cedar Creek & Belle Grove	\N	\N	\N	\N	46
519	\N	\N	Chesapeake Bay	\N	\N	\N	\N	8
520	\N	\N	Civil War Defenses of Washington	\N	\N	\N	\N	20
521	\N	\N	Colonial	\N	\N	\N	\N	46
522	\N	\N	Cumberland Gap	\N	\N	\N	\N	17
523	\N	\N	Fort Monroe	\N	\N	\N	\N	46
524	\N	\N	Fredericksburg & Spotsylvania	\N	\N	\N	\N	46
525	\N	\N	George Washington	\N	\N	\N	\N	20
526	\N	\N	George Washington Birthplace	\N	\N	\N	\N	46
527	\N	\N	Great Falls	\N	\N	\N	\N	46
528	\N	\N	Green Springs	\N	\N	\N	\N	46
529	\N	\N	Harpers Ferry	\N	\N	\N	\N	20
530	\N	\N	Historic Jamestowne	\N	\N	\N	\N	46
531	\N	\N	Maggie L Walker	\N	\N	\N	\N	46
532	\N	\N	Manassas	\N	\N	\N	\N	46
533	\N	\N	Overmountain Victory	\N	\N	\N	\N	33
534	\N	\N	Petersburg	\N	\N	\N	\N	46
535	\N	\N	Potomac Heritage	\N	\N	\N	\N	20
536	\N	\N	Prince William Forest	\N	\N	\N	\N	46
537	\N	\N	Richmond	\N	\N	\N	\N	46
538	\N	\N	Shenandoah	\N	\N	\N	\N	46
539	\N	\N	Star-Spangled Banner	\N	\N	\N	\N	20
540	\N	\N	Washington-Rochambeau Revolutionary Route	\N	\N	\N	\N	7
541	\N	\N	Wolf Trap National Park for the Performing Arts	\N	\N	\N	\N	46
542	\N	\N	Yorktown Battlefield	\N	\N	\N	\N	46
543	\N	\N	Ebey's Landing	\N	\N	\N	\N	47
544	\N	\N	Fort Vancouver	\N	\N	\N	\N	37
545	\N	\N	Ice Age Floods	\N	\N	\N	\N	12
546	\N	\N	Klondike Gold Rush - Seattle Unit	\N	\N	\N	\N	47
547	\N	\N	Lake Roosevelt	\N	\N	\N	\N	47
548	\N	\N	Lewis and Clark	\N	\N	\N	\N	37
549	\N	\N	Manhattan Project	\N	\N	\N	\N	31
550	\N	\N	Minidoka	\N	\N	\N	\N	12
551	\N	\N	Mount Rainier	\N	\N	\N	\N	47
552	\N	\N	Nez Perce	\N	\N	\N	\N	12
553	\N	\N	North Cascades	\N	\N	\N	\N	47
554	\N	\N	Olympic	\N	\N	\N	\N	47
555	\N	\N	Oregon	\N	\N	\N	\N	12
556	\N	\N	San Juan Island	\N	\N	\N	\N	47
557	\N	\N	Whitman Mission	\N	\N	\N	\N	47
558	\N	\N	Wing Luke Museum	\N	\N	\N	\N	47
559	\N	\N	Appalachian	\N	\N	\N	\N	7
560	\N	\N	Bluestone	\N	\N	\N	\N	48
561	\N	\N	Chesapeake & Ohio Canal	\N	\N	\N	\N	20
562	\N	\N	Chesapeake Bay	\N	\N	\N	\N	8
563	\N	\N	Gauley River	\N	\N	\N	\N	48
564	\N	\N	Harpers Ferry	\N	\N	\N	\N	20
565	\N	\N	New River Gorge	\N	\N	\N	\N	48
566	\N	\N	Apostle Islands	\N	\N	\N	\N	49
567	\N	\N	Ice Age	\N	\N	\N	\N	49
568	\N	\N	North Country	\N	\N	\N	\N	22
569	\N	\N	Saint Croix	\N	\N	\N	\N	23
570	\N	\N	Bighorn Canyon	\N	\N	\N	\N	26
571	\N	\N	California	\N	\N	\N	\N	5
572	\N	\N	Devils Tower	\N	\N	\N	\N	50
573	\N	\N	Fort Laramie	\N	\N	\N	\N	50
574	\N	\N	Fossil Butte	\N	\N	\N	\N	50
575	\N	\N	Grand Teton	\N	\N	\N	\N	50
576	\N	\N	Mormon Pioneer	\N	\N	\N	\N	13
577	\N	\N	Oregon	\N	\N	\N	\N	12
578	\N	\N	Pony Express	\N	\N	\N	\N	5
579	\N	\N	Yellowstone	\N	\N	\N	\N	12
\.


--
-- Data for Name: places_to_go; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.places_to_go (place_id, description, location, name, type, park_id) FROM stdin;
\.


--
-- Data for Name: things_to_do; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.things_to_do (activity_id, description, location, name, type, park_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.users (id, contact, email, first_name, last_name, password, username) FROM stdin;
\.


--
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.comments_comment_id_seq', 1, false);


--
-- Name: dining_and_sleeping_dns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.dining_and_sleeping_dns_id_seq', 1, false);


--
-- Name: location_loc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.location_loc_id_seq', 50, true);


--
-- Name: national_park_park_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.national_park_park_id_seq', 579, true);


--
-- Name: places_to_go_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.places_to_go_place_id_seq', 1, false);


--
-- Name: things_to_do_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.things_to_do_activity_id_seq', 1, false);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- Name: dining_and_sleeping dining_and_sleeping_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.dining_and_sleeping
    ADD CONSTRAINT dining_and_sleeping_pkey PRIMARY KEY (dns_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (loc_id);


--
-- Name: national_park national_park_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.national_park
    ADD CONSTRAINT national_park_pkey PRIMARY KEY (park_id);


--
-- Name: places_to_go places_to_go_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.places_to_go
    ADD CONSTRAINT places_to_go_pkey PRIMARY KEY (place_id);


--
-- Name: things_to_do things_to_do_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.things_to_do
    ADD CONSTRAINT things_to_do_pkey PRIMARY KEY (activity_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: national_park fk22hrd54mcu5ofyg8jcv4trsdm; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.national_park
    ADD CONSTRAINT fk22hrd54mcu5ofyg8jcv4trsdm FOREIGN KEY (loc_id) REFERENCES public.location(loc_id);


--
-- Name: comments fk61ws0uueg3wnlflcq0un5k1ty; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk61ws0uueg3wnlflcq0un5k1ty FOREIGN KEY (park_id) REFERENCES public.national_park(park_id);


--
-- Name: dining_and_sleeping fk70dkakiiytepfv5b7qf2d15xl; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.dining_and_sleeping
    ADD CONSTRAINT fk70dkakiiytepfv5b7qf2d15xl FOREIGN KEY (park_id) REFERENCES public.national_park(park_id);


--
-- Name: comments fk8omq0tc18jd43bu5tjh6jvraq; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk8omq0tc18jd43bu5tjh6jvraq FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: things_to_do fkidsal8k7yqq2cx1mp7d07a2hb; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.things_to_do
    ADD CONSTRAINT fkidsal8k7yqq2cx1mp7d07a2hb FOREIGN KEY (park_id) REFERENCES public.national_park(park_id);


--
-- Name: places_to_go fkra7mmep4m0ipxjl6p59dvw37v; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.places_to_go
    ADD CONSTRAINT fkra7mmep4m0ipxjl6p59dvw37v FOREIGN KEY (park_id) REFERENCES public.national_park(park_id);


--
-- PostgreSQL database dump complete
--

