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
    name character varying(30),
    number_of_starts numeric(20,2),
    description text,
    is_spiral boolean,
    is_active boolean,
    total_mass numeric(20,2) NOT NULL,
    star_density integer NOT NULL,
    distance_from_earth integer NOT NULL
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
    planet_id integer,
    name character varying(30),
    orbital_period double precision,
    description text,
    is_volcanic boolean,
    is_atmosphere boolean NOT NULL,
    total_mass numeric(40,2) NOT NULL
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
    name character varying(30),
    mass double precision,
    description text,
    has_life boolean,
    is_habitable boolean,
    radius integer,
    star_id integer NOT NULL,
    total_mass numeric(50,2) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon_simple_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_simple_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_simple_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_simple; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon_simple (
    planet_moon_simple_id bigint DEFAULT nextval('public.planet_moon_simple_id_seq'::regclass) NOT NULL,
    planet_id integer,
    moon_id integer,
    name character varying(30),
    moon_name character varying(30),
    is_habitable boolean,
    is_volcanic boolean,
    some_mass_value double precision NOT NULL,
    some_description text NOT NULL
);


ALTER TABLE public.planet_moon_simple OWNER TO freecodecamp;

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
    name character varying(30),
    luminosity double precision,
    description text,
    is_binary boolean,
    is_visible boolean,
    surface_temperature integer,
    galaxy_id integer NOT NULL,
    total_mass numeric(40,2) NOT NULL
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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 100000000000000.00, 'La galaxia Andrómeda es la galaxia espiral más cercana a la Tierra.', true, true, 1200000000000.00, 10, 2500000);
INSERT INTO public.galaxy VALUES (2, 'Vía Láctea', 100000000000000.00, 'La Vía Láctea es la galaxia que contiene nuestro Sistema Solar.', true, true, 100000000000.00, 5, 0);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 70000000000000.00, 'La galaxia Messier 81 es una galaxia espiral barrada.', true, true, 70000000000.00, 6, 12000000);
INSERT INTO public.galaxy VALUES (4, 'Centauro A', 60000000000000.00, 'La galaxia Centauro A es una galaxia espiral lenticular.', false, true, 180000000000.00, 50, 4300000);
INSERT INTO public.galaxy VALUES (5, 'Bode s Galaxy', 10000000000000.00, 'La galaxia de Bode es una galaxia espiral barrada.', true, true, 80000000000.00, 10, 12000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 10000000000000.00, 'La galaxia Sombrero es una galaxia espiral sin barra.', false, true, 100000000000.00, 15, 28000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (44, 1, 'Moon', 27.3, 'Earth s only natural satellite', false, false, 73500000000000000000000.00);
INSERT INTO public.moon VALUES (45, 2, 'Phobos', 0.3, 'Mars inner moon', false, false, 10800000000000000.00);
INSERT INTO public.moon VALUES (46, 2, 'Deimos', 1.3, 'Mars outer moon', false, false, 2000000000000000.00);
INSERT INTO public.moon VALUES (47, 3, 'Io', 1.8, 'Galilean moon of Jupiter', true, true, 89300000000000000000000.00);
INSERT INTO public.moon VALUES (48, 3, 'Europa', 3.5, 'Galilean moon of Jupiter', false, true, 48000000000000000000000.00);
INSERT INTO public.moon VALUES (49, 3, 'Ganymede', 7.1, 'Largest moon in the Solar System', false, true, 148000000000000000000000.00);
INSERT INTO public.moon VALUES (50, 3, 'Callisto', 16.7, 'Galilean moon of Jupiter', false, true, 108000000000000000000000.00);
INSERT INTO public.moon VALUES (51, 4, 'Titan', 15.9, 'Largest moon of Saturn', false, true, 135000000000000000000000.00);
INSERT INTO public.moon VALUES (52, 4, 'Enceladus', 1.4, 'Moon of Saturn with geysers', true, true, 108000000000000000000.00);
INSERT INTO public.moon VALUES (53, 5, 'Triton', 5.9, 'Largest moon of Neptune', false, true, 21400000000000000000000.00);
INSERT INTO public.moon VALUES (54, 5, 'Nereid', 360.1, 'Moon of Neptune with eccentric orbit', false, false, 31000000000000000000.00);
INSERT INTO public.moon VALUES (55, 6, 'Charon', 6.4, 'Largest moon of Pluto', false, true, 1520000000000000000000.00);
INSERT INTO public.moon VALUES (56, 6, 'Styx', 20.2, 'Small moon of Pluto', false, false, 750000000000000000.00);
INSERT INTO public.moon VALUES (57, 6, 'Nix', 24.9, 'Small moon of Pluto', false, false, 450000000000000000.00);
INSERT INTO public.moon VALUES (58, 6, 'Kerberos', 32.1, 'Small moon of Pluto', false, false, 1600000000000000000.00);
INSERT INTO public.moon VALUES (59, 6, 'Hydra', 38.2, 'Small moon of Pluto', false, false, 490000000000000000.00);
INSERT INTO public.moon VALUES (60, 7, 'Oberon', 13.5, 'Moon of Uranus', false, true, 3000000000000000000000.00);
INSERT INTO public.moon VALUES (61, 7, 'Titania', 8.7, 'Largest moon of Uranus', false, true, 3400000000000000000000.00);
INSERT INTO public.moon VALUES (62, 8, 'Miranda', 1.4, 'Moon of Uranus with unique features', false, true, 65900000000000000000.00);
INSERT INTO public.moon VALUES (63, 8, 'Ariel', 2.5, 'Moon of Uranus', false, true, 1350000000000000000000.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5.97, 'Our home planet', true, true, 6371, 1, 5970000000000000000000000.00);
INSERT INTO public.planet VALUES (2, 'Mars', 0.642, 'The Red Planet', false, true, 3389, 1, 642000000000000000000000.00);
INSERT INTO public.planet VALUES (3, 'Venus', 4.87, 'Earth s sister planet', false, false, 6052, 1, 4870000000000000000000000.00);
INSERT INTO public.planet VALUES (4, 'Proxima b', 1.27, 'Exoplanet in the habitable zone', false, true, 7150, 2, 1270000000000000000000000.00);
INSERT INTO public.planet VALUES (5, 'Proxima c', 2.78, 'Second planet in the Proxima Centauri system', false, false, 13800, 2, 2780000000000000000000000.00);
INSERT INTO public.planet VALUES (6, 'Sirius b', 1.02, 'White dwarf companion of Sirius A', false, false, 2500, 3, 1020000000000000000000000000000.00);
INSERT INTO public.planet VALUES (7, 'Betelgeuse b', 10, 'Hypothetical planet around Betelgeuse', false, false, 12000, 4, 10000000000000000000000000000000.00);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 1.1, 'Exoplanet orbiting Alpha Centauri B', false, true, 6800, 5, 1100000000000000000000000.00);
INSERT INTO public.planet VALUES (9, 'Vega b', 2.5, 'Hypothetical planet around Vega', false, false, 9000, 6, 2500000000000000000000000.00);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2.4, 'Potentially habitable exoplanet', false, true, 11500, 1, 2400000000000000000000000.00);
INSERT INTO public.planet VALUES (11, 'GJ 1214b', 6.55, 'Waterworld exoplanet', false, false, 15300, 1, 6550000000000000000000000.00);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 0.69, 'Earth-sized exoplanet in the habitable zone', false, true, 5810, 1, 690000000000000000000000.00);


