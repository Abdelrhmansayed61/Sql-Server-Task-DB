CREATE DATABASE SOLVE_TASK1
GO
USE SOLVE_TASK1
GO
CREATE SCHEMA TASK
GO

CREATE TABLE TASK.actor(
    act_id INT PRIMARY KEY,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1)
)

CREATE TABLE TASK.director (
    dir_id INT PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
)


CREATE TABLE TASK.movie(
    mov_id INT PRIMARY KEY,
    mov_title CHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)

)

CREATE TABLE TASK.reviewer (
    rev_id INT PRIMARY KEY,
    rev_name CHAR(30)

)

CREATE TABLE TASK.genres(
    gen_id INT PRIMARY KEY,
    gen_title CHAR(20)

) 

CREATE TABLE TASK.movie_cast(
    act_id INT,
    mov_id INT,
    role CHAR(30),

    PRIMARY KEY( act_id,mov_id),
    FOREIGN KEY(act_id) REFERENCES TASK.actor(act_id),
    FOREIGN KEY(mov_id) REFERENCES TASK.movie(mov_id),
)
CREATE TABLE TASK.movie_direction (
    dir_id INT,
    mov_id INT,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES TASK.director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES TASK.movie (mov_id)

)

CREATE TABLE TASK.movie_genres (
    mov_id INT,
    gen_id INT,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES TASK.movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES TASK.genres(gen_id)

)

CREATE TABLE TASK.rating(
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,
    PRIMARY KEY (mov_id, rev_id),
    FOREIGN KEY (mov_id) REFERENCES TASK.movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES TASK.reviewer(rev_id)

)