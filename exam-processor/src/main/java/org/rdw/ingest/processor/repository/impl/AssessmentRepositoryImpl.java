package org.rdw.ingest.processor.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.model.Claim;
import org.rdw.ingest.processor.repository.AssessmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
class AssessmentRepositoryImpl implements AssessmentRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Override
    public Assessment findAssessmentByNaturalId(String id) {

        List<Assessment.Builder> assessmentList = jdbcTemplate.query("select * from asmt where natural_id= :natural_id", new MapSqlParameterSource("natural_id", id), new AssessmentRowMapper());
        if (assessmentList.size() == 1) {
            return assessmentList
                    .get(0)
                    .withClaims(jdbcTemplate.query("select * from claim where asmt_id= :asmt_id", new MapSqlParameterSource("asmt_id", assessmentList.get(0).build().getId()), new ClaimRowMapper()))
                    .build();

        }
        //TODO
        return null;
    }

    @Override
    public Assessment create(final Assessment assessment) {

        //TODO:this does not deal with claims yet
        final String sql = "INSERT INTO asmt (natural_id, grade_id,type_id, subject_id, academic_year, name, label, version) VALUES\n" +
                " (:natural_id, :grade_id, :type_id, :subject_id, :academic_year, :name, :label, :version);\n";

        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("natural_id", assessment.getNaturalId())
                .addValue("grade_id", assessment.getGradeId())
                .addValue("type_id", assessment.getTypeId())
                .addValue("subject_id", assessment.getSubjectId())
                .addValue("academic_year", assessment.getAcademicYear())
                .addValue("name", assessment.getName())
                .addValue("label", assessment.getLabel())
                .addValue("version", assessment.getVersion());

        jdbcTemplate.update(sql, parameterSource, keyHolder);
        final Long asmtId = keyHolder.getKey().longValue();
        batchCreateClaims(assessment.getClaims(), asmtId);
        return Assessment.builder().withCopy(assessment).withId(asmtId).build();

    }

    protected void batchCreateClaims(final List<Claim> claims, final long assessmentId) {
        SqlParameterSource[] batchParameters = claims.stream()
                .map(claim -> new MapSqlParameterSource("asmt_id", assessmentId)
                        .addValue("min_score", claim.getMinScore())
                        .addValue("max_score", claim.getMaxScore())
                        .addValue("code", claim.getCode()))
                .toArray(MapSqlParameterSource[]::new);

        jdbcTemplate.batchUpdate("\n" +
                "INSERT INTO claim (asmt_id, min_score, max_score, code) VALUES\n" +
                "(:asmt_id, :min_score, :max_score, :code);", batchParameters);

    }

    private static class AssessmentRowMapper implements RowMapper<Assessment.Builder> {
        //TODO:this does not deal with claims yet
        @Override
        public Assessment.Builder mapRow(ResultSet rs, int rowNum) throws SQLException {
            return Assessment.builder()
                    .withId(rs.getLong("id"))
                    .withNaturalId(rs.getString("natural_id"))
                    .withGradeId(rs.getInt("grade_id"))
                    .withTypeId(rs.getInt("type_id"))
                    .withSubjectId(rs.getInt("subject_id"))
                    .withAcademicYear(rs.getInt("academic_year"))
                    .withName(rs.getString("name"))
                    .withLabel(rs.getString("label"))
                    .withVersion(rs.getString("version"));

        }
    }

    private static class ClaimRowMapper implements RowMapper<Claim> {
        //TODO:this does not deal with claims yet
        @Override
        public Claim mapRow(ResultSet rs, int rowNum) throws SQLException {
            return Claim.builder()
                    .withCode(rs.getString("code"))
                    .withMaxScore(rs.getFloat("max_score"))
                    .withMinScore(rs.getFloat("min_score"))
                    .withId(rs.getInt("id"))
                    .build();

        }
    }
}
