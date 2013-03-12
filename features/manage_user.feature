Feature: Manage Users
  In order manage user details
  As a security feature
  I want edit user profiles only when authorised
  
  
  Scenario: Show edit link as admin
    Given the following user records
      | email 			| first_name 	| password 	| admin |
      | admin@example.com 	| Admin    	| foobar 	| true  |
      | random@example.com	| Random   	| foobar 	| false |
      | guest@example.com	| Guest   	| foobar 	| false |
      
    And I am loged in as "admin@example.com" with password "foobar"
    When I visit profile for user "random@example.com"
    Then I should see "Edit Profile" link
    
  Scenario: Show "Edit Profile" link as admin
    Given an admin account exists
    Given a random user account exists
    And I login as admin
    When I visit a random users profile page
    Then I should see Edit Profile link
    
  Scenario: Edit link as non admin
    Given an admin account exists
    Given a random user account exists
    Given I am loged in as random user
    When i vist profile for admin@example.com
    Then I should not see Edit Profile link
    