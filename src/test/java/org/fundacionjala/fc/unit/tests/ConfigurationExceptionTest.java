package org.fundacionjala.fc.unit.tests;

import org.fundacionjala.fc.throwables.ConfigurationException;
import org.testng.Assert;
import org.testng.annotations.Test;

public class ConfigurationExceptionTest {
    /**
     * Test error message default.
     */
    @Test
    public void testErrorMessageDefault() {
        ConfigurationException gpme = new ConfigurationException();
        String expected = "Exception: error in configuration parameters.";
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }
    /**
     * Test change the default message.
     */
    @Test
    public void testErrorMessageCustomized() {
        String expected = "No configuration parameter present.";
        ConfigurationException gpme = new ConfigurationException(expected);
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }

    /**
     * Test a new exception specified with a detail message.
     */
    @Test
    public void testErrorMessageNewThrowable() {
        String expected = "Exception: error in configuration parameters.";
        ConfigurationException gpme = new ConfigurationException(new Exception());
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }
    /**
     * Test a new exception with the specified detail message.
     */
    @Test
    public void testErrorMessageCustomizedNewMessageAndThrowable() {
        String expected = "new exception";
        ConfigurationException gpme = new ConfigurationException(expected, new Exception());
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }
}
