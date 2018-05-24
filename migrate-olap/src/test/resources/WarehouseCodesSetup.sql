INSERT INTO school_year(year) VALUES (1999),(1998);
INSERT INTO grade (id, code, name, sequence) VALUES (111 ,'31','11th-grade-test', 11),(109,'29','9th-grade-test', 9),(108 ,'28','8th-grade-test', 8),(107 ,'27','7th-grade-test', 7);
INSERT INTO elas (id, code) VALUES (-99, 'E99'),(-98, 'E98');
INSERT INTO completeness (id, code) VALUES (-99, 'test1'), (-98, 'test55');
INSERT INTO administration_condition VALUES (-99,'IN-test'),(-98,'NS-test'),(-97,'SD-test'),(-96,'Valid-test');
INSERT INTO ethnicity VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO gender VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO accommodation(id, code) VALUES(-99, 'code1-test'),( -98 ,'code2-test');
INSERT INTO claim VALUES (-99 ,2,'1-IT','Read Analytically: Informational Text','Read Analytically: Informational Text ...'),( -98,2,'2-W','Write Effectively','Write Effectively - ..');
INSERT INTO depth_of_knowledge  VALUES (-99,1,1,'Recall and Reproduction','something'),(-98,2,1,'Basic Skills and Concepts','anything');
INSERT INTO math_practice  VALUES (-99,'Make sense of problems and persevere in solving them', '-9'),(-98,'Reason abstractly and quantitatively', '-8');
INSERT INTO item_trait_score VALUES (-99,'Conventions-test'),(-98,'Evidence/Elaboration-test');
INSERT INTO target VALUES (-99, 'natural-99', -99,'10-1','WORD MEANINGS: Determine intended meanings of words..'),(-98, 'naturalId-99', -98,'10-12','WORD MEANINGS:..)');
INSERT INTO common_core_standard VALUES (-99, 'naturalId-99', 1,'ccommon core -99'),(-98, 'naturalId-98', 2, 'common core -98');
INSERT INTO item_difficulty_cuts(id, subject_id, grade_id, moderate_low_end, difficult_low_end)  VALUES (-99, 2, 109,-1.93882,-0.43906),(-98 , 2, 108, -1.51022,0.14288);
INSERT INTO accommodation_translation(accommodation_id, language_code, label) VALUES (-99, 'lan', 'Hola'),(-98, 'gua','Hello');