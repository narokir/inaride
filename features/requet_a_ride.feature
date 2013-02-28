Feature: Request a ride
  In order to go on a ride
  As a passenger
  I want to request a ride
  
  @active
  Scenario: Request a ride
    Given I am on a show ride page
    When I click ride request
    Then I should see a ride request form
    And I submit valid ride request
    When I click send request