package org.rdw.ingest.processor.model;

/**
 * A school
 */
public class School extends IdentifiableWithNaturalId<Integer> {
    private String name;
    private District district;

    School(Integer id, String naturalId, String name, District district) {
        this.name = name;
        this.district = district;
        setId(id);
        setNaturalId(naturalId);
    }

    public String getName() {
        return name;
    }

    public District getDistrict() {
        return district;
    }

    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link School}
     */
    public static class Builder {
        private String name;
        private District district;
        private Integer id;
        private String naturalId;

        public School build() {
            return new School(id, naturalId, name, district);
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withDistrict(District district) {
            this.district = district;
            return this;
        }

        public Builder withId(Integer id) {
            this.id = id;
            return this;
        }

        public Builder withNaturalId(String naturalId) {
            this.naturalId = naturalId;
            return this;
        }

    }
}
