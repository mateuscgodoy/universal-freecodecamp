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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    shape character varying(60),
    mythological_origin text,
    name character varying(60) NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    shape character varying(60),
    has_massive_black_holes boolean,
    star_formation_rate character varying(60),
    light_years_distance bigint
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
    name character varying(60) NOT NULL,
    year_of_discovery character(4),
    diameter_in_km integer,
    planet_id integer,
    surface_material text
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
    name character varying(60) NOT NULL,
    num_of_moons integer,
    description text,
    has_rings boolean NOT NULL,
    gravity numeric(6,2),
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    spectral_type character(1) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity integer,
    temperature integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Hunter', 'In Greek mythology, Orion was a giant huntsman whom Zeus placed among the stars as the constellation of Orion.', 'Orion');
INSERT INTO public.constellation VALUES (2, 'Great Bear', 'In Greek mythology, Ursa Major represents Callisto, a nymph who was transformed into a bear by Zeus and placed among the stars by Hera to protect her from the wrath of Artemis.', 'Ursa Major');
INSERT INTO public.constellation VALUES (3, 'Dragon', 'In Greek mythology, Draco represents Ladon, the dragon-like serpent who guarded the golden apples in the Garden of the Hesperides.', 'Draco');
INSERT INTO public.constellation VALUES (4, 'Queen', 'In Greek mythology, Cassiopeia was the queen of Ethiopia and mother of Andromeda. She was placed among the stars as punishment for her vanity.', 'Cassiopeia');
INSERT INTO public.constellation VALUES (5, 'Winged Horse', 'In Greek mythology, Pegasus was a winged horse born from the blood of the Gorgon Medusa when she was slain by Perseus. He was tamed by the hero Bellerophon and later placed among the stars.', 'Pegasus');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, '1-2 solar masses per year', 27000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', false, '0.1-0.5 solar masses per year', 3000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, '0.5-1 solar masses per year', 2537000);
INSERT INTO public.galaxy VALUES (4, 'Sombero', 'Spiral', true, '0.01-0.1 solar masses per year', 28000000);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular', false, '0.1-0.5 solar masses per year', 160000);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Irregular', false, '0.05-0.2 solar masses per year', 200000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', '1610', 3476, 6, 'Regolith');
INSERT INTO public.moon VALUES (2, 'Phobos', '1877', 22, 7, 'Unknown');
INSERT INTO public.moon VALUES (3, 'Deimos', '1877', 12, 7, 'Unknown');
INSERT INTO public.moon VALUES (4, 'Io', '1610', 3643, 8, 'Sulfur and silicate rock');
INSERT INTO public.moon VALUES (5, 'Europa', '1610', 3121, 8, 'Water ice');
INSERT INTO public.moon VALUES (6, 'Ganymede', '1610', 5268, 8, 'Water ice and silicate rock');
INSERT INTO public.moon VALUES (7, 'Callisto', '1610', 4820, 8, 'Water ice and silicate rock');
INSERT INTO public.moon VALUES (8, 'Titan', '1655', 5150, 9, 'Hydrocarbons and nitrogen');
INSERT INTO public.moon VALUES (9, 'Enceladus', '1789', 504, 9, 'Water ice');
INSERT INTO public.moon VALUES (10, 'Miranda', '1948', 471, 10, 'Ice and rock');
INSERT INTO public.moon VALUES (11, 'Triton', '1846', 2706, 11, 'Nitrogen ice');
INSERT INTO public.moon VALUES (12, 'Charon', '1978', 1208, 12, 'Water ice and rock');
INSERT INTO public.moon VALUES (13, 'Phoebe', '1899', 213, 9, 'Water ice and carbon dioxide');
INSERT INTO public.moon VALUES (14, 'Ariel', '1851', 1158, 10, 'Water ice and rock');
INSERT INTO public.moon VALUES (15, 'Dione', '1684', 1123, 9, 'Water ice and rock');
INSERT INTO public.moon VALUES (16, 'Iapetus', '1671', 1436, 9, 'Water ice and rock');
INSERT INTO public.moon VALUES (17, 'Rhea', '1672', 1527, 9, 'Water ice and rock');
INSERT INTO public.moon VALUES (18, 'Tethys', '1684', 1062, 9, 'Water ice and rock');
INSERT INTO public.moon VALUES (19, 'Titania', '1787', 1578, 10, 'Water ice and rock');
INSERT INTO public.moon VALUES (20, 'Umbriel', '1851', 1169, 10, 'Water ice and rock');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-186f', 0, 'Exoplanet orbiting within the habitable zone of the red dwarf star Kepler-186.', false, 1.62, 9);
INSERT INTO public.planet VALUES (2, 'HD 189733b', 0, 'Exoplanet with a deep blue color due to the presence of silicate particles.', false, 21.95, 7);
INSERT INTO public.planet VALUES (3, 'TrES-2b', 0, 'Exoplanet known as the "dark planet" due to its extremely low reflectivity.', false, 9.23, 8);
INSERT INTO public.planet VALUES (4, 'Mercury', 0, 'Closest planet to the Sun, with extreme temperature variations.', false, 3.70, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 0, 'Known for its thick atmosphere and greenhouse effect.', false, 8.87, 1);
INSERT INTO public.planet VALUES (6, 'Earth', 1, 'Only known planet to support life, with diverse ecosystems.', false, 9.81, 1);
INSERT INTO public.planet VALUES (7, 'Mars', 2, 'Often called the "Red Planet" due to its reddish appearance.', false, 3.71, 1);
INSERT INTO public.planet VALUES (8, 'Jupiter', 79, 'Largest planet in the Solar System, known for its Great Red Spot.', true, 24.79, 1);
INSERT INTO public.planet VALUES (9, 'Saturn', 82, 'Recognized by its distinctive ring system made of ice particles.', true, 10.44, 1);
INSERT INTO public.planet VALUES (10, 'Uranus', 27, 'Tilted on its side, Uranus is often referred to as an "ice giant."', true, 8.69, 1);
INSERT INTO public.planet VALUES (11, 'Neptune', 14, 'The farthest planet from the Sun, with strong winds and faint rings.', true, 11.15, 1);
INSERT INTO public.planet VALUES (12, 'Pluto', 5, 'Formerly considered the ninth planet, now classified as a dwarf planet.', false, 0.62, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', 1, 1, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 'A', 1, 25, 9940);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'M', 1, 100000, 3600);
INSERT INTO public.star VALUES (4, 'Vega', 'A', 1, 40, 9600);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'G', 1, 2, 5790);
INSERT INTO public.star VALUES (6, 'Arcturus', 'K', 1, 170, 4300);
INSERT INTO public.star VALUES (7, 'HD 189733', 'K', 1, 0, 4950);
INSERT INTO public.star VALUES (8, 'TrES-2', 'G', 1, 1, 5630);
INSERT INTO public.star VALUES (9, 'Kepler-186', 'M', 1, 0, 3930);


--
-- Name: constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_id_seq', 5, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

