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

-- Users have CRUD access to links and tags pertaining to their own team
CREATE TABLE person (
    person_id serial PRIMARY KEY,
    person_name text NOT NULL,
    person_pswhash text NOT NULL,
    person_team serial REFERENCES team ON DELETE SET NULL
);

-- Weblinks have an address and several tags
CREATE TABLE weblink (
    weblink_id serial PRIMARY KEY,
    weblink_address text NOT NULL,
    weblink_date date NOT NULL DEFAULT CURRENT_DATE,
    weblink_creator serial REFERENCES person ON DELETE SET NULL,
    weblink_team serial REFERENCES team ON DELETE SET NULL
);

-- Tags created by users
CREATE TABLE tag (
    tag_id serial PRIMARY KEY,
    tag_name text NOT NULL,
    tag_date date NOT NULL DEFAULT CURRENT_DATE,
    tag_team serial REFERENCES team ON DELETE SET NULL
);

-- n:m relationship between weblinks and tags
CREATE TABLE weblink_tag (
    weblink_id serial REFERENCES weblink ON DELETE CASCADE,
    tag_id serial REFERENCES tag ON DELETE RESTRICT,
    PRIMARY KEY (weblink_id, tag_id)
);
