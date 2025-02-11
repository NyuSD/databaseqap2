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


