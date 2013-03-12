@active
Feature: Request a ride
  In order to request a ride
  As a registered user
  I want to send a ride request
  
  Scenario: Request a ride
    Given a ride exists
    And I visit a ride page
    When I press "Request Ride" button
    Then I should see the ride request form
    When I submit valid ride request
    Then I should see "Your request has been sent" message