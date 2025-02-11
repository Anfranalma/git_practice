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
    name character varying(255) NOT NULL,
    origin character varying(255) NOT NULL,
    velocity_km_s numeric NOT NULL,
    has_tail boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years numeric NOT NULL,
    contains_black_hole boolean NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    has_atmosphere boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    radius_in_km integer NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_solar_units numeric NOT NULL,
    has_planets boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Oort Cloud', 70.56, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Oort Cloud', 52.0, true);
INSERT INTO public.comet VALUES (3, 'Encke', 'Jupiter Family', 69.0, true);
INSERT INTO public.comet VALUES (4, 'Hyakutake', 'Oort Cloud', 55.0, true);
INSERT INTO public.comet VALUES (5, 'Tempel 1', 'Jupiter Family', 41.0, true);
INSERT INTO public.comet VALUES (6, 'Wild 2', 'Jupiter Family', 38.0, true);
INSERT INTO public.comet VALUES (7, 'Borrelly', 'Jupiter Family', 32.0, true);
INSERT INTO public.comet VALUES (8, 'Ikeya-Seki', 'Oort Cloud', 60.0, true);
INSERT INTO public.comet VALUES (9, 'McNaught', 'Oort Cloud', 80.0, true);
INSERT INTO public.comet VALUES (10, 'Lovejoy', 'Oort Cloud', 62.0, true);
INSERT INTO public.comet VALUES (11, 'Swift-Tuttle', 'Oort Cloud', 55.0, true);
INSERT INTO public.comet VALUES (12, 'Neowise', 'Oort Cloud', 72.0, true);
INSERT INTO public.comet VALUES (13, 'Shoemaker-Levy 9', 'Jupiter Family', 44.0, true);
INSERT INTO public.comet VALUES (14, 'C/2019 Y4', 'Oort Cloud', 65.0, true);
INSERT INTO public.comet VALUES (15, 'C/2020 F3', 'Oort Cloud', 58.0, true);
INSERT INTO public.comet VALUES (16, 'C/2021 A1', 'Oort Cloud', 67.0, true);
INSERT INTO public.comet VALUES (17, 'Comet 67P', 'Jupiter Family', 34.0, true);
INSERT INTO public.comet VALUES (18, 'Churyumov-Gerasimenko', 'Jupiter Family', 36.0, true);
INSERT INTO public.comet VALUES (19, 'Kohoutek', 'Oort Cloud', 71.0, true);
INSERT INTO public.comet VALUES (20, 'Great Comet of 1811', 'Oort Cloud', 75.0, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in Local Group', 8000, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical galaxy with massive black hole', 14000, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Classic spiral galaxy', 9000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Has a bright nucleus', 11000, true);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 'Unusual ring shape', 12000, false);
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Satellite of Milky Way', 5000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3475, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5262, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, true);
INSERT INTO public.moon VALUES (10, 'Triton', 7, 2706, true);
INSERT INTO public.moon VALUES (11, 'Oberon', 8, 1523, false);
INSERT INTO public.moon VALUES (12, 'Titania', 8, 1578, false);
INSERT INTO public.moon VALUES (13, 'Miranda', 8, 471, false);
INSERT INTO public.moon VALUES (14, 'Ariel', 8, 1158, false);
INSERT INTO public.moon VALUES (15, 'Proxima Moon I', 9, 3200, true);
INSERT INTO public.moon VALUES (16, 'Alpha Moon I', 10, 4500, false);
INSERT INTO public.moon VALUES (17, 'Alpha Moon II', 10, 2800, false);
INSERT INTO public.moon VALUES (18, 'Altair I-a', 11, 5000, true);
INSERT INTO public.moon VALUES (19, 'Altair II-a', 12, 6000, true);
INSERT INTO public.moon VALUES (20, 'Altair II-b', 12, 5000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 6052, false);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 2439, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, false);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 24622, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 25362, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 7100, true);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 6, 5800, false);
INSERT INTO public.planet VALUES (11, 'Altair I', 8, 9000, false);
INSERT INTO public.planet VALUES (12, 'Altair II', 8, 6500, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.1, false);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 0.12, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8.5, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 18, false);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 1.1, true);
INSERT INTO public.star VALUES (7, 'Vega', 2, 2.2, false);
INSERT INTO public.star VALUES (8, 'Altair', 2, 1.8, true);
INSERT INTO public.star VALUES (9, 'Deneb', 2, 20.0, false);
INSERT INTO public.star VALUES (10, 'Arcturus', 3, 1.5, false);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: comet comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comet comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

