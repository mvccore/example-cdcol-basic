DROP DATABASE IF EXISTS cdcol;

CREATE DATABASE cdcol
	ENCODING = 'UTF8'
		CONNECTION LIMIT = -1;

DROP TABLE IF EXISTS cds CASCADE;
DROP SEQUENCE IF EXISTS cds_seq CASCADE;

CREATE SEQUENCE cds_seq;

CREATE TABLE cds (
	id INTEGER NOT NULL DEFAULT NEXTVAL ('cds_seq'),
	title VARCHAR(200) NOT NULL,
	interpret VARCHAR(200) NOT NULL,
	year INTEGER DEFAULT 0,
	PRIMARY KEY (id)
);

CREATE INDEX cds_title ON cds (title);
CREATE INDEX cds_interpret ON cds (interpret);
CREATE INDEX cds_year ON cds (year);

INSERT INTO cds (id, title, interpret, year) VALUES
(1,	'Jump',	'Van Halen',	1984),
(2,	'Hey Boy Hey Girl',	'The Chemical Brothers',	1999),
(3,	'Black Light',	'Groove Armada',	2010),
(4,	'Hotel',	'Moby',	2005),
(5, 'Berlin Calling', 'Paul Kalkbrenner', 2008);
