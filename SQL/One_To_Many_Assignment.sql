DROP TABLE if exists videos;
CREATE TABLE Videos (
    video_id int,
    video_title varchar(255),
    video_length time,
	url varchar(255)
);

DROP TABLE if exists reviews;
CREATE TABLE reviews (
    video_id int,
    user_name varchar(255),
    rating int,
    short_review varchar(255)
);

select * from videos;
select * from reviews;

Insert into videos
values(1, 'QI | The Dishwasher Was Invented To Clean Dishes More... What?', '00:03:10', 'https://www.youtube.com/watch?v=c9CeuVakcyk');
Insert into videos
values(2, 'QI | What Was The First Animal To Be Herded For Food?', '00:03:41', 'https://www.youtube.com/watch?v=JkBjLydNqwI');
Insert into videos
values(3, 'QI | Name A Cold-Blooded Creature', '00:03:13', 'https://www.youtube.com/watch?v=VHvpqgZr4m8');

Insert into reviews
values(1, 'Mary Gan', 3, 'Just Okay');
Insert into reviews
values(1, 'John Dorito', 4, 'Fantastic');
Insert into reviews
values(3, 'Sandy Toksvig', 4, 'Loved It');
Insert into reviews
values(3, 'Stephen Fry', 5, 'Two Thumbs Up');

select * from videos inner join reviews on videos.video_id = reviews.video_id;