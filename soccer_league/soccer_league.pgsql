DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    location TEXT NOT NULL,
    team_name TEXT NOT NULL
);

CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES team
);

CREATE TABLE referee (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL
);

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES team,
    team2_id INTEGER REFERENCES team,
    head_ref_id INTEGER REFERENCES referee,
    asst_ref_1_id INTEGER REFERENCES referee,
    asst_ref_2_id INTEGER REFERENCES referee,
    season_id INTEGER REFERENCES season,
    game_date DATE NOT NULL,
    stadium TEXT NOT NULL
);

CREATE TABLE goal (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES game,
    player_id INTEGER REFERENCES player,
    minute INTEGER NOT NULL
);

CREATE TABLE result (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES game,
    team_id INTEGER REFERENCES team,
    wld VARCHAR(1) NOT NULL
);