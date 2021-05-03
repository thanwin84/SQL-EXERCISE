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
--another way of inserting data into table
INSERT INTO student(student_id, name) VALUES(1, 'claire);
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
