Feature: Sample
	I want to use this template for my feature file


	
	Scenario Outline: TB-1: As a Super Admin, I want to login to the portal
		# Scenario 1: User logs in to the portal
			Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				| Fields        | Value      |
				| UserNameInput | <Email>    |
				| PasswordInput | <Password> |
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
    	Then I click on button "LogoutLink"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
		# Scenario 2: Mandatory fields not filled in
	    Given I want to login to the portal "<PortalName>"
	    And I wait for "2000" milliseconds
	    And I check I am on "Login" page
	    Then I enter the details as
	      | Fields        | Value   |
	      | UserNameInput | <Email> |
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
	    And I see text "Required field!" displayed
    # Scenario 3: User enters Invalid Credentials
    	Given I want to login to the portal "<PortalName>"
    	And I wait for "2000" milliseconds
			Then I enter the details as
				| Fields        | Value      				|
				| UserNameInput | <Email>    				|
				| PasswordInput | <InvalidPassword> |
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
    	And I see text "Invalid username or password." displayed
				
		Examples: 
			| PortalName | Email 							 | Password  | InvalidPassword |
      | SAMPLE     | Corn.Tuna@admin.com | Pass123   | abcdef					 |
      
      
  
	Scenario Outline: TB-2: As a Super Admin, I want to view my account details
  	# Scenario 1: Go to my appointments page
  		Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				| Fields        | Value      |
				| UserNameInput | <Email>    |
				| PasswordInput | <Password> |
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
			Then I click on text "<UserName>"
    	And I wait for "2000" milliseconds
    	And I see text "<Email>" displayed
				
		Examples: 
			| PortalName | Email 							 | Password  | UserName	 |
      | SAMPLE     | Corn.Tuna@admin.com | Pass123   | Corn Tuna |
	    
	
	
	Scenario Outline: TB-3: As a Super Admin, I want to view the physician directory
  	# Scenario 1: Go to my appointments page
  		Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				| Fields        | Value      |
				| UserNameInput | <Email>    |
				| PasswordInput | <Password> |
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
			Then I click on text "Meet my doctor"
    	And I wait for "2000" milliseconds
    	And I see text "Physician Directory" displayed
				
		Examples: 
			| PortalName | Email 							 | Password  |
      | SAMPLE     | Corn.Tuna@admin.com | Pass123   |
      
      
  @TestInProgress    
	Scenario Outline: TB-4: As a Super Admin, I want to view the patient portal
		# Scenario 1: Go to the patient portal