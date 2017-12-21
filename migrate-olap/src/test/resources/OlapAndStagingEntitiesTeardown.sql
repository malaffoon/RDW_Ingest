-- CLEAN UP staging
-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
DELETE FROM staging_exam_claim_score where exam_id in  (-88, -87, -86, -85, -84);
DELETE FROM staging_exam where id in (-88, -87, -86, -85, -84);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM staging_school where id < 0;
DELETE FROM staging_district where id in (-99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM staging_asmt where id in (-11, -99, -98);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM staging_student_ethnicity where student_id in ( -11, -33, -89, -88, -87, -86);
DELETE FROM staging_student where id in ( -11, -33, -89, -88, -87, -86);

-- CLEAN UP reporting
DELETE FROM fact_student_exam where id in (-88, -87, -86, -85, -84, -100);

-- ------------------------------------------ Student   ------------------------------------------------------------------------------------------------
DELETE FROM student_ethnicity where student_id in ( -11, -33, -89, -88, -87, -86);
DELETE FROM student where id in ( -11, -33, -89, -88, -87, -86);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM school where id in (-99, -98, -1);
DELETE FROM district where id in (-99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM asmt where id in ( -11, -99, -98, -19);
DELETE FROM active_asmt_per_year where asmt_id in ( -11, -99, -98, -19);
