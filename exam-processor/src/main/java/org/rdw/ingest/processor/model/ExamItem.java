package org.rdw.ingest.processor.model;

/**
 * An item's score for an {@link AnyExam}
 */
public class ExamItem {
    private Long key;
    private String bankKey;
    private float score;
    private String scoreStatus;
    private String response;

    public ExamItem(Long key, String bankKey, float score, String scoreStatus, String response) {
        this.key = key;
        this.bankKey = bankKey;
        this.score = score;
        this.scoreStatus = scoreStatus;
        this.response = response;
    }

    public Long getKey() {
        return key;
    }

    public String getBankKey() {
        return bankKey;
    }

    public float getScore() {
        return score;
    }

    public String getScoreStatus() {
        return scoreStatus;
    }

    public String getResponse() {
        return response;
    }
}
