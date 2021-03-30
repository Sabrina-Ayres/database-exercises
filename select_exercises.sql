USE codeup_test_db;

-- The name of all albums by Pink Floyd.
select * from albums where artist = 'Pink Floyd';

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date from albums where name = 'Sgt. Peppers Lonely Hearts Club Band';

-- The genre for Nevermind
select genre from albums where name = 'Nevermind';

-- Which albums were released in the 1990s
select * from albums where release_date >= 1990 and release_date < 2000;

-- Which albums had less than 20 million certified sales
select * from albums where sales < 20.00;

-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock"
-- or "Progressive rock"?
select * from albums where genre like 'Rock';



