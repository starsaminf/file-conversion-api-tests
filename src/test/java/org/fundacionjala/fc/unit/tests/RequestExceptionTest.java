package org.fundacionjala.fc.unit.tests;

import org.fundacionjala.fc.throwables.RequestException;
import org.testng.Assert;
import org.testng.annotations.Test;

public class RequestExceptionTest {
    /**
     * Test error message default.
     */
    @Test
    public void testErrorMessageDefault() {
        RequestException gpme = new RequestException();
        String expected = "Exception:  Error in request.";
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }
    /**
     * Test change the default message.
     */
    @Test
    public void testErrorMessageCustomized() {
        String expected = "Exception:";
        RequestException gpme = new RequestException(expected);
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }

    /**
     * Test a new exception specified with a detail message.
     */
    @Test
    public void testErrorMessageNewThrowable() {
        String expected = "Exception:  Error in request.";
        RequestException gpme = new RequestException(new Exception());
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }

    /**
     * Test a new exception with the specified detail message.
     */
    @Test
    public void testErrorMessageCustomizedNewMessageAndThrowable() {
        String expected = "new exception";
        RequestException gpme = new RequestException(expected, new Exception());
        String result = gpme.getMessage();
        Assert.assertEquals(expected, result);
    }
}
