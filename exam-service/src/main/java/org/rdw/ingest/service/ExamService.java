package org.rdw.ingest.service;

import org.rdw.ingest.auth.RdwUser;
import org.rdw.ingest.model.RdwImport;

import java.util.Optional;

/**
 * Service for manipulating exams / test results.
 */
public interface ExamService {

    /**
     * Accept the payload for import processing
     *
     * @param user user credentials
     * @param payload payload to process
     * @param contentType content type, e.g. application/xml
     * @param batchId optional batch id
     * @return newly created import resource
     */
    RdwImport importExam(RdwUser user, String payload, String contentType, String batchId);

    /**
     * @param id import resource id
     * @return the import resource, may be absent if id not found
     */
    Optional<RdwImport> getImport(String id);
}
