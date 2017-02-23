package org.rdw.ingest.processor.service.impl;

import java.util.List;
import org.rdw.ingest.processor.model.AnyExam;
import org.rdw.ingest.processor.model.AnyExam.Builder;
import org.rdw.ingest.processor.model.Claim;
import org.rdw.ingest.processor.model.IabExam;
import org.rdw.ingest.processor.repository.IabExamRepository;
import org.rdw.ingest.processor.repository.StudentRepository;
import org.rdw.ingest.processor.service.AnyExamProcessor;
import org.rdw.ingest.processor.service.EthnicityService;
import org.rdw.ingest.processor.service.GenderService;
import org.rdw.ingest.processor.service.GradeService;
import org.rdw.ingest.processor.service.SchoolService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import rdw.model.TDSReport.Opportunity;

//TODO: complete this
@Component
class IabExamProcessor extends AnyExamProcessor {
    private static final Logger logger = LoggerFactory.getLogger(IabExamProcessor.class);

    IabExamRepository iabExamRepository;

    @Autowired
    public IabExamProcessor(GenderService genderService,
                            EthnicityService ethnicityService,
                            GradeService gradeService,
                            SchoolService schoolService,
                            StudentRepository studentRepository,
                            IabExamRepository iabExamRepository) {
        super(genderService, ethnicityService, gradeService, schoolService, studentRepository);
        this.iabExamRepository = iabExamRepository;
    }

    @Override
    public String[] getTypes() {
        return new String[]{"iab"};
    }

    @Override
    protected Builder<? extends AnyExam> getExamBuilder() {
        return IabExam.builder();
    }

    @Override
    protected long processExam(Opportunity opportunity, Builder<? extends AnyExam> builder, List<Claim> claims) {
        IabExam.Builder examBuilder = (IabExam.Builder) builder;
        opportunity.getScore().stream().filter(score -> score.getMeasureOf() == IabExamProcessor.overallScore).forEach(score -> {
            final String label = score.getMeasureLabel();
            if (label == IabExamProcessor.scoreMeasureLabel) {
                examBuilder
                        .withScaleScore(Float.parseFloat(score.getValue()))
                        .withScaleScoreStdErr(Float.parseFloat(score.getStandardError()));
            } else if (label == IabExamProcessor.performanceLevelMeasureLabel) {
                examBuilder
                        .withCategory(Integer.parseInt(score.getValue()));
            }
        });
        return iabExamRepository.create(examBuilder.build());
    }
}