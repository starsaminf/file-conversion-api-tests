package org.fundacionjala.fc.unit.tests;

import org.fundacionjala.fc.throwables.InitializationError;
import org.testng.Assert;
import org.testng.annotations.Test;

public class InitializationErrorTest {
    /**
     * Test error message default.
     */
    @Test
    public void testErrorMessageDefault() {
        InitializationError gpme = new InitializationError();
        String expected = "Error: file initialization failed.";
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }

    /**
     * Test change the default message.
     */
    @Test
    public void testErrorMessageCustomized() {
        String expected = "error, gradle.properties";
        InitializationError gpme = new InitializationError(expected);
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }

    /**
     * Test a new exception specified with a detail message.
     */
    @Test
    public void testErrorMessageNewThrowable() {
        String expected = "Error: file initialization failed.";
        InitializationError gpme = new InitializationError(new Error());
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }

    /**
     * Test a new exception with the specified detail message.
     */
    @Test
    public void testErrorMessageCustomizedNewMessageAndThrowable() {
        String expected = "new error";
        InitializationError gpme = new InitializationError(expected, new Error());
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }
}
