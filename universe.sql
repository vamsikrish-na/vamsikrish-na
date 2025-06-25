--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    perihelion numeric(12,2),
    mass numeric(30,4),
    is_periodic boolean,
    code text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass numeric(20,2),
    number_of_stars integer NOT NULL,
    is_active boolean,
    code text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter integer NOT NULL,
    mass numeric(30,4),
    has_atmospheric boolean,
    designation text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    diameter integer NOT NULL,
    mass numeric(40,4),
    is_habitable boolean,
    designation text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    temperature integer NOT NULL,
    luminosity numeric(12,3),
    is_main_sequences boolean,
    code text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 0.59, 220000000000000.0000, true, 'CMT001');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 0.91, 560000000000000.0000, false, 'CMT002');
INSERT INTO public.comet VALUES (3, 'Encke', 1, 0.34, 35000000000000.0000, true, 'CMT003');
INSERT INTO public.comet VALUES (4, 'Hyakutake', 1, 0.23, 70000000000000.0000, false, 'CMT004');
INSERT INTO public.comet VALUES (5, 'Swift-Tuttle', 1, 0.96, 400000000000000.0000, true, 'CMT005');
INSERT INTO public.comet VALUES (6, 'Borrelly', 2, 1.36, 13000000000000.0000, false, 'CMT006');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1500000000000.00, 2500000, true, 'MWY001');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1200000000000.00, 10000000, true, 'AND002');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 500000000000.00, 400000, false, 'TRI003');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 800000000000.00, 800000, true, 'SOM004');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 1000000000000.00, 1600000, false, 'WHI005');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 900000000000.00, 1000000, true, 'PIN006');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 73500000000000000000000.0000, false, 'MO-001');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 10700000000000000.0000, false, 'MO-002');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1480000000000000.0000, false, 'MO-003');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 89300000000000000000000.0000, false, 'MO-004');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 48000000000000000000000.0000, false, 'MO-005');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 148000000000000000000000.0000, false, 'MO-006');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820, 108000000000000000000000.0000, false, 'MO-007');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 135000000000000000000000.0000, true, 'MO-008');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528, 2310000000000000000000.0000, false, 'MO-009');
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1469, 1810000000000000000000.0000, false, 'MO-010');
INSERT INTO public.moon VALUES (11, 'Miranda', 7, 471, 65900000000000000000.0000, false, 'MO-011');
INSERT INTO public.moon VALUES (12, 'Ariel', 7, 1158, 1350000000000000000000.0000, false, 'MO-012');
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, 1169, 1170000000000000000000.0000, false, 'MO-013');
INSERT INTO public.moon VALUES (14, 'Titania', 7, 1576, 3530000000000000000000.0000, false, 'MO-014');
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 1523, 3010000000000000000000.0000, false, 'MO-015');
INSERT INTO public.moon VALUES (16, 'Triton', 8, 2706, 21400000000000000000000.0000, true, 'MO-016');
INSERT INTO public.moon VALUES (17, 'Nereid', 8, 340, 31000000000000000000.0000, false, 'MO-017');
INSERT INTO public.moon VALUES (18, 'Charon', 8, 1212, 1520000000000000000000.0000, false, 'MO-018');
INSERT INTO public.moon VALUES (19, 'Proteus', 8, 420, 44000000000000000000.0000, false, 'MO-019');
INSERT INTO public.moon VALUES (20, 'Dione', 6, 1123, 1100000000000000000000.0000, false, 'MO-020');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4879, 330000000000000000000000.0000, false, 'PL-001');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, 4870000000000000000000000.0000, false, 'PL-002');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, 5970000000000000000000000.0000, true, 'PL-003');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779, 642000000000000000000000.0000, false, 'PL-004');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820, 1900000000000000000000000000.0000, false, 'PL-005');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460, 568000000000000000000000000.0000, false, 'PL-006');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 50724, 86800000000000000000000000.0000, false, 'PL-007');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49244, 102000000000000000000000000.0000, false, 'PL-008');
INSERT INTO public.planet VALUES (9, 'Proxima b', 5, 11600, 12700000000000000000000000.0000, true, 'PL-009');
INSERT INTO public.planet VALUES (10, 'Sirius b', 2, 12000, 20000000000000000000000000.0000, false, 'PL-010');
INSERT INTO public.planet VALUES (11, 'Betel-1', 3, 15000, 30000000000000000000000000.0000, false, 'PL-011');
INSERT INTO public.planet VALUES (12, 'Vega-1', 6, 17000, 22000000000000000000000000.0000, false, 'PL-012');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.000, true, 'ST-001');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 25.400, true, 'ST-002');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, 126000.000, false, 'ST-003');
INSERT INTO public.star VALUES (4, 'Rigel', 2, 12100, 120000.000, true, 'ST-004');
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 5790, 1.520, true, 'ST-005');
INSERT INTO public.star VALUES (6, 'Vega', 2, 9602, 40.120, true, 'ST-006');


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 1, false);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 1, false);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 1, false);


--
-- Name: comet comet_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_code_key UNIQUE (code);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_code_key UNIQUE (code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_designation_key UNIQUE (designation);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_designation_key UNIQUE (designation);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_code_key UNIQUE (code);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

