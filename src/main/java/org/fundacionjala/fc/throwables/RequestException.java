package org.fundacionjala.fc.throwables;

public class RequestException extends Exception { //re
    /**
     * Default error message.
     */
    private static final String MESSAGE = "Exception:  Error in request.";

    /**
     * Default constructor.
     */
    public RequestException() {
        super(MESSAGE);
    }

    /**
     * Constructor, change the default message.
     * @param message to change
     */
    public RequestException(final String message) {
        super(message);
    }

    /**
     * Constructs a new exception specified with a detail message.
     * @param throwable new throwable
     */
    public RequestException(final Throwable throwable) {
        super(MESSAGE, throwable);
    }

    /**
     * Constructs a new exception with the specified detail message.
     * @param message specified
     * @param throwable new throwable
     */
    public RequestException(final String message, final Throwable throwable) {
        super(message, throwable);
    }
}
