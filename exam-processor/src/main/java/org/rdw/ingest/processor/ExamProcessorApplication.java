package org.rdw.ingest.processor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

/**
 * App for exam processor
 */
@SpringBootApplication
@Import(ExamProcessorConfiguration.class)
public class ExamProcessorApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExamProcessorApplication.class, args);
    }
}