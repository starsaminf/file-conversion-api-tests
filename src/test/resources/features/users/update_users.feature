Feature: Update Users  

  In order to update an account
  As a valid Converter customer

  Background: Sets authentication
    Given I set valid authentication headers

  @functional @createUser @deleteUser
  Scenario: Verify that is possible to update the user information
    When I send a POST request to "/user/edit/{id}" with the following form data
      | username   | laura1  |
      | name       | laura1  |
      | lastName   | montaño |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "users/updateUser.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200           |
      | message | "User edited" |

  @negative @createUser @deleteUser
  Scenario:  Verify that is not possible to update the user information using an invalid id
    When I send a POST request to "/user/edit/{id}" with following form data
      | username   | laura1  |
      | name       | laura1  |
      | lastName   | montaño |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response contains the following values
      | status  | 400                                    |
      | message | "The user with Id: {id}does not exist" |
