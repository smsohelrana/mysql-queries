--- Question 1) display all columns and all rows from the posts table

SELECT * FROM `posts`;
--------------------------------------------
-- Question 2) show the post titles along with the corresponding author’s name

SELECT posts.title AS post_title,users.name AS author_name FROM posts inner JOIN users ON posts.author_id = users.id;

------------------------------------------------------------------
-- Question 3) Inserts a new row into the posts table with the "My new value for user 2" values for author_id = 2

INSERT INTO posts (title, author_id) VALUES ('My new value for user 2', 2);

----------------------

-- Question 4) change the title of the post with id = 1 to 'Updated First Post'
UPDATE `posts` SET title ='Updated First Post' WHERE `id`= 1;

-----------------------------------

-- Question 5) Find the number of posts written by each author

SELECT `author_id`, COUNT(`title`) as post_count FROM `posts` GROUP BY `author_id`;

------------------------------------------------------------

-- Question 6) display the newest posts first 

SELECT * FROM `posts` ORDER BY `id` DESC;

----------------------------------------------------------

-- Question 7) display the newest two (02) posts 

SELECT * FROM `posts` ORDER BY `id` DESC LIMIT 2;

--------------------------------------------

-- Question 8) show only those posts that have comments.
SELECT * FROM `posts` INNER JOIN comments on posts.id=comments.post_id;

--------------------------------
-- Question 9) display multiple tags of a single post as comma-separated values

SELECT posts.id, posts.title, GROUP_CONCAT(tags.name ORDER BY tags.name SEPARATOR ', ') AS tags FROM posts
 JOIN post_tag ON posts.id = post_tag.post_id JOIN tags ON post_tag.tag_id = tags.id
 GROUP BY posts.id, posts.title;


