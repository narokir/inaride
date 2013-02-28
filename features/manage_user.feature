@active
Feature: Manage Users
  In order manage user details
  As a security feature
  I want edit user profiles only when authorised
  
  
  Scenario: Show edit link as admin
    Given the following user records
      | email                    | first_name | password | admin |
      | admin@somehost.com       | AdminUser  | foobar 	 | true  |
      | normaluser@gmail.com     | NormalUser | foobar	 | false |
    And I am loged in as "admin" with password "foobar"
    When I visit profile for user "normaluser@gmail.com"
    Then I shoud see "Edit Profile" link