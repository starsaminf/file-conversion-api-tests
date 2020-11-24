package org.fundacionjala.fc.utils;

import io.restassured.response.Response;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchema;

import java.io.File;

public final class JsonSchemaValidator {

    /**
     * This avoids a default constructor for utility class.
     */
    private JsonSchemaValidator() {
    }

    /**
     * A method that validate a http response from a given JsonSchema file.
     * @param response the response obtained from the server.
     * @param schemaFilePath the path of the JsonSchema file.
     */
    public static void validate(final Response response, final String schemaFilePath) {
        File schemaFile = new File(schemaFilePath);
        System.out.println(response.getBody());
        response.then().assertThat().body(matchesJsonSchema(schemaFile));
    }
}
