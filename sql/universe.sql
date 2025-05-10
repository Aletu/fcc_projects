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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years integer,
    lightyears_from_earth numeric,
    is_part_of_local_group boolean
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
    name character varying NOT NULL,
    description text,
    is_spherical boolean,
    gravity numeric,
    planet_id integer
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
    name character varying NOT NULL,
    description text,
    orbital_period_in_days integer,
    gravity numeric,
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
    name character varying NOT NULL,
    description text,
    planet_count integer,
    color character varying,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Vesta', 'The second-largest asteroid in the main belt and the only one visible to the naked eye under dark skies', 1);
INSERT INTO public.asteroid VALUES (2, 'Bennu', 'A near-Earth asteroid that was the target of NASA''s OSIRIS-REx mission to collect a sample', 1);
INSERT INTO public.asteroid VALUES (3, 'Ida', 'An S-type asteroid in the main belt notable for having its own moon, Dactyl', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that includes the Solar System', 13600, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way', 10010, 2537000, true);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 'A dark band of absorbing dust partially in front of its bright nucleus gave rise to its nicknames', 13280, 17290000, false);
INSERT INTO public.galaxy VALUES (4, 'Condor', 'The largest known spiral galaxy', 5000, 212000000, false);
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxies', 'These galaxies are in the process of colliding and merging with each other', NULL, 60000000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Similar in appearance to a sombrero', 13250, 31100000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Earth''s moon', true, 1.62, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 'Scientists believe a saltwater ocean lies beneath its icy shell', true, 1.315, 3);
INSERT INTO public.moon VALUES (3, 'Io', 'The most geologically active object in the Solar System', true, 1.796, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'The largest moon in the solar system and the only one known to have its own magnetosphere', true, 1.43, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Heavily cratered and the most geologically inactive of the Galilean moons', true, 1.26, 3);
INSERT INTO public.moon VALUES (6, 'Titan', 'Saturn''s largest moon, known for its dense, nitrogen-rich atmosphere and liquid methane lakes', true, 1.35, 2);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'This small moon of Saturn is famous for its south polar geysers that erupt water ice and organic molecules', true, 0.11, 2);
INSERT INTO public.moon VALUES (8, 'Triton', 'Neptune''s largest moon, notable for its retrograde orbit (opposite to the planet''s rotation) and icy volcanic activity', true, 0.78, 5);
INSERT INTO public.moon VALUES (9, 'Miranda', 'A bizarrely featured moon of Uranus with a surface showing evidence of intense geological activity in the past', true, 0.08, 4);
INSERT INTO public.moon VALUES (10, 'Ariel', 'One of Uranus''s major moons, characterized by bright, relatively young terrain crisscrossed by valleys and scarps', true, 0.06, 4);
INSERT INTO public.moon VALUES (11, 'Umbriel', 'The darkest of Uranus''s major moons, with a heavily cratered and ancient surface', true, 0.05, 4);
INSERT INTO public.moon VALUES (12, 'Titania', 'Uranus''s largest moon, featuring a heavily faulted surface with canyons and scarps', true, 0.04, 4);
INSERT INTO public.moon VALUES (13, 'Oberon', 'The outermost major moon of Uranus, with a heavily cratered surface and evidence of some past geological activity', true, 0.03, 4);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Saturn''s second-largest moon, a heavily cratered icy body with tenuous hints of a possible thin atmosphere', true, 0.26, 2);
INSERT INTO public.moon VALUES (15, 'Dione', 'A mid-sized moon of Saturn with bright wispy terrain and evidence of tectonic activity', true, 0.23, 2);
INSERT INTO public.moon VALUES (16, 'Tethys', 'A mid-sized moon of Saturn featuring a giant impact crater called Odysseus and a massive canyon system called Ithaca Chasma', true, 0.15, 2);
INSERT INTO public.moon VALUES (17, 'Mimas', 'This small moon of Saturn is easily recognizable due to a massive impact crater, Herschel, that gives it a "Death Star" appearance', true, 0.06, 2);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'A uniquely shaped, non-spherical moon of Saturn with a chaotic rotation', false, 0.002, 2);
INSERT INTO public.moon VALUES (19, 'Phobos', 'The larger of Mars''s two moons, an irregularly shaped body that is gradually spiraling inward towards the planet', false, 0.006, 6);
INSERT INTO public.moon VALUES (20, 'Deimos', 'Mars''s smaller moon, also irregularly shaped and farther from the planet than Phobos', false, 0.0004, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known celestial body to support life', 365, 9.8, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 'Surrounded by a beautiful ring system', 10756, 10.44, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest and most massive planet in our Solar System', 4333, 24.79, 1);
INSERT INTO public.planet VALUES (4, 'Uranus', 'An ice giant with a unique axial tilt of nearly 98 degrees, causing extreme seasonal variations', 30687, 8.69, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'The farthest known major planet from the Sun, an ice giant with strong winds and a vibrant blue color', 60190, 11.15, 1);
INSERT INTO public.planet VALUES (6, 'Mars', 'The "Red Planet," a terrestrial planet known for its rusty appearance and past potential for liquid water', 687, 3.73, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'The smallest planet in our solar system and the closest to the Sun with extreme temperature variations', 88, 3.7, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'A scorching hot and volcanically active planet with a dense, toxic atmosphere', 225, 8.87, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'The first Earth-size planet found in the habitable zone of another star', 130, 11.7, 5);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'The closest exoplanet to our solar system, orbiting the red dwarf Proxima Centauri', 11, 8.5, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'One of several Earth-sized planets in the habitable zone of an ultracool dwarf star', 6, 8.2, 2);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 'The first exoplanet discovered orbiting a Sun-like star, a "hot Jupiter"', 4, 3.24, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System', 8, 'White', 1);
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 'Has seven known exoplanets', 7, 'Red', 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Closest star to Earth after the Sun', 3, 'Red', 1);
INSERT INTO public.star VALUES (4, '51 Pegasi', 'This system is historically significant as it was the first exoplanet discovered orbiting a sun-like star', 1, 'Yellow', 1);
INSERT INTO public.star VALUES (5, 'Kepler-186', 'Includes the first Earth-sized world discovered in the habitable zone', 5, 'Red', 1);
INSERT INTO public.star VALUES (6, 'WASP-12', 'Contains the hottest known planet in the Milky Way', 1, 'Yellow', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: asteroid cstr_asteroid_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT cstr_asteroid_name_uq UNIQUE (name);


--
-- Name: galaxy cstr_galaxy_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT cstr_galaxy_name_uq UNIQUE (name);


--
-- Name: moon cstr_moon_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT cstr_moon_name_uq UNIQUE (name);


--
-- Name: planet cstr_planet_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT cstr_planet_name_uq UNIQUE (name);


--
-- Name: star cstr_star_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT cstr_star_name_uq UNIQUE (name);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: asteroid fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

