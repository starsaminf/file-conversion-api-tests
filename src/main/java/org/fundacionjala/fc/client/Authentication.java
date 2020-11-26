package org.fundacionjala.fc.client;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.apache.http.entity.ContentType;

public class Authentication {

    private static final String BASE_URL_API = "http://localhost:8080";
    private static final String USERNAME_VAL = "admin2";
    private static final String PASSWORD_VAL = "Admin123451";
    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";
    private static final String PATH = "/login";
    private RequestSpecification request;

    /**
     * Constructor for Authentication.
     */
    public Authentication() {
        request = RestAssured.given();
        request.baseUri(BASE_URL_API);
        request.cookie(getCookie());

    }

    /**
     * Get id session of authentication.
     *
     * @return a String.
     */
    private String getCookie() {
        RestAssured.baseURI = BASE_URL_API;
        Response response =  RestAssured
                .given()
                .contentType(ContentType.MULTIPART_FORM_DATA.toString())
                .multiPart(USERNAME, USERNAME_VAL)
                .multiPart(PASSWORD, PASSWORD_VAL)
                .when()
                .post(PATH);

        String idSession = response.getDetailedCookie("JSESSIONID").toString();
        return idSession;
    }

    /**
     * Get request specifications.
     *
     * @return request.
     */
    public RequestSpecification getRequestSpecification() {
        return request;
    }

}
