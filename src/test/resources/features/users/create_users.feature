Feature: Create Users  

  In order to create an account
  As a valid Converter customer

  @functional @deleteUser
  Scenario: Verify that is possible to create a new account
    When I send a POST request to "/user/createUser" with the following form data
      | username   | laura     |
      | name       | laura     |
      | lastName   | toro      |
      | password   | Secret123 |
      | rePassword | Secret123 |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "users/createUsers.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200                                                    |
      | message | "Your account was created! Please, login to continue." |

  @functional @createUser @deleteUser
  Scenario: Verify that is possible to logout user
    Given I am logged in the Converter Application
    When I send a GET request to "/logout"
    Then I validate the response has the "302" status code
    And I validate that the response body should match with "user/logout.json" JSON schema
    And I validate that the response contains the following values
      | status  | 302 |
