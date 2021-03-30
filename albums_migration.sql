USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums
(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist       VARCHAR(100),
    name         VARCHAR(100),
    release_date SMALLINT UNSIGNED,
    genre        VARCHAR(100),
    sales        FLOAT(6, 2),
    PRIMARY KEY (id)
);

