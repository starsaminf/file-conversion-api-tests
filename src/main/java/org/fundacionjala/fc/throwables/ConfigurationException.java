package org.fundacionjala.fc.throwables;

public class ConfigurationException extends Exception {

    /**
     * Default error message.
     */
    private static final String MESSAGE = "Exception: error in configuration parameters.";

    /**
     * Default constructor.
     */
    public ConfigurationException() {
        super(MESSAGE);
    }

    /**
     * Constructor, change the default message.
     * @param message to change
     */
    public ConfigurationException(final String message) {
        super(message);
    }

    /**
     * Constructs a new exception specified with a detail message.
     * @param throwable new throwable
     */
    public ConfigurationException(final Throwable throwable) {
        super(MESSAGE, throwable);
    }

    /**
     * Constructs a new exception with the specified detail message.
     * @param message specified
     * @param throwable new throwable
     */
    public ConfigurationException(final String message, final Throwable throwable) {
        super(message, throwable);
    }
}
