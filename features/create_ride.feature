Feature: Create new ride

  Scenario: User does not have an account
    Given a user visits new ride page
    And the user does not have an account
    Then he should see the signin page
    And the user has an account
    When the user submits valid signin information
    Then he is redirected to create a new ride page
    Then the user submits valid ride information
    Then he should see the new ride page

  Scenario: User has an account
    Given a user visits new ride page
    And the user has an account
    When the user submits valid signin information
    Then he is redirected to create a new ride page
    Then the user submits valid ride information
    Then he should see the new ride page