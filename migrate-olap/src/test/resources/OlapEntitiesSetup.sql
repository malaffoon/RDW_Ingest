-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO district_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Before Test -98', 'natural_id-98',  -1);

INSERT INTO district (id, name, natural_id, migrate_id) VALUES
  (-1, 'Before Test -1', 'natural_id-1',  -1),
  (-99, 'Before Test -99', 'natural_id-99',  -1);

INSERT INTO school_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Before Test -98', 'natural_id-98',  -1);

INSERT INTO school (id, district_id, district_group_id, school_group_id, name, natural_id, embargo_enabled, updated, update_import_id, migrate_id) VALUES
  (-1, -1, NULL, NULL, 'Before Test -1', 'natural_id-1', false, '2017-07-18 20:14:34.000000', -5000,  -1),
  (-99, -99, NULL, NULL, 'Before Test -99', 'natural_id-99', false, '2017-07-18 20:14:34.000000', -1, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO asmt (id, grade_id,  type_id, subject_id, school_year, name, label, cut_point_1, cut_point_2, cut_point_3, min_score, max_score, updated, update_import_id, migrate_id) VALUES
   (-11,  108, 3, 1, 1999, 'test-ica-1999-8',              'ica-grade-8',       2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -1),
   (-99,  109, 3, 2, 1999, 'test',                         'test',              2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -1),
   (-55,  108, 2, 1, 1998, 'test-iab-1999-8',              'iab-grade-8',       2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -1),
   (-66,  109, 2, 2, 1998, 'test-iab',                     'test-iab',          2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -1),
   (-81,  111, 3, 1, 2001, 'test-summative-2001-grade-11', 'summative-grade-11',2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -99),
   (-308, 108, 3, 1, 2000, 'test-summative-2000-grade-8',  'summative-grade-8', 2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -99),
   (-107, 107, 3, 1, 2001, 'test-summative-2001-grade-7',  'summative-grade-8', 2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -99),
   (-307, 107, 3, 1, 1999, 'test-summative-1999-grade-7',  'summative-grade-8', 2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -99),
   (-108 ,108, 3, 1, 2001, 'test-summative-2001-grade-8',  'summative-grade-8', 2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -99),
   (-109, 111, 3, 1, 2001, 'test-summative-2001-grade-9',  'summative-grade-9', 2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -99),
   (-111, 111, 3, 1, 2001, 'test-summative-2001-grade-11', 'summative-grade-11',2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -99),
   (-112, 111, 3, 1, 2001, 'test-summative-2001-grade-12', 'summative-grade-12',2442, 2502, 2582, 2000, 2700, '2017-07-18 20:14:34.000000', -1, -99);

INSERT INTO asmt_target(asmt_id, target_id, include_in_report) VALUES
   (-99,  -11, true),
   (-99,  -12, true),
   (-11,  -72, true),
   (-11,  -72, false),
   (-111, -71, true),
   (-112, -72, true),
   (-112, -71, false);

INSERT INTO asmt_active_year(asmt_id, school_year) VALUES
   (-11, 1995);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
INSERT INTO student (id, gender_id, updated, update_import_id, migrate_id) VALUES
   (-11, -99, '2017-07-18 20:14:34.000000', -1, -1),
   (-89, -99, '2017-07-18 20:14:34.000000', -1, -1),
   (-18, -99, '2017-07-18 20:14:34.000000', -1, -1);

INSERT INTO student_ethnicity(student_id, ethnicity_id) values
    (-89,  -99);

-- ------------------------------------------ Facts ---------------------------------------------------------------------------------------------
INSERT INTO  exam (id, school_year, asmt_id, student_id, completed_at,
                                    elas_id, completeness_id, administration_condition_id, performance_level,
                                    scale_score, grade_id, school_id,
                                    iep, lep, section504, economic_disadvantage, migrant_status,
                                    updated, update_import_id, migrate_id) VALUES
  (-88,  1999, -99, -89, '2016-08-14 19:05:33.000000', -99, -99, -99, 1, 2145, 108, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-100, 1998, -11, -18, '2016-05-14 19:05:33.000000', -99, -99, -99, 1, 2145, 108, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-82 , 1998, -11, -89, '2016-09-14 19:05:33.000000', -99, -99, -99, 1, 2005, 108, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1);

INSERT INTO  iab_exam (id, school_year, asmt_id, student_id, completed_at,
                                    elas_id, completeness_id, administration_condition_id, performance_level,
                                    scale_score, grade_id, school_id,
                                    iep, lep, section504, economic_disadvantage, migrant_status,
                                    updated, update_import_id, migrate_id) VALUES
  (-68,  1999, -66, -89, '2016-08-14 19:05:33.000000', -99, -99, -99, 1, 2145, 108, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-10,  1998, -55, -18, '2016-05-14 19:05:33.000000', -99, -99, -99, 1, 2145, 108, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-62 , 1998, -55, -89, '2016-09-14 19:05:33.000000', -99, -99, -99, 1, 2005, 108, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1);

INSERT INTO  exam_longitudinal (id, school_year, asmt_id, school_year_asmt_grade_code, subject_id, asmt_grade_id, student_id, completed_at,
                                    elas_id, completeness_id, administration_condition_id, performance_level,
                                    scale_score, grade_id, school_id,
                                    iep, lep, section504, economic_disadvantage, migrant_status,
                                    updated, update_import_id, migrate_id) VALUES
  (-268, 1998, -107, '1998,07', 1, 107, -89, '2016-08-14 19:05:33.000000', -99, -99, -99, 1, 2145, 107, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-200, 1999, -111, '1999,11', 1, 111, -18, '2016-05-14 19:05:33.000000', -99, -99, -99, 1, 2145, 108, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-199, 1999, -111, '1999,11', 1, 111, -89, '2016-09-14 19:05:33.000000', -99, -99, -99, 1, 2005, 111, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1);

INSERT INTO  exam_claim_score (id, exam_id, subject_claim_score_id, school_year, asmt_id, student_id, completed_at,
                                    category, updated, update_import_id, migrate_id) VALUES
  (-1,   -88,  1, 1999, -99, -89, '2016-08-14 19:05:33.000000', 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-2,   -88,  2, 1999, -99, -89, '2016-08-14 19:05:33.000000', 2, '2017-07-18 20:14:34.000000', -1, -1),
  (-3,   -88,  3, 1999, -99, -89, '2016-08-14 19:05:33.000000', 3, '2017-07-18 20:14:34.000000', -1, -1),

  (-10,  -100, 1, 1998, -11, -18, '2016-05-14 19:05:33.000000', 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-12,  -100, 2, 1998, -11, -18, '2016-05-14 19:05:33.000000', 2, '2017-07-18 20:14:34.000000', -1, -1),

  (-21,  -82,  1, 1998, -11, -89, '2016-09-14 19:05:33.000000', 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-22,  -82,  2, 1998, -11, -89, '2016-09-14 19:05:33.000000', 2, '2017-07-18 20:14:34.000000', -1, -1);

INSERT INTO  exam_target_score (id, exam_id, target_id, school_year, asmt_id, student_id, completed_at,
                                    student_relative_residual_score, standard_met_relative_residual_score,
                                    updated, update_import_id, migrate_id) VALUES
  (-1,   -88,  -11, 1999,  -99, -89, '2016-08-14 19:05:33.000000', -1, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-2,   -88,  -12, 1999,  -99, -89, '2016-08-14 19:05:33.000000', -1, 1, '2017-07-18 20:14:34.000000', -1, -1),

  (-10,  -100,  -71, 1998, -11, -18, '2016-08-14 19:05:33.000000',  -1, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-12,  -100,  -72, 1998, -11, -18, '2016-08-14 19:05:33.000000',  -1, 1, '2017-07-18 20:14:34.000000', -1, -1),

  (-21,   -82,   -71, 1998, -11, -89, '2016-08-14 19:05:33.000000', -1, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-22,   -82,   -72, 1998, -11, -89, '2016-08-14 19:05:33.000000', -1, 1, '2017-07-18 20:14:34.000000', -1, -1);