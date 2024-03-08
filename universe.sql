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
-- Name: faction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.faction (
    faction_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_dark boolean,
    is_active boolean
);


ALTER TABLE public.faction OWNER TO freecodecamp;

--
-- Name: faction_faction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.faction_faction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faction_faction_id_seq OWNER TO freecodecamp;

--
-- Name: faction_faction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.faction_faction_id_seq OWNED BY public.faction.faction_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    faction_id integer,
    star_count integer,
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    has_life boolean
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
    name character varying(30) NOT NULL,
    moon_count integer,
    lat numeric(6,3),
    lon numeric(6,3),
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    planet_count integer,
    language character varying(30)
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
-- Name: faction faction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.faction ALTER COLUMN faction_id SET DEFAULT nextval('public.faction_faction_id_seq'::regclass);


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
-- Data for Name: faction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.faction VALUES (1, 'Galactic Empire', true, false);
INSERT INTO public.faction VALUES (2, 'First Order', true, true);
INSERT INTO public.faction VALUES (3, 'Jedi Order', false, false);
INSERT INTO public.faction VALUES (4, 'Sith Order', true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Outer-Rim', 1, 35, 'The Outer Rim Territories, also known as the Outer Rim, Outer Systems, or simply the Rim, was a sparsely populated region of the galaxy located outside the Mid Rim before Wild Space and the Unknown Regions. The largest region in the galaxy, it was home to diverse worlds and rugged, primitive frontier planets. A region that often went without a major faction holding control over it, the Outer Rim was a home to pirates, smugglers, enslavers, and other criminals throughout the timeline of galactic history.');
INSERT INTO public.galaxy VALUES (2, 'Mid-Rim', 1, 0, 'The Mid Rim, also known as the Mid-Rim, Middle Rim, Mid-systems, or the Mid Rim Territories, was a region of the galaxy located between the Expansion Region and the Outer Rim Territories. With fewer natural resources—and therefore a smaller population—than many neighboring regions, the Mid Rim was a territory where residents worked hard for everything they had. Several planets built up impressive economies, and pirate raiders often hid in the relatively unexplored spaces far from major trade routes.');
INSERT INTO public.galaxy VALUES (3, 'Inner-Rim', 2, 25, 'The Inner Rim, originally known as the Rim, and also called the Inner Rim Planets, or the Inner Rim Territories, was a region of the galaxy between the Colonies and the Expansion Region.');
INSERT INTO public.galaxy VALUES (4, 'Colonies', 2, 7, 'The Colonies was a region of the galaxy located between the Core Worlds and the Inner Rim. It contained numerous planets, including Abednedo, Carida, and Uquine. The Colonies sat along major trade routes, and some of them were extremely wealthy.');
INSERT INTO public.galaxy VALUES (5, 'Deep Core', 1, 29, 'The Deep Core, also known as the Deep Galactic Core, was a small region in the galaxy, about seven thousand light-years across, that hid unusual worlds. The Deep Core was home to some thirty billion of the galaxy''s oldest stars, and at its center was a supermassive black hole surrounded by antimatter and dense clusters where stars were only a hundredth of a light year apart. In some areas they were in such proximity, stars would collide and rip the cores from each other. Due to the gravitational pull of the vast number of stars and the prominence of dark matter concentrations, local space-time was severely warped, making hyperspace travel difficult at best. The Deep Core held great strategic value because of its position near the Core Worlds, particularly in the case of the clone of Emperor Palpatine and his stronghold of Byss.');
INSERT INTO public.galaxy VALUES (6, 'Core Worlds', 1, 6, 'The Core Worlds, also known as the Galactic Core, the Core Territories, the Coruscant Core, the Core systems, or simply the Core, was the area of the galaxy that bordered the Deep Core and was bordered by the Colonies. The Core Worlds contained some of the wealthiest and most prestigious planets. Coruscant, the galactic capital during the time of the Galactic Republic and subsequent Galactic Empire, was located in the Core Worlds.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Centax-1', 1, 'Centax-1 was the primary moon of the planet Coruscant, located in the Core Worlds. The standard month was based on the syzygy of Centax-1, and the day of Centaxday was named after it.', true);
INSERT INTO public.moon VALUES (2, 'Centax-2', 1, 'Centax-2 was a moon of the planet Coruscant, located in the Core Worlds.', true);
INSERT INTO public.moon VALUES (3, 'Centax-3', 1, 'Centax-3, or Centax 3, and nicknamed "The Aunt", was the third of four moons orbiting the planet Coruscant. The Aloo family had a residence there. Shortly after the destruction of the planet Alderaan, Anandra Milon, an Alderaanian resident of Coruscant, asked an old man running the Hangra''s Meat Shack stall about a "Centax 3 delivery." The man did not know what she was talking about, and eventually took pity on her, giving her a small amount of food.', true);
INSERT INTO public.moon VALUES (4, 'Hesperidium', 1, 'Hesperidium was one of the four moons of the galactic capital planet of Coruscant, located in the Core Worlds'' Coruscant system. It was situated within the Coruscant subsector of the Corusca sector, located at the coordinates L-9 on the Standard Galactic Grid. It shared its name with Hesperidium straight, a section of the Dragonfire Circuit airspeeder race course on Coruscant.', true);
INSERT INTO public.moon VALUES (5, 'Thyferra''s largest moon', 4, 'Thyferra''s largest moon was the largest of two moons orbiting the planet Thyferra. Erisi Dlarit, an Imperial pilot serving Director of Imperial Intelligence Ysanne Isard, crashed into the moon and was killed during a dogfight with Rogue Squadron pilot Corran Horn during the Battle of Thyferra.', false);
INSERT INTO public.moon VALUES (6, 'Janara', 5, NULL, false);
INSERT INTO public.moon VALUES (7, 'Pitrolea', 5, NULL, false);
INSERT INTO public.moon VALUES (8, 'Ketal', 5, NULL, true);
INSERT INTO public.moon VALUES (9, 'Zorbia II', 6, NULL, true);
INSERT INTO public.moon VALUES (10, 'Murk', 6, NULL, true);
INSERT INTO public.moon VALUES (11, 'Sanyass IV', 6, NULL, false);
INSERT INTO public.moon VALUES (12, 'Concordia', 7, 'Concordia was a moon of the planet Mandalore. It was governed by Pre Vizsla. The Death Watch, which was in fact led by Vizsla, used the abandoned mines on Concordia as secret hideouts.', true);
INSERT INTO public.moon VALUES (13, 'Gargon', 8, NULL, false);
INSERT INTO public.moon VALUES (14, 'Vanquo', 8, NULL, false);
INSERT INTO public.moon VALUES (15, 'Abanol', 2, NULL, true);
INSERT INTO public.moon VALUES (16, 'Chel', 2, NULL, true);
INSERT INTO public.moon VALUES (17, 'Polos', 2, NULL, false);
INSERT INTO public.moon VALUES (18, 'Relus', 2, NULL, true);
INSERT INTO public.moon VALUES (19, 'Kissarm', 2, NULL, false);
INSERT INTO public.moon VALUES (20, 'Houl', 2, NULL, false);
INSERT INTO public.moon VALUES (21, 'Pelutt', 2, NULL, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Coruscant', 4, 0.000, 0.000, 2);
INSERT INTO public.planet VALUES (2, 'Byss', 5, -48.074, -182.068, 1);
INSERT INTO public.planet VALUES (3, 'Neimodia', 1, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Thyferra', 2, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, 'Kiffu', 3, 28.038, -431.329, 5);
INSERT INTO public.planet VALUES (6, 'Endor', 3, -343.219, -683.025, 6);
INSERT INTO public.planet VALUES (7, 'Mandalore', 1, 363.452, 272.211, 7);
INSERT INTO public.planet VALUES (8, 'Kalevala', 2, 351.082, 284.794, 7);
INSERT INTO public.planet VALUES (9, 'Polixi', 0, NULL, NULL, 4);
INSERT INTO public.planet VALUES (10, 'Loxizhra', 5, NULL, NULL, 4);
INSERT INTO public.planet VALUES (11, 'Iqobal', 54, NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'Fexani', 33, NULL, NULL, 4);
INSERT INTO public.planet VALUES (13, 'Renus', 3, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Beshqek', 5, 8, 'Galactic Basic Standard');
INSERT INTO public.star VALUES (2, 'Coruscant Prime', 6, 1, 'Galactic Basic Standard');
INSERT INTO public.star VALUES (3, 'Nen', 4, 1, NULL);
INSERT INTO public.star VALUES (4, 'Polith', 3, 7, 'Vratixian');
INSERT INTO public.star VALUES (5, 'Kiffu''s Sun', 3, 2, 'Kiffarian');
INSERT INTO public.star VALUES (6, 'Endor I', 1, 1, 'Ewokese');
INSERT INTO public.star VALUES (7, 'Mandalore', 1, 2, 'Galactic Basic Standard');


--
-- Name: faction_faction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.faction_faction_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: faction faction_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.faction
    ADD CONSTRAINT faction_name_key UNIQUE (name);


--
-- Name: faction faction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.faction
    ADD CONSTRAINT faction_pkey PRIMARY KEY (faction_id);


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

