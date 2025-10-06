-- Index to speed up lookup of enrollments by student_id
CREATE INDEX "enrollments_student_id" ON "enrollments" ("student_id");

-- Index to speed up lookup of enrollments by course_id
CREATE INDEX "enrollments_course_id" ON "enrollments" ("course_id");

-- Composite index for courses lookup by department, number, and semester
CREATE INDEX "courses_department_number_semester" ON "courses" ("department", "number", "semester");

-- Composite index for courses lookup by title and semester (used in LIKE and subqueries)
CREATE INDEX "courses_title_semester" ON "courses" ("title", "semester");

-- Index to speed up lookup in satisfies table by course_id
CREATE INDEX "satisfies_course_id" ON "satisfies" ("course_id");

-- Index to speed up lookup in satisfies table by requirement_id (for GROUP BY performance)
CREATE INDEX "satisfies_requirement_id" ON "satisfies" ("requirement_id");
