package org.fundacionjala.fc.utils;

import io.restassured.response.Response;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchema;

import java.io.File;

public final class JsonSchemaValidator {

    public static void validate(Response response, String schemaFilePath) {
        File schemaFile = new File(schemaFilePath);
        System.out.println(response.getBody());
        response.then().assertThat().body(matchesJsonSchema(schemaFile));
    }
}
