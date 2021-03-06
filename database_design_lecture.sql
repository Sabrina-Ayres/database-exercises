CREATE DATABASE IF NOT EXISTS design_test_db;

USE design_test_db;


DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;


CREATE TABLE quotes
(
    id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_first_name VARCHAR(50) DEFAULT 'NONE',
    author_last_name  VARCHAR(100) NOT NULL,
    content           TEXT         NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE authors
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


ALTER TABLE quotes
    DROP COLUMN author_first_name;
ALTER TABLE quotes
    DROP COLUMN author_last_name;
ALTER TABLE quotes
    ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes
    ADD FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE NO ACTION ON UPDATE CASCADE;


SELECT *
FROM quotes;
SELECT *
FROM authors;


INSERT INTO authors(first_name, last_name)
VALUES ('J. K.', 'Rowling'),
       ('Deborah', 'Harkness'),
       ('Delia', 'Owens');


INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'J. K.' and last_name = 'Rowling'),
        'It is our choices... that show what we truly are, far more than our abilities.');
INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'J. K.' and last_name = 'Rowling'),
        'I sometimes have a tendency to walk on the dark side.');

INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Deborah' and last_name = 'Harkness'),
        'As far as I can tell there are only two emotions that keep the world spinning year after year...One is fear. The other is desire.');
INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Deborah' and last_name = 'Harkness'),
        'All that children need is love, a grown-up to take responsibility for them, and a soft place to land.');

INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Delia' and last_name = 'Owens'),
        'Unworthy boys make a lot of noise.');
INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Delia' and last_name = 'Owens'),
        'There are some who can live without wild things, and some who cannot.');



CREATE TABLE topics
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO topics(name)
VALUES ('Inspirational'),
       ('Life'),
       ('Motivational'),
       ('Choices'),
       ('Love'),
       ('Relationships'),
       ('Self-Awareness');


SELECT *
FROM topics;


CREATE TABLE quote_topic
(
    quote_id INTEGER UNSIGNED NOT NULL,
    topic_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (quote_id) REFERENCES quotes (id),
    FOREIGN KEY (topic_id) REFERENCES topics (id)
);

INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 7),
       (1, 3),
       (2, 2),
       (3, 2),
       (4, 5),
       (4, 6),
       (5, 2),
       (5, 7),
       (6, 2),
       (6, 7);

SELECT *
FROM quote_topic;

SELECT CONCAT(a.first_name, ' ', a.last_name), q.content, t.name
FROM quotes q
         INNER JOIN quote_topic qt on q.id = qt.quote_id
         INNER JOIN topics t on qt.topic_id = t.id
         INNER JOIN authors a on q.author_id = a.id
WHERE qt.topic_id IN (
    SELECT t.id
    FROM topics t
    WHERE t.name = 'Life'
);