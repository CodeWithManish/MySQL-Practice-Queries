create database spotify;
use spotify;
create table Users (
user_id varchar(30) not null,
user_name varchar(30) not null,
user_email varchar(40) not null,
primary key (user_id)
);

insert into Users values ("31sqekzq7bsp3wvqxkugx5uahdwe","MANISH KUMAR","manishkumar0156@gmail.com");
insert into Users values ("32sqekzq7bsp3wvqxkugx5uahdwe","RAJ","rj1234@gmail.com");
select * from Users;


create table Playlists (
playlist_id varchar(30) not null,
playlist_name varchar(30) not null,
user_id varchar(30) not null
);

insert into Playlists (playlist_id,playlist_name,user_id)values("0Mc8aBONKnjtK2UGPgTtOJ","API_Automation Playlist1","31sqekzq7bsp3wvqxkugx5uahdwe");
insert into Playlists (playlist_id,playlist_name,user_id)values("1Nc8aBONKnjtK2UGPgTtOJ","API_Automation Playlist2","32sqekzq7bsp3wvqxkugx5uahdwe");
select * from Playlists;

Alter table Playlists  ADD PRIMARY KEY ( playlist_id);  


create table Tracks(
track_id varchar(30) not null,
track_name varchar(30) not null,
playlist_id varchar(30) not null,
primary key (track_id)
);
insert into Tracks values("6TGX01ExmdHyOG72fqUU3Q","Zindgi kuch to bata","0Mc8aBONKnjtK2UGPgTtOJ");
insert into Tracks values("0Mc8aBONKnjtK2UGPgTtOJ","Shri krisha govind hare Murari","0Mc8aBONKnjtK2UGPgTtOJ");
select * from Tracks;
Alter table Tracks  ADD foreign key( playlist_id) REFERENCES Playlists(playlist_id);  

/******************** Inner join ****************/
SELECT * FROM Users
  INNER JOIN Playlists
  ON Users.user_id = Playlists.user_id
  INNER JOIN Tracks
  ON Playlists.playlist_id = Tracks.playlist_id;
  
  /******************** Left join ****************/
  SELECT * FROM Users
  LEFT JOIN Playlists
  ON Users.user_id = Playlists.user_id
  LEFT JOIN Tracks
  ON Playlists.playlist_id = Tracks.playlist_id;
  
   /******************** Right join ****************/
  SELECT * FROM Users
  RIGHT JOIN Playlists
  ON Users.user_id = Playlists.user_id
  RIGHT JOIN Tracks
  ON Playlists.playlist_id = Tracks.playlist_id;
  
   /******************** Cross join ****************/
   
   SELECT * FROM Users
  CROSS JOIN Playlists
  ON Users.user_id = Playlists.user_id
  CROSS JOIN Tracks
  ON Playlists.playlist_id = Tracks.playlist_id;
  