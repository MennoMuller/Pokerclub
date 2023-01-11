DROP TABLE IF EXISTS lid;

DROP TABLE IF EXISTS inschrijving;

DROP TABLE IF EXISTS toernooi;

CREATE TABLE lid(
    ID serial NOT NULL,
    naam varchar(255) NOT NULL,
    adres varchar(255),
    woonplaats varchar(255),
    begindatum date,
    einddatum date
);

CREATE TABLE toernooi(
    ID serial NOT NULL,
    prijzenpot integer,
    winnaarID integer
);

CREATE TABLE inschrijving(toernooiID integer, lidID integer);

ALTER TABLE
    lid
ADD
    PRIMARY KEY (ID);

ALTER TABLE
    toernooi
ADD
    PRIMARY KEY (ID);

ALTER TABLE
    inschrijving
ADD
    PRIMARY KEY (toernooiID, lidID);

ALTER TABLE
    inschrijving
ADD
    CONSTRAINT inschrijving_lid_fk FOREIGN KEY (lidID) REFERENCES lid(ID);

ALTER TABLE
    inschrijving
ADD
    CONSTRAINT inschrijving_toernooi_fk FOREIGN KEY (toernooiID) REFERENCES toernooi(ID);

ALTER TABLE
    toernooi
ADD
    CONSTRAINT toernooi_winnaar_fk FOREIGN KEY (winnaarID) REFERENCES lid(ID);