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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age integer,
    size numeric,
    description text
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
-- Name: milkyway; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.milkyway (
    milkyway_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    home boolean
);


ALTER TABLE public.milkyway OWNER TO freecodecamp;

--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.milkyway_milkyway_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milkyway_milkyway_id_seq OWNER TO freecodecamp;

--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.milkyway_milkyway_id_seq OWNED BY public.milkyway.milkyway_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    size integer,
    mass integer
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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    mass integer,
    star_id integer
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
    name character varying(40) NOT NULL,
    galaxy_id integer,
    color text,
    mass integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: milkyway milkyway_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway ALTER COLUMN milkyway_id SET DEFAULT nextval('public.milkyway_milkyway_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 100, 'hazy');
INSERT INTO public.galaxy VALUES (2, 'Fireworks Galaxy', 100, 100, 'bright');
INSERT INTO public.galaxy VALUES (3, 'Comet Galaxy', 320, 160, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 50, 10, 'dwarf dalaxy');
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 170, 64, 'isolated spiral');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 500, 57, 'lenticular ring galaxy');


--
-- Data for Name: milkyway; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.milkyway VALUES (1, 'black', 1, true);
INSERT INTO public.milkyway VALUES (2, 'blue', 1, false);
INSERT INTO public.milkyway VALUES (3, 'brown', 1, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 1, 1, 5);
INSERT INTO public.moon VALUES (2, 'phobos', 5, 1, 1);
INSERT INTO public.moon VALUES (3, 'deimos', 5, 1, 2);
INSERT INTO public.moon VALUES (4, 'metis', 2, 1, 3);
INSERT INTO public.moon VALUES (5, 'adrastea', 2, 1, 4);
INSERT INTO public.moon VALUES (6, 'amalthea', 2, 1, 5);
INSERT INTO public.moon VALUES (7, 'thebe', 2, 1, 6);
INSERT INTO public.moon VALUES (8, 'io', 2, 1, 7);
INSERT INTO public.moon VALUES (9, 'europa', 2, 1, 8);
INSERT INTO public.moon VALUES (10, 'ganymede', 2, 1, 9);
INSERT INTO public.moon VALUES (11, 'callisto', 2, 1, 11);
INSERT INTO public.moon VALUES (12, 'themisto', 2, 1, 12);
INSERT INTO public.moon VALUES (13, 'leda', 2, 1, 13);
INSERT INTO public.moon VALUES (14, 'mimas', 6, 1, 1);
INSERT INTO public.moon VALUES (15, 'enceladus', 6, 1, 2);
INSERT INTO public.moon VALUES (16, 'tethys', 6, 1, 3);
INSERT INTO public.moon VALUES (17, 'titan', 6, 1, 4);
INSERT INTO public.moon VALUES (18, 'triton', 8, 1, 1);
INSERT INTO public.moon VALUES (19, 'lysithea', 2, 1, 14);
INSERT INTO public.moon VALUES (20, 'elara', 2, 1, 15);
INSERT INTO public.moon VALUES (21, 'euporie', 2, 1, 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'green', true, 6, 1);
INSERT INTO public.planet VALUES (2, 'jupiter', 'orange', false, 1, 1);
INSERT INTO public.planet VALUES (3, 'mercury', 'gray', false, 3, 1);
INSERT INTO public.planet VALUES (4, 'venus', 'yellow', false, 5, 1);
INSERT INTO public.planet VALUES (5, 'mars', 'red', false, 6, 1);
INSERT INTO public.planet VALUES (6, 'saturn', 'gold', false, 6, 1);
INSERT INTO public.planet VALUES (7, 'uranus', 'blue', false, 9, 1);
INSERT INTO public.planet VALUES (8, 'neptune', 'blue', false, 1, 1);
INSERT INTO public.planet VALUES (9, 'ceres', 'dwarf', false, 1, 1);
INSERT INTO public.planet VALUES (10, 'pluto', 'dwarf', false, 1, 1);
INSERT INTO public.planet VALUES (11, 'haumea', 'dwarf', false, 1, 1);
INSERT INTO public.planet VALUES (12, 'makemake', 'dwarf', false, 1, 1);
INSERT INTO public.planet VALUES (13, 'eris', 'dwarf', false, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 1, 'white', 100);
INSERT INTO public.star VALUES (2, 'sirius', 1, 'blue', 150);
INSERT INTO public.star VALUES (3, 'arcturus', 1, 'red', 150);
INSERT INTO public.star VALUES (4, 'Sanduleak -69° 202', 4, 'blue', 200);
INSERT INTO public.star VALUES (5, 'canopus', 1, 'white', 300);
INSERT INTO public.star VALUES (6, 'antares', 1, 'red', 500);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.milkyway_milkyway_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: milkyway milkyway_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway
    ADD CONSTRAINT milkyway_name_key UNIQUE (name);


--
-- Name: milkyway milkyway_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway
    ADD CONSTRAINT milkyway_pkey PRIMARY KEY (milkyway_id);


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

