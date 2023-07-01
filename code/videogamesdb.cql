--Creates CQL tables

CREATE TABLE users_by_name (
    name          TEXT,
    facebook      UUID,
    birth_date    DATE,
    nationality   TEXT,
    register	  DATE,
    PRIMARY KEY (name)
);

CREATE TABLE users_by_facebook (
    name          TEXT,
    facebook	  UUID,
    birth_date    DATE,
    nationality   TEXT,
    register      DATE,
    PRIMARY KEY(facebook)
);

CREATE TABLE titles_by_user (
    name          	TEXT,
    title      	  	TEXT,
    purchase_date    	DATE,
    PRIMARY KEY (name, purchase_date)
) WITH CLUSTERING ORDER BY (purchase_date DESC);

CREATE TABLE videogames (
    title          TEXT,
    EAN            BIGINT,
    release_date   DATE,
    PEGI           INT,
    genres	   SET<TEXT>,
    description    TEXT,
    PRIMARY KEY ((title, EAN), PEGI, release_date)
);

--Imports CSV (semicolon separated values) data:

COPY users_by_name(name,facebook,birth_date,nationality,register) FROM 'var/lib/cassandra/users_by_name.csv' WITH DELIMITER = ';' AND HEADER = 'true';
COPY users_by_facebook (facebook,birth_date,name,nationality,register) FROM 'var/lib/cassandra/users_by_facebook.csv' WITH DELIMITER = ';' AND HEADER = 'true';
COPY titles_by_user (name,title,purchase_date) FROM 'var/lib/cassandra/titles_by_user.csv' WITH DELIMITER = ';' AND HEADER = 'true';
COPY videogames (title,EAN,PEGI,release_date,description,genres) FROM 'var/lib/cassandra/videogames.csv' WITH DELIMITER = ';' AND HEADER = 'true';