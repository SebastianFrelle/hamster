-- DDL script for database, setting up the fundamental relationships.
-- Many-to-many relationship between teams and users, as well as between links
-- and tags.

-- Run using `psql -U hamster_admin -d hamster -f ./ddl.sql`.

DROP TABLE IF EXISTS weblink_tag;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS weblink;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS team;

-- Users are organized into Teams
CREATE TABLE team (
    team_id serial PRIMARY KEY,
    team_name text NOT NULL
);

-- Users have CRUD access to links and tags in their own team
CREATE TABLE person (
    person_id serial PRIMARY KEY,
    person_name text NOT NULL,
    person_pswhash text NOT NULL,
    person_team serial REFERENCES team
);

-- Weblinks have an address and several tags
CREATE TABLE weblink (
    weblink_id serial PRIMARY KEY,
    weblink_address text NOT NULL,
    weblink_date date NOT NULL DEFAULT CURRENT_DATE,
    weblink_creator serial REFERENCES person
            ON UPDATE CASCADE ON DELETE SET NULL,
    weblink_team serial REFERENCES team ON DELETE CASCADE
);

-- Tags created by users
CREATE TABLE tag (
    tag_id serial PRIMARY KEY,
    tag_name text NOT NULL,
    tag_date date NOT NULL DEFAULT CURRENT_DATE,
    tag_team serial REFERENCES team ON DELETE CASCADE
);

-- n:m relationship between weblinks and tags
CREATE TABLE weblink_tag (
    weblink_id serial REFERENCES weblink ON UPDATE CASCADE ON DELETE CASCADE,
    tag_id serial REFERENCES tag ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (weblink_id, tag_id)
);