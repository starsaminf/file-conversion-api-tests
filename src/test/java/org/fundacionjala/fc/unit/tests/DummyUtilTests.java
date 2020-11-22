package org.fundacionjala.fc.unit.tests;

import org.fundacionjala.fc.utils.DummyUtil;
import org.testng.Assert;
import org.testng.annotations.Test;

/**
 * Defines unit tests for Dummy Util Class.
 */
public class DummyUtilTests {

    /**
     * Test get value from Dummy Util class.
     */
    @Test
    public void getValueFromDummyUtilTest() {
        Assert.assertTrue(DummyUtil.getValue());
    }
}
