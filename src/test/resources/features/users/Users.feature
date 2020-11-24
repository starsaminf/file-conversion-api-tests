Feature: Users  
  In order to validate an account
  As a valid Converter customer

  Scenario: User is created with required info
    Given I set authentication using API key and token
    When I send a POST request to "/user/createUser" with the following form data
      | username   | laura     |
      | name       | laura     |
      | lastName   | toro      |
      | password   | Secret123 |
      | rePassword | Secret123 |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "board/boardSchema.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200                                                  |
      | message | "Your account was created! Please, login to continue." |

  Scenario: Displays the users list
    Given I set authentication using API key and token
    When I send a GET request to "user/list"
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "board/boardSchema.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200    |
      | message | "list" |
  
  Scenario: Edits a existing user
    Given I set authentication using API key and token
    When I send a POST request to "/user/edit/{id}" with the following path variable
      |id | 6 |
    And the following form data
      | username   | laura1  |
      | name       | laura1  |
      | lastName   | montaño |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "board/boardSchema.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200                                                    |
      | message | "User edited" |

  Scenario: Edits a non existing user
    Given I set authentication using API key and token
    When I send a POST request to "/user/edit/{id}" with the following path variable
      |id | 6 |
    And the following form data
      | username   | laura1  |
      | name       | laura1  |
      | lastName   | montaño |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "board/boardSchema.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200                                                    |
      | message | "The user with Id: 6does not exist" |

  Scenario: Deletes a existing user
    Given I set authentication using API key and token
    When I send a GET request to "/user/delete/{id}" with the following path variable
      |id | 6 |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "board/boardSchema.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200                                                    |
      | message | "User deleted" |

  Scenario: Deletes a non existing user
    Given I set authentication using API key and token
    When I send a GET request to "/user/delete/{id}" with the following path variable
      |id | 6 |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "board/boardSchema.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200                                                    |
      | message | "The user with Id: 6does not exist" |

  Scenario: User is logout successfully
    Given I am logged in the Converter Application
    When I send a GET request to "/logout"
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "board/boardSchema.json" JSON schema
    And I validate that the response contains the following values
      | status  | 200 |
    And I validate that the response contains the html information of login page
