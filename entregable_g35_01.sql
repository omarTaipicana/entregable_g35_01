create database blog_db;

create table users (
id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30));

insert into users (first_name, last_name, email ) values
('Katy', 'Analuisa', 'katy@gmail.com'),
('Fernando', 'Taipicaña', 'fer@gmail.com'),
('Omar', 'Heredia', 'omar@gmail.com');

select * from users;

create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(30),
	text text);
	
insert into posts (creator_id, title, text) values
(1, 'Post 01','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque euismod dignissim sem, vel viverra eros facilisis vitae. Morbi eget pulvinar sem, pellentesque convallis quam. Aenean sit amet quam ut nibh tempor lobortis eu sit amet massa. Praesent vitae magna dignissim, ultrices ex in, semper libero. Phasellus blandit tempor augue, vitae semper diam maximus in. Ut fermentum velit dignissim nibh molestie tincidunt. Vestibulum ornare nisl erat, eu malesuada tortor sollicitudin sed. Integer fermentum nisl tortor, ut pharetra justo lacinia sed. Sed consectetur dictum vehicula.'),
(2, 'Post 02','Donec vel eros id metus vehicula tristique. Morbi pharetra magna sit amet euismod varius. Maecenas rutrum ex sit amet tincidunt venenatis. Duis malesuada velit in hendrerit imperdiet. Sed maximus dignissim semper. Nulla eu condimentum nisi, ac malesuada urna. Nullam tincidunt tristique interdum. Quisque placerat magna id massa ultricies, porttitor cursus lectus consequat. Cras semper feugiat vestibulum. Etiam tincidunt bibendum tortor.'),
(3, 'Post 03','Mauris porta risus vel blandit faucibus. Sed sed justo a purus pharetra molestie. Donec sit amet condimentum tortor, ut convallis magna. Cras et convallis magna. Integer ac fringilla ipsum. Phasellus finibus pharetra rutrum. Aliquam pulvinar magna magna, non vulputate magna mattis nec. Cras sodales dapibus condimentum. Donec facilisis enim nec tortor placerat, sed finibus eros suscipit.'),
(2, 'Post 04','Donec interdum dolor at mauris ornare, a bibendum ligula aliquam. Fusce faucibus ut lectus facilisis venenatis. Fusce semper vulputate erat at hendrerit. Donec ultrices mollis convallis. Donec non ligula vel mauris aliquam aliquam. Duis et porttitor quam. Duis ullamcorper congue mi, at finibus nibh placerat fringilla. Pellentesque in posuere velit. Ut in enim nec ante egestas ultricies eget ut purus. Nullam consequat leo a tincidunt consequat.'),
(1, 'Post 05','Donec condimentum facilisis ante vitae tincidunt. Sed hendrerit ut massa ut pulvinar. Etiam id libero purus. Curabitur ultricies facilisis augue, non fermentum odio tincidunt at. Ut suscipit eros non odio dignissim ultrices. Sed rutrum neque eget mi aliquam elementum. Pellentesque feugiat mi et venenatis feugiat. Aenean pharetra augue scelerisque libero lobortis facilisis. Nam commodo egestas nunc vel eleifend');

select * from posts;

create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id));
	
insert into likes (user_id, post_id) values
(1,3),
(2,5),
(3,1),
(2,4),
(1,2);

select * from likes;


select * from posts inner join users
on posts.creator_id = users.id;

select * from posts inner join likes
on posts.creator_id = likes.post_id inner join users
on likes.user_id = users.id;