--
-- Data for Name: planet_moon_simple; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon_simple VALUES (1, 1, 1, 'Earth', 'Moon', true, false, 5.97, 'Earth s only natural satellite');
INSERT INTO public.planet_moon_simple VALUES (2, 2, 2, 'Mars', 'Phobos', true, false, 0.642, 'Mars inner moon');
INSERT INTO public.planet_moon_simple VALUES (3, 2, 3, 'Mars', 'Deimos', true, false, 0.642, 'Mars outer moon');
INSERT INTO public.planet_moon_simple VALUES (4, 3, 4, 'Venus', 'Io', false, true, 4.87, 'Galilean moon of Jupiter');
INSERT INTO public.planet_moon_simple VALUES (5, 3, 5, 'Venus', 'Europa', false, false, 4.87, 'Galilean moon of Jupiter');
INSERT INTO public.planet_moon_simple VALUES (6, 3, 6, 'Venus', 'Ganymede', false, false, 4.87, 'Largest moon in the Solar System');
INSERT INTO public.planet_moon_simple VALUES (7, 3, 7, 'Venus', 'Callisto', false, false, 4.87, 'Galilean moon of Jupiter');
INSERT INTO public.planet_moon_simple VALUES (8, 4, 8, 'Proxima b', 'Titan', true, false, 1.27, 'Largest moon of Saturn');
INSERT INTO public.planet_moon_simple VALUES (9, 4, 9, 'Proxima b', 'Enceladus', true, true, 1.27, 'Moon of Saturn with geysers');
INSERT INTO public.planet_moon_simple VALUES (10, 5, 10, 'Proxima c', 'Triton', false, false, 2.78, 'Largest moon of Neptune');
INSERT INTO public.planet_moon_simple VALUES (11, 5, 11, 'Proxima c', 'Nereid', false, false, 2.78, 'Moon of Neptune with eccentric orbit');
INSERT INTO public.planet_moon_simple VALUES (12, 6, 12, 'Sirius b', 'Charon', false, false, 1.02, 'Largest moon of Pluto');
INSERT INTO public.planet_moon_simple VALUES (13, 6, 13, 'Sirius b', 'Styx', false, false, 1.02, 'Small moon of Pluto');
INSERT INTO public.planet_moon_simple VALUES (14, 6, 14, 'Sirius b', 'Nix', false, false, 1.02, 'Small moon of Pluto');
INSERT INTO public.planet_moon_simple VALUES (15, 6, 15, 'Sirius b', 'Kerberos', false, false, 1.02, 'Small moon of Pluto');
INSERT INTO public.planet_moon_simple VALUES (16, 6, 16, 'Sirius b', 'Hydra', false, false, 1.02, 'Small moon of Pluto');
INSERT INTO public.planet_moon_simple VALUES (17, 7, 17, 'Betelgeuse b', 'Oberon', false, false, 10, 'Moon of Uranus');
INSERT INTO public.planet_moon_simple VALUES (18, 7, 18, 'Betelgeuse b', 'Titania', false, false, 10, 'Largest moon of Uranus');
INSERT INTO public.planet_moon_simple VALUES (19, 8, 19, 'Alpha Centauri Bb', 'Miranda', true, false, 1.1, 'Moon of Uranus with unique features');
INSERT INTO public.planet_moon_simple VALUES (20, 8, 20, 'Alpha Centauri Bb', 'Ariel', true, false, 1.1, 'Moon of Uranus');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Our home star', false, true, 5778, 1, 1989000000000000000000000000000.00);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.0017, 'Nearest star to the Sun', false, true, 3042, 2, 244700000000000000000000000000.00);
INSERT INTO public.star VALUES (3, 'Sirius', 25.4, 'Brightest star in the night sky', true, true, 9940, 1, 3470000000000000000000000000000.00);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 126000, 'Red supergiant star', false, true, 3600, 1, 79500000000000000000000000000000.00);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1.519, 'Part of the Alpha Centauri star system', true, true, 5790, 2, 2180000000000000000000000000000.00);
INSERT INTO public.star VALUES (6, 'Vega', 40, 'Bright star in the Lyra constellation', false, true, 9602, 1, 2360000000000000000000000000000.00);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 63, true);


--
-- Name: planet_moon_simple_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_simple_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_moon_simple planet_moon_simple_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_simple
    ADD CONSTRAINT planet_moon_simple_pkey PRIMARY KEY (planet_moon_simple_id);


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
-- Name: planet_moon_simple unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_simple
    ADD CONSTRAINT unique_moon_name UNIQUE (moon_name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


