package org.rdw.ingest.model;

/**
 * Status for imports
 */
public enum ImportStatus {
    INVALID(-1),
    ACCEPTED(0),
    PROCESSED(1);

    private final int value;

    ImportStatus(final int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public ImportStatus fromValue(final int value) {
        for (final ImportStatus status : ImportStatus.values()) {
            if (value == status.value) return status;
        }
        throw new IllegalArgumentException("Unknown ImportStatus value.");
    }
}