--creating table
CREATE TABLE student(
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20)
);
--another way of writting primary key
--creating table
CREATE TABLE student(
    student_id INT,
    name VARCHAR(20),
    major VARCHAR(20),
    PRIMARY KEY(student_id)
);
--we can see the table
DESCRIBE student;
--we can also delete table
DROP TABLE student;
--WE can add another column to this table
ALTER TABLE student ADD gpa DECIMAL(5, 2);
--inserting data into table
INSERT INTO student VALUES(1, 'Jack', 'Biology');
 --creating table
--name cannot be null
CREATE TABLE student(
    student_id INT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE,
    PRIMARY KEY(student_id)
);
 -- we can also set default value in our table
                                             
    CREATE TABLE student(
    student_id INT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT 'undecided',
    PRIMARY KEY(student_id)
);
--creating table
--we can also use auto increament for primary id
CREATE TABLE student(
    student_id INT AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT 'undecided',
    PRIMARY KEY(student_id)
);
--inserting values into student table
INSERT INTO student(name, major) VALUES('Jack', 'Biology');
INSERT INTO student(name, major) VALUES('Kate', 'Socialogy');
--updating Biology to Bio only in where major is Biology
UPDATE student
SET major = 'Bio'
WHERE major = 'Biology'

