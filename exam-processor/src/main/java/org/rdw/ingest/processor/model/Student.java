package org.rdw.ingest.processor.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.validation.constraints.Null;
import java.util.Date;

/**
 * A Student
 */
public class Student extends IdentifiableWithNaturalId<Long> {
    private String lastOrSurname;
    private String firstName;
    private String middleName;
    private int genderId;
    private int ethnicityId;

    @Null
    private Date firsEntryIntoUSSchoolAt;
    @Null
    private Date lepEntryAt;
    @Null
    private Date lepExitAt;
    private Date birthday;

    public String getSsid() {
        return getNaturalId();
    }

    public String getLastOrSurname() {
        return lastOrSurname;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public int getGenderId() {
        return genderId;
    }

    public int getEthnicityId() {
        return ethnicityId;
    }

    public Date getFirsEntryIntoUSSchoolAt() {
        return firsEntryIntoUSSchoolAt;
    }

    public Date getLepEntryAt() {
        return lepEntryAt;
    }

    public Date getLepExitAt() {
        return lepExitAt;
    }

    public Date getBirthday() {
        return birthday;
    }

    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link Student}
     */
    public static class Builder {
        private String naturalId;
        private Long id;
        private String lastOrSurname;
        private String firstName;
        private String middleName;
        private int genderId;
        private int ethnicityId;
        private Date firsEntryIntoUSSchoolAt;
        private Date lepEntryAt;
        private Date lepExitAt;
        private Date birthday;

        public Student build() {
            final Student student = new Student();
            student.setId(id);
            student.setNaturalId(naturalId);
            student.lastOrSurname = lastOrSurname;
            student.firstName = firstName;
            student.middleName = middleName;
            student.genderId = genderId;
            student.ethnicityId = ethnicityId;
            student.firsEntryIntoUSSchoolAt = firsEntryIntoUSSchoolAt;
            student.lepEntryAt = lepEntryAt;
            student.lepExitAt = lepExitAt;
            student.birthday = birthday;
            return student;
        }

        public Builder withNaturalId(String naturalId) {
            this.naturalId = naturalId;
            return this;
        }

        public Builder withId(Long id) {
            this.id = id;
            return this;
        }

        public Builder withLastOrSurname(String lastOrSurname) {
            this.lastOrSurname = lastOrSurname;
            return this;
        }

        public Builder withFirstName(String firstName) {
            this.firstName = firstName;
            return this;
        }

        public Builder withMiddleName(String middleName) {
            this.middleName = middleName;
            return this;
        }

        public Builder withGenderId(int genderId) {
            this.genderId = genderId;
            return this;
        }

        public Builder withEthnicityId(int ethnicityId) {
            this.ethnicityId = ethnicityId;
            return this;
        }

        public Builder withFirsEntryIntoUSSchoolAt(String firsEntryIntoUSSchoolAt) throws ParseException {
            this.firsEntryIntoUSSchoolAt = new SimpleDateFormat("yyyyy-mm-dd").parse(firsEntryIntoUSSchoolAt);
            return this;
        }

        public Builder withLepEntryAt(String lepEntryAt) throws ParseException {
            this.lepEntryAt = new SimpleDateFormat("yyyyy-mm-dd").parse(lepEntryAt);
            return this;
        }

        public Builder withLepExitAt(String lepExitAt) throws ParseException {
            this.lepExitAt =  new SimpleDateFormat("yyyyy-mm-dd").parse(lepExitAt);
            return this;
        }

        public Builder withBirthday(String birthday) throws ParseException {
            this.birthday =  new SimpleDateFormat("yyyyy-mm-dd").parse(birthday);
            return this;
        }

    }

}
