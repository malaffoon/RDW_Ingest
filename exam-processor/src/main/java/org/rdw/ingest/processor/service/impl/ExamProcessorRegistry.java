package org.rdw.ingest.processor.service.impl;

import java.util.List;
import java.util.Map;
import org.rdw.ingest.processor.service.AnyExamProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.collect.Maps.newLinkedHashMap;

/**
 * Registry for finding {@link AnyExamProcessor}s.
 */
@Component
class ExamProcessorRegistry {
    private final Map<String, AnyExamProcessor> reportProcessorFactory;

    @Autowired
    public ExamProcessorRegistry(final List<AnyExamProcessor> processors) {
        checkArgument(!processors.isEmpty(), "exam processors must be not empty");

        reportProcessorFactory = newLinkedHashMap();
        for (final AnyExamProcessor processor : processors) {
            for (final String type : processor.getTypes()) {
                reportProcessorFactory.put(type, processor);
            }
        }
    }

    /**
     * Returns an exam processor for the given exam type
     *
     * @param examType a type of an exam to find a processor for
     * @return an exam processor of the requested type
     */
    public AnyExamProcessor getByType(final String examType) {
        return reportProcessorFactory.get(examType);
    }
}

