--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_code character varying(20) NOT NULL,
    type character varying(50),
    distance_ly numeric(12,2),
    discovered_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    moon_code character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    radius_km numeric(10,2),
    tidally_locked boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_code character varying(20) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    orbital_period_days numeric(10,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_code character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(20),
    mass_solar numeric(10,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: supernova; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supernova (
    supernova_id integer NOT NULL,
    name character varying(100) NOT NULL,
    supernova_code character varying(20) NOT NULL,
    star_id integer NOT NULL,
    sn_type text,
    peak_mag numeric(5,2),
    discovery_year integer
);


ALTER TABLE public.supernova OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'GAL-MW', 'Barred spiral', 0.00, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'GAL-M31', 'Spiral', 2537000.00, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'GAL-M33', 'Spiral', 2730000.00, 1654);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'GAL-M104', 'Unbarred', 29000000.00, 1781);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'GAL-M51', 'Spiral', 31000000.00, 1773);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic', 'GAL-LMC', 'Irregular', 163000.00, 1519);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'MN-LUN', 3, 1737.40, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'MN-PHO', 4, 11.30, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 'MN-DEI', 4, 6.20, true);
INSERT INTO public.moon VALUES (4, 'Io', 'MN-IO', 5, 1821.60, true);
INSERT INTO public.moon VALUES (5, 'Europa', 'MN-EUR', 5, 1560.80, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'MN-GAN', 5, 2634.10, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 'MN-CAL', 5, 2410.30, true);
INSERT INTO public.moon VALUES (8, 'Titan', 'MN-TIT', 6, 2574.70, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'MN-ENC', 6, 252.10, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 'MN-RHE', 6, 763.80, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', 'MN-IAP', 6, 734.50, true);
INSERT INTO public.moon VALUES (12, 'Mimas', 'MN-MIM', 6, 198.20, true);
INSERT INTO public.moon VALUES (13, 'Tethys', 'MN-TET', 6, 531.10, true);
INSERT INTO public.moon VALUES (14, 'Dione', 'MN-DIO', 6, 561.40, true);
INSERT INTO public.moon VALUES (15, 'Oberon', 'MN-OBE', 7, 761.40, true);
INSERT INTO public.moon VALUES (16, 'Titania', 'MN-TIT2', 7, 788.90, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'MN-UMB', 7, 584.70, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 'MN-ARI', 7, 578.90, true);
INSERT INTO public.moon VALUES (19, 'Triton', 'MN-TRI', 8, 1353.40, true);
INSERT INTO public.moon VALUES (20, 'Nereid', 'MN-NER', 8, 170.00, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'PL-MER', 1, false, 88.00);
INSERT INTO public.planet VALUES (2, 'Venus', 'PL-VEN', 1, false, 224.70);
INSERT INTO public.planet VALUES (3, 'Earth', 'PL-EAR', 1, true, 365.20);
INSERT INTO public.planet VALUES (4, 'Mars', 'PL-MAR', 1, false, 687.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'PL-JUP', 1, false, 4332.60);
INSERT INTO public.planet VALUES (6, 'Saturn', 'PL-SAT', 1, false, 10759.20);
INSERT INTO public.planet VALUES (7, 'Uranus', 'PL-URA', 1, false, 30687.20);
INSERT INTO public.planet VALUES (8, 'Neptune', 'PL-NEP', 1, false, 60190.00);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'PL-PXB', 2, false, 11.20);
INSERT INTO public.planet VALUES (10, 'Sirius b1', 'PL-SB1', 3, false, 200.00);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 'PL-BEB', 4, false, 400.00);
INSERT INTO public.planet VALUES (12, 'Andromeda b', 'PL-A1B', 6, false, 500.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'STAR-SOL', 1, 'G2V', 1.000);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'STAR-PC', 1, 'M5.5Ve', 0.120);
INSERT INTO public.star VALUES (3, 'Sirius A', 'STAR-SIR', 1, 'A1V', 2.020);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'STAR-BET', 1, 'M1-2Ia-Iab', 11.600);
INSERT INTO public.star VALUES (5, 'Rigel', 'STAR-RIG', 1, 'B8Ia', 21.000);
INSERT INTO public.star VALUES (6, 'Andromeda Star 1', 'STAR-A1', 2, 'G-type', 1.100);


--
-- Data for Name: supernova; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supernova VALUES (1, 'SN 1054', 'SN-1054', 4, 'II', -6.00, 1054);
INSERT INTO public.supernova VALUES (2, 'SN 1987A', 'SN-1987A', 5, 'II', 3.00, 1987);
INSERT INTO public.supernova VALUES (3, 'Kepler''s SN', 'SN-1604', 3, 'Ia', -3.00, 1604);


--
-- Name: galaxy galaxy_galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_code_key UNIQUE (galaxy_code);


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
-- Name: moon moon_moon_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_code_key UNIQUE (moon_code);


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
-- Name: planet planet_planet_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_code_key UNIQUE (planet_code);


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
-- Name: star star_star_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_code_key UNIQUE (star_code);


--
-- Name: supernova supernova_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_name_key UNIQUE (name);


--
-- Name: supernova supernova_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_pkey PRIMARY KEY (supernova_id);


--
-- Name: supernova supernova_supernova_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_supernova_code_key UNIQUE (supernova_code);


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
-- Name: supernova supernova_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

