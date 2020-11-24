Feature: Audio Controller
  In order to convert a file
  As a valid Converter customer
  Background: Sets authentication
    Given I set valid credentials for the user

  Scenario: Verify post request for endpoint
    Given I set a POST request to "/convertAudio"
    When I set the following form data
      | file         | @"template/audio/demo.mp3"       |
      | md5          | e1b3fab24c8af81c1aa13dbbb4e44ff0 |
      | exportFormat | .mp3                             |
      | name         | demoConvertFile                  |
      | channel      | 2                                |
      | codec        | libmp3lame                       |
      | bitRate      | 32k                              |
      | sampleRate   | 22050                            |
      | cut          | on                               |
      | start        | 00:00:00                         |
      | duration     | 10                               |
    Then I validate the response has the "200" state code
    And I validate that the response body should match with "audio/audioSchema.json" JSON schema
    And I validate that the response container the following values
      | status  | 200                                                           |
      | message | "storage/convertedFiles/e1b3fab24c8af81c1aa13dbbb4e44ff0.zip" |

  Scenario: I want validate error message when I send worng exportFormat
    Given I send a POST request to "/convertAudio"
    When I set the following form data
      | name         | value                            |
      | file         | @"template/audio/demo.mp3"       |
      | md5          | e1b3fab24c8af81c1aa13dbbb4e44ff0 |
      | exportFormat | .mp5                             |
      | name         | demoConvertFile                  |
      | channel      | 2                                |
      | codec        | libmp3lame                       |
      | bitRate      | 32k                              |
      | sampleRate   | 22050                            |
      | cut          | on                               |
      | start        | 00:00:00                         |
      | duration     | 10                               |
    Then I validate the response has the "400" state code
    And I validate that the response body should match with "audio/audioErrorSchema.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                    |
      | error   | "Invalid audio format" |

  Scenario: I want validate error message when I send empty form-data
    Given I send a POST request to "/convertAudio"
    When I sent the empty form data
    Then I validate the response has the "400" state code
    And I validate that the response body should match with "audio/audioErrorSchema.json" JSON schema
    And I validate that the response container the following values
      | status | 400                   |
      | error  | "Invalid audio codec" |