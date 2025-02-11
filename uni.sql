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
('Algebra', 'algebra course', 1),
('Biology', 'biology course', 2),
('World History', 'world history course', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES 
(1, 3, '2000-01-01'),
(2, 1, '2000-01-01'),
(3, 3, '2000-01-01'),
(4, 2, '2000-06-01'),
(5, 2, '2000-06-01');