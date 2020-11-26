Feature: Audio Converter

  In order to convert an audio file
  As a valid Converter customer

  Background: Sets authentication
    Given I set valid authentication headers

  @functional
  Scenario: Verify that is possible to converted an audio file
    When I send a POST request to "/convertAudio" with the following form data
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
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response contain the following values
      | status | 200 |

  @negative
  Scenario: Verify that the audio file is not converted when an invalid export format is used
    When I send a POST request to "/convertAudio" with the following form data
    When I set the following form data
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
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response contain the following values
      | status | 400                    |
      | error  | "Invalid audio format" |

  @negative
  Scenario: Verify that is not possible convert audio without configurations parameters
    When I send a POST request to "/convertAudio" with the empty form data
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response contain the following values
      | status | 400                   |
      | error  | "Invalid audio codec" |