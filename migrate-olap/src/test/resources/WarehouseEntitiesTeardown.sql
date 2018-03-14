-- ---------------------------------------------- Exams ---------------------------------------------------------------------------------------------
DELETE FROM exam_claim_score where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM exam where id < 0;

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM student where id in (-11,  -89, -88, -87, -86, -33);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM school where id in (-99, -98, -1);
DELETE FROM district where id in (-99, -98, -1);
DELETE FROM district_group where id in (-98);
DELETE FROM school_group where id in (-98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM asmt where id < 0;