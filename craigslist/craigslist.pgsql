DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE cl_user (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES region
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    user_id INT REFERENCES cl_user,
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES region,
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    cat_name TEXT NOT NULL
);

CREATE TABLE post_categories (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES post,
    cat_id INT REFERENCES category
);