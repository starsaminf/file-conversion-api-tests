package org.fundacionjala.fc.utils;

import io.restassured.response.Response;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchema;

import java.io.File;

public final class JsonSchemaValidatorUtil {

    public static void compareResponseVsJsonSchema(Response response, String schemaFilePath) {
        File schemaFile = new File(schemaFilePath);
        response.then().assertThat().body(matchesJsonSchema(schemaFile));
    }
}
