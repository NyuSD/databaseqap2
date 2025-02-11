CREATE TABLE students (
    id INT SERIAL PRIMARY KEY,
    first_name text,
    last_name text,
    email text,
    school_enrollment_date date,
);

CREATE TABLE professors (
    id INT SERIAL PRIMARY KEY,
    first_name text,
    last_name text,
    department text,
);

CREATE TABLE courses (
    id INT SERIAL PRIMARY KEY,
    course_name text,
    course_description text,
    professor_id INT REFERENCES professors(id),
);

CREATE TABLE enrollments (
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses(id),
    enrollment_date date,
    PRIMARY KEY (student_id, course_id),
);

INSERT INTO students (first_name, last_name, email, school_enrollment_date) VALUES 
('John', 'Doe', 'JohnDoe@email.com', '1999-01-01'),
('John', 'Smith', 'JohnSmith@email.com', '2000-01-01'),
('Adam', 'Mahn', 'AdamMahn@email.com', '2000-01-01'),
('Jesse', 'Dane', 'JesseDane@email.com', '2000-06-01'),
('Hazel', 'Lamb', 'HazelLamb@email.com', '20001-06-01');

INSERT INTO professors (first_name, last_name, department) VALUES 
('Joe', 'Marsh', 'Math'),
('Laura', 'Barber', 'Science'),
('Lillian', 'White', 'History'),
('Maia', 'Odling', 'English');

INSERT INTO courses (course_name, course_description, professor_id) VALUES 
('Algebra', 'algebra course', SELECT id FROM professors WHERE first_name = 'Joe' AND last_name = 'Marsh'),
('Biology', 'biology course', SELECT id FROM professors WHERE first_name = 'Laura' AND last_name = 'Barber'),
('World History', 'world history course', SELECT id FROM professors WHERE first_name = 'Lillian' AND last_name = 'White');

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES 
(SELECT student_id FROM students WHERE first_name = 'John' AND last_name = 'Doe' AND email = 'JohnDoe@gmail.com', SELECT id FROM courses WHERE course_name = 'World History', '2000-01-01'),
(SELECT student_id FROM students WHERE first_name = 'John' AND last_name = 'Smith' AND email = 'JohnDoe@gmail.com', SELECT id FROM courses WHERE course_name = 'Biology', '2000-01-01'),
(SELECT student_id FROM students WHERE first_name = 'Adam' AND last_name = 'Mahn' AND email = 'JohnDoe@gmail.com', SELECT id FROM courses WHERE course_name = 'Algebra', '2000-01-01'),
(SELECT student_id FROM students WHERE first_name = 'Jesse' AND last_name = 'Dane' AND email = 'JohnDoe@gmail.com', SELECT id FROM courses WHERE course_name = 'World History', '2000-01-01'),
(SELECT student_id FROM students WHERE first_name = 'Hazel' AND last_name = 'Lamb' AND email = 'JohnDoe@gmail.com', SELECT id FROM courses WHERE course_name = 'Biology', '2000-01-01');

SELECT students.first_name || ' ' || students.last_name AS full_name
FROM students
JOIN enrollments
  ON students.id = enrollments.student_id
JOIN courses
  ON enrollments.course_id = courses.id
WHERE courses.course_name = 'World History';

SELECT courses.id, courses.course_name, courses.course_description, professors.first_name || ' ' || professors.last_name AS professor_full_name
FROM courses
JOIN professors
  ON courses.professor_id = professors.id;

SELECT DISTINCT courses.id, courses.course_name, courses.course_description, courses.professor_id
FROM courses
JOIN enrollments
  ON courses.id = enrollments.course_id;