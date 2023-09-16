--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    name character varying(30) NOT NULL,
    age integer,
    size integer,
    earth_distance numeric(5,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    size integer,
    earth_distance numeric(5,2),
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    size integer,
    earth_distance numeric(5,2),
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    name character varying(30) NOT NULL,
    species_id integer NOT NULL,
    population integer
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    size integer,
    earth_distance numeric(5,2),
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Sombrero', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (8, 'Phobos', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (9, 'Deimos', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (11, 'Triton', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Pandora', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Oberon', NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (15, 'Miranda', NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (16, 'Nereid', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Charon', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (17, 'Umbriel', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (18, 'Puck', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (19, 'Hyperion', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (20, 'Titania', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Europa', NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (3, 'Titan', NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (4, 'Io', NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (5, 'Enceladus', NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, NULL, NULL, NULL, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Venus', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Mercury', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Tatooine', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (11, 'Kamino', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (12, 'Naboo', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (3, 'Namek', NULL, NULL, NULL, NULL, 3);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES ('Humans', 1, NULL);
INSERT INTO public.species VALUES ('Aliens', 2, NULL);
INSERT INTO public.species VALUES ('Dogs', 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (6, 'Polaris', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (4, 'Betelgeuse', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'Vega', NULL, NULL, NULL, NULL, 4);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uk_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uk_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon uk_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uk_moon_id UNIQUE (moon_id);


--
-- Name: planet uk_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uk_planet_id UNIQUE (planet_id);


--
-- Name: species uk_species_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT uk_species_id UNIQUE (species_id);


--
-- Name: star uk_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uk_star_id UNIQUE (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

