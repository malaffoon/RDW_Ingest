DELETE FROM staging_test.staging_completeness WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_administration_condition WHERE id IN (-99,-98, -97, -96);
DELETE FROM staging_test.staging_ethnicity WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_gender WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_accommodation WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_depth_of_knowledge  WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_math_practice  WHERE practice IN (-99,-98);
DELETE FROM staging_test.staging_item_trait_score WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_target WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_item_difficulty_cuts  WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_claim WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_grade WHERE id IN (-99,-98);

DELETE FROM reporting_test.completeness WHERE id IN (-99,-98);
DELETE FROM reporting_test.administration_condition WHERE id IN (-99,-98, -97, -96);
DELETE FROM reporting_test.ethnicity WHERE id IN (-99,-98);
DELETE FROM reporting_test.gender  WHERE id IN (-99,-98);
DELETE FROM reporting_test.accommodation WHERE id IN (-99,-98);
DELETE FROM reporting_test.depth_of_knowledge  WHERE id IN (-99,-98);
DELETE FROM reporting_test.math_practice  WHERE practice IN (-99,-98);
DELETE FROM reporting_test.item_trait_score WHERE id IN (-99,-98);
DELETE FROM reporting_test.target  WHERE id IN (-99,-98);
DELETE FROM reporting_test.item_difficulty_cuts  WHERE id IN (-99,-98);
DELETE FROM reporting_test.grade WHERE id IN (-99,-98);
DELETE FROM reporting_test.claim WHERE id IN (-99,-98);

DELETE FROM reporting_test.migrate;