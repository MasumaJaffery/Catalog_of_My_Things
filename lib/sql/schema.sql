CREATE DATABASE catalog_of_my_things 

CREATE TABLE
    Game (
        id INT GENERATED ALWAYS AS IDENTITY,
        title VARCHAR(30) NOT NULL,
        publish_date DATE NOT NULL,
        multiplayer BOOLEAN NOT NULL,
        last_played_at DATE NOT NULL,
        genre_id INT DEFAULT NULL,
        -- These are foreign key that reference other tables
        source_id INT DEFAULT NULL,
        label_id INT DEFAULT NULL,
        PRIMARY KEY(id)
    );

CREATE TABLE
    Author (
        id INT GENERATED ALWAYS AS IDENTITY,
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        PRIMARY KEY(id)
    );

-- This table stores information about the relationship between games and authors

CREATE TABLE
    Creation(
        item_id INT,
        author_id INT,
        PRIMARY KEY(item_id, author) -- A constraint to ensures that every author/item exists in the related table
        CONSTRAINT FK_author FOREIGN KEY (author_id) REFERENCES Author (id) CONSTRAINT FK_item FOREIGN KEY (item_id) REFERENCES Game (id)
    );

CREATE TABLE
    genres (
        id INT GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(255) NOT NULL,
        PRIMARY KEY(id)
    );

CREATE TABLE
    music_albums (
        id INT GENERATED ALWAYS AS IDENTITY,
        title VARCHAR(255) NOT NULL,
        publish_date DATE NOT NULL,
        archived BOOLEAN NOT NULL,
        on_spotify BOOLEAN NOT NULL,
        genre_id INT DEFAULT NULL,
        -- Foreign key that references genres table
        source_id INT DEFAULT NULL,
        -- Assuming that there will be a sources table
        label_id INT DEFAULT NULL,
        -- Assuming that there will be a labels table
        author_id INT DEFAULT NULL,
        -- Foreign key that references Author table
        PRIMARY KEY(id),
        CONSTRAINT FK_genre FOREIGN KEY (genre_id) REFERENCES genres (id),
        CONSTRAINT FK_source FOREIGN KEY (source_id) REFERENCES sources (id),
        CONSTRAINT FK_label FOREIGN KEY (label_id) REFERENCES labels (id),
        CONSTRAINT FK_author FOREIGN KEY (author_id) REFERENCES Author (id)
    );