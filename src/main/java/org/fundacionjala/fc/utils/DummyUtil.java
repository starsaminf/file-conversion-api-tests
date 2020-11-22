package org.fundacionjala.fc.utils;

/**
 * Defines Dummy utility class for unit tests execution on CI.
 */
public final class DummyUtil {

    /**
     * Private constructor for {@link DummyUtil} utility class.
     */
    private DummyUtil() {
        // Default constructor for utility class.
    }

    /**
     * Dummy method that always returns true.
     *
     * @return return dummy boolean value.
     */
    public static Boolean getValue() {
        return true;
    }
}
