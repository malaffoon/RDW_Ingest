package org.rdw.ingest.processor.repository.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.rdw.ingest.processor.model.District;
import org.rdw.ingest.processor.repository.DistrictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class DistrictRepositoryIT {
    @Autowired
    private DistrictRepository repository;

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Test
    @Sql(statements = "INSERT INTO district (id, name, natural_id) VALUES (22, 'Sample District 1', '01247430000000');")
    public void itShouldReturnExistingId() {
        final int id = repository.findOrCreate(District.builder().withNaturalId("01247430000000").withName("Sample District 1").build());
        assertThat(id).isEqualTo(22);
    }

    @Test
    public void itShouldReturnCreateNewId() {
        Integer id = jdbcTemplate.queryForObject("select count(*) from district where natural_id = :natural_id and name = :name", new MapSqlParameterSource()
                .addValue("natural_id", "01247430000000").addValue("name", "Sample District 1"), Integer.class);
        assertThat(id).isEqualTo(0);

        id = repository.findOrCreate(District.builder().withNaturalId("01247430000000").withName("Sample District 1").build());
        assertThat(id).isNotNull();

        id = jdbcTemplate.queryForObject("select count(*) from district where natural_id = :natural_id and name = :name", new MapSqlParameterSource()
                .addValue("natural_id", "01247430000000").addValue("name", "Sample District 1"), Integer.class);
        assertThat(id).isEqualTo(1);
    }
}