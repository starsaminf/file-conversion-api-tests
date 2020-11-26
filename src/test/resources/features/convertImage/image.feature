Feature: Image converter

  In order to convert a image file
  As a valid Converter customer

  Background: Sets authentication
    Given I set authentication headers

  @functional
  Scenario: Verify that a image file is converted to another image file with a different extension
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2,5                              |
      | height           |  10                               |
      | width            |  10                               |
      | gray             |  on                               |
      | extractMetadata  |  on                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "common/messageResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 200 |

  @functional
  Scenario: Verify that the image file is converted to grayscale
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | height           |  10                               |
      | width            |  10                               |
      | gray             |  on                               |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "common/messageResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 200 |

  @functional
  Scenario: Verify that the image file is resized
    When I send a POST request to "/convertImage" with all the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2,5                              |
      | height           |  10                               |
      | width            |  10                               |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "image/messageResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 200 |

  @functional
  Scenario: Verify that an image file can extract its metadata in json file
    When I send a POST request to "/convertImage" with all the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | extractMetadata  |  on                               |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "image/messageResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 200 |

  @functional
  Scenario: Verify that an image file can extract its thumbnail
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | height           |  10                               |
      | width            |  10                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "image/messageResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 200 |

  @functional
  Scenario: Verify that the position field receives data of type (x,y)
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2,5                              |
      | height           |  10                               |
      | width            |  10                               |
      | gray             |  on                               |
      | extractMetadata  |  on                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "common/messageResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 200                 |

  @negative
  Scenario: Verify that an image file is not converted to a file other than image file
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .mp3                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2,5                              |
      | height           |  10                               |
      | width            |  10                               |
      | gray             |  on                               |
      | extractMetadata  |  on                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                    |
      | error   | "Invalid image format" |

  @negative
  Scenario: Verify that the file is of type image
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/video/video.mp4"      |
      | md5              |  82d9b86b01560ce17d310f3fd2a79ca9 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2,5                              |
      | height           |  10                               |
      | width            |  10                               |
      | gray             |  on                               |
      | extractMetadata  |  on                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                         |
      | error   | "The file isn't type image" |

  @negative
  Scenario: Verify that with invalid md5 an error displayed
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  67f25cfcac46d53fc823f919__3aa    |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2,5                              |
      | height           |  10                               |
      | width            |  10                               |
      | gray             |  on                               |
      | extractMetadata  |  on                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                 |
      | error   | "Failed in the md5" |

  @negative
  Scenario: Verify that an empty form cannot be sent
    When I send a POST request to "/convertImage" with the following form data
      | file             |                              |
      | md5              |                              |
      | exportFormat     |                              |
      | height           |                              |
      | width            |                              |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                     |
      | error   | "Please, fill the form" |

  @negative
  Scenario: Verify that if one of the mandatory field is empty, it displays an error message
    When I send a POST request to "/convertImage" with the following form data
      | file             | @"template/image/image.jpg"      |
      | md5              | 1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .bmp                            |
      | height           |                                  |
      | width            |   10                             |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                     |
      | error   | "Invalid height"        |

  @negative
  Scenario: Verify that if several mandatory fields are empty, it displays corresponding messages
    When I send a POST request to "/convertImage" with the following form data
      | file             | @"template/image/image.jpg"      |
      | md5              | 1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .bmp                            |
      | height           |                                  |
      | width            |                                  |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                               |
      | error   | "Invalid height and width"        |

  @negative
  Scenario: Verify that with different md5 an error displayed????
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2,5                              |
      | height           |  10                               |
      | width            |  10                               |
      | gray             |  on                               |
      | extractMetadata  |  on                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                 |
      | error   | "Failed in the md5" |


  @negative
  Scenario: Verify that the position field does not allow data that is not of type (x,y)
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2                                |
      | height           |  10                               |
      | width            |  10                               |
      | gray             |  on                               |
      | extractMetadata  |  on                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                                |
      | error   | "The position field is type (x,y)" |

  @functional
  Scenario: Verify that without the changeSize field the height and width fields are not required
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  off                              |
      | position         |  2                                |
      | height           |                                   |
      | width            |                                   |
    Then I validate the response has the "200" status code
    And I validate that the response body should match with "common/messageResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 200                               |

  @negative
  Scenario: Verify that the numeric fields do not accept negative numbers
    When I send a POST request to "/convertImage" with the following form data
      | file             |  @"template/image/image.jpg"      |
      | md5              |  1589d7f466220b7604858b1eaabdd0d2 |
      | exportFormat     |  .png                             |
      | name             |  test                             |
      | changeSize       |  on                               |
      | position         |  2                                |
      | height           |  -10                              |
      | width            |  10                               |
      | gray             |  on                               |
      | extractMetadata  |  on                               |
      | extractThumbnail |  on                               |
    Then I validate the response has the "400" status code
    And I validate that the response body should match with "common/errorResponse.json" JSON schema
    And I validate that the response container the following values
      | status  | 400                               |
      | error   | "Invalid height"                  |
