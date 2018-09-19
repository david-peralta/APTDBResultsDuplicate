Feature: APT - Iteration 1
	I want to use this feature file for APT - Iteration 1


	#Succeeded
	Scenario Outline: APT-78: As an Admin, I want to login to Oxy Admin portal so that I can access and use the portal
		# Scenario 1: Successful Login
			Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value						|
				|	UserNameInput	|	<LoginUserName>	|
				|	PasswordInput	|	<LoginPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
    	And I see text "Administration" displayed
    	Then I click on text "Log Out"
			And I wait for "2000" milliseconds
    # Scenario 2: Login Unsuccessful
			Given I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value										|
				|	UserNameInput	|	<LoginUserName>					|
				|	PasswordInput	|	<LoginInvalidPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
    	And I see text "Invalid User Credentials" displayed
			And I wait for "2000" milliseconds
				
		Examples:
			|	PortalName	|	LoginUserName							|	LoginPassword		| LoginInvalidPassword	|
      |	APT					|	test_user@aptours.com.au	| admin67testUser	| abcdef								|
  
  
	# Succeeded
	Scenario Outline: APT-81: As an Administrator, I want Oxy Admin to log users out during periods of inactivity so that it prevents them from being used
		# Scenario:
			Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value						|
				|	UserNameInput	|	<LoginUserName>	|
				|	PasswordInput	|	<LoginPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
			And I wait for "1,800,000" milliseconds
			Then I click on text "Administration"
			Then I click on text "Users"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			And I see text "Session timed out" displayed
				
		Examples:
			|	PortalName	|	LoginUserName							|	LoginPassword		|
      |	APT					|	test_user@aptours.com.au	| admin67testUser	|
  
  
	#Succeeded
	Scenario Outline: APT-82: As an Administrator, I want users accounts to be locked after a number of unsuccessful login attempts so that unauthorised access can be prevented
		# Scenario:
			Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value										|
				|	UserNameInput	|	<LoginUserName>					|
				|	PasswordInput	|	<LoginInvalidPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I see text "Invalid User Credentials" displayed
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value										|
				|	UserNameInput	|	<LoginUserName>					|
				|	PasswordInput	|	<LoginInvalidPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I see text "Invalid User Credentials" displayed
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value										|
				|	UserNameInput	|	<LoginUserName>					|
				|	PasswordInput	|	<LoginInvalidPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I see text "Invalid User Credentials" displayed
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value										|
				|	UserNameInput	|	<LoginUserName>					|
				|	PasswordInput	|	<LoginInvalidPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I see text "Invalid User Credentials" displayed
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value										|
				|	UserNameInput	|	<LoginUserName>					|
				|	PasswordInput	|	<LoginInvalidPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I see text "Invalid User Credentials" displayed
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value						|
				|	UserNameInput	|	<LoginUserName>	|
				|	PasswordInput	|	<LoginPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I see text "Account has been locked due to unsuccessful login attempts. Please contact Helpdesk." displayed
				
		Examples:
			|	PortalName	|	LoginUserName							|	LoginPassword		| LoginInvalidPassword	|
      |	APT					|	test_user@aptours.com.au	| admin67testUser	| abcdef								|
  
  
	#Succeeded
	Scenario Outline: APT-126: As a Business Administrator, I want to CREATE users so that users can access their respective portal
		# Scenario 1:
			Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value						|
				|	UserNameInput	|	<LoginUserName>	|
				|	PasswordInput	|	<LoginPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
			Then I click on text "Administration"
			Then I click on text "Users"
			And I wait for "2000" milliseconds
			And I check I am on "User" page
		# Scenario 2:
			Given I check I am on "User" page
			Then I click on button "Actions"
			And I check I am on "UserDetails" page
			Then I enter the details as
				|	Fields							|	Value							|
				|	OdysseyUserIdInput	|	<CreateUserId>		|
			And I wait for "2000" milliseconds
			Then I enter the details as
				|	Fields							|	Value							|
				|	UserNameInput				|	<CreateEmail>			|
				|	FirstNameInput			|	<CreateFirstName>	|
				|	LastNameInput				|	<CreateLastName>	|
			Then I select option "No-Access" from "AdminAccessInput"
			Then I select option "No Access" from "RolesTable" in "Promotions" row
			Then I select option "No Access" from "RolesTable" in "Packages" row
			Then I select option "No Access" from "RolesTable" in "Customers" row
			Then I click on button with value "Save User"
			And I wait for "2000" milliseconds
			And I see text "Activation link is successfully sent to the User" displayed
			And I wait for "2000" milliseconds
			And I check I am on "User" page
		# Scenario 3:
			Given I check I am on "User" page
			Then I click on button "Actions"
			And I check I am on "UserDetails" page
			Then I enter the details as
				|	Fields							|	Value							|
				|	OdysseyUserIdInput	|	<CreateUserIdNew>	|
			And I wait for "2000" milliseconds
			Then I enter the details as
				|	Fields							|	Value							|
				|	UserNameInput				|	<CreateEmail>			|
				|	FirstNameInput			|	<CreateFirstName>	|
				|	LastNameInput				|	<CreateLastName>	|
			Then I select option "Administrator Access" from "AdminAccessInput"
			Then I select option "Can Edit" from "RolesTable" in "Promotions" row
			Then I select option "Can Edit" from "RolesTable" in "Packages" row
			Then I select option "Can Edit" from "RolesTable" in "Customers" row
			Then I click on button with value "Save User"
			And I wait for "2000" milliseconds
			And I see text "An account with this email id exist in the system" displayed
		# Scenario 4:
			Given I check I am on "UserDetails" page
			Then I click on button with value "Close"
			And I wait for "2000" milliseconds
			And I check I am on "User" page
							
		Examples: 
			|	PortalName	|	LoginUserName							|	LoginPassword		| CreateUserId 		| CreateEmail 							| CreateFirstName | CreateLastName	|	CreateUserIdNew			|
      |	APT					|	test_user@aptours.com.au	| admin67testUser	| Test_Create_UID	| test_create_user@test.com	|	Test_Create_FN	|	Test_Create_LN	|	Test_Create_UID_New	|
  
  
  
  Scenario Outline: APT-161: As a Business Administrator, I want to VIEW and EDIT a user account so that I can maintain user accounts up-to date
		# Scenario 1:
			Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value						|
				|	UserNameInput	|	<LoginUserName>	|
				|	PasswordInput	|	<LoginPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
			Then I click on text "Administration"
			Then I click on text "Users"
			And I wait for "2000" milliseconds
			And I check I am on "User" page
  		Then I click on "Edit" button of "<UpdateEmail>" row
			And I wait for "2000" milliseconds
  		And I check I am on "UserDetails" page
  		And I see text "<UpdateUserId>" in "OdysseyUserIdInput" input box displayed
  		And I see text "<UpdateEmail>" in "UserNameInput" input box displayed
  	# Scenario 2:
  		Given I check I am on "UserDetails" page
			Then I enter the details as
				|	Fields							|	Value						|
				|	FirstNameInput			|	<Blank>					|
				|	FirstNameInput			|	<NewFirstName>	|
				|	LastNameInput				|	<Blank>					|
				|	LastNameInput				|	<NewLastName>		|
			Then I select option "No-Access" from "AdminAccessInput"
			Then I select option "Can View" from "RolesTable" in "Promotions" row
			Then I select option "Can View" from "RolesTable" in "Packages" row
			Then I select option "Can View" from "RolesTable" in "Customers" row
			Then I click on button with value "Save User"
			And I wait for "2000" milliseconds
			# Should receive email notifying the changes.
		# Scenario 3:
			Given I check I am on "User" page
  		Then I click on "Edit" button of "<UpdateEmail>" row
			And I wait for "2000" milliseconds
  		And I check I am on "UserDetails" page
			Then I enter the details as
				|	Fields				|	Value				|
				|	UserNameInput	|	<NewEmail>	|
			Then I click on button with value "Save User"
			And I wait for "2000" milliseconds
			# Should receive new activation email.
		# Scenario 4:
			Given I check I am on "User" page
  		Then I click on "Edit" button of "<NewEmail>" row
			And I wait for "2000" milliseconds
  		And I check I am on "UserDetails" page
			Then I enter the details as
				|	Fields							|	Value		|
				|	OdysseyUserIdInput	|	<Blank>	|
			And I wait for "2000" milliseconds
			Then I enter the details as
				|	Fields							|	Value		|
				|	UserNameInput				|	<Blank>	|
				|	FirstNameInput			|	<Blank>	|
				|	LastNameInput				|	<Blank>	|
			Then I click on button with value "Save User"
		# Scenario 5:
  		Given I check I am on "UserDetails" page
			Then I click on button with value "Close"
			And I wait for "2000" milliseconds
			And I check I am on "User" page
		# Scenario 6:
			Given I check I am on "User" page
  		Then I click on "Edit" button of "<ResetPasswordEmail>" row
			And I wait for "2000" milliseconds
  		And I check I am on "UserDetails" page
			Then I click on button "ResetPassword"
			And I wait for "2000" milliseconds
  		# Should receive an email to create new password.
			Then I click on button with value "Close"
			And I wait for "2000" milliseconds
			And I check I am on "User" page
		# Scenario 7: (Only if account is not activated)
			Given I check I am on "User" page
  		Then I click on "Edit" button of "<ActivateEmail>" row
			And I wait for "2000" milliseconds
  		And I check I am on "UserDetails" page
			Then I click on button "ResendActivaionEmail"
			And I wait for "2000" milliseconds
  		# Should receive an email to activate account.
							
		Examples: 
			|	PortalName	|	LoginUserName							|	LoginPassword		|	UpdateUserId		|	UpdateEmail								| NewFirstName		| NewLastName 		| NewEmail										|	Blank	|	ResetPasswordEmail				|	ActivateEmail								|
      |	APT					|	test_user@aptours.com.au	| admin67testUser	|	Test_Create_UID	| test_create_user@test.com	|	Test_Updated_FN	| Test_Updated_LN	|	test_updated_user@test.com	|		 		|	Test_User@aptours.com.au	|	test_updated_user@test.com	|
  
  
	@TestInProgress
	Scenario Outline: APT-159: As a Business Administrator, I want to SEARCH User records, so that I can manage the user accounts
		# Scenario 0: Verifying sorting
			Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value						|
				|	UserNameInput	|	<LoginUserName>	|
				|	PasswordInput	|	<LoginPassword>	|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
			Then I click on text "Administration"
			Then I click on text "Users"
			And I wait for "2000" milliseconds
			And I check I am on "User" page
			And I click on text "<Column1>"
			And I verify sorting is working for "UserTable" table column "1"
			And I wait for "2000" milliseconds
			And I click on text "<Column2>"
			And I verify sorting is working for "UserTable" table column "2"
			And I wait for "2000" milliseconds
			And I click on text "<Column3>"
			And I verify sorting is working for "UserTable" table column "3"
			And I wait for "2000" milliseconds
			And I click on text "<Column4>"
			And I verify sorting is working for "UserTable" table column "4"
			And I wait for "2000" milliseconds
		# Scenario 1:
			Given I check I am on "User" page
			And I enter the details as
				|	Fields			|	Value					|
				|	SearchInput	|	<SearchText>	|
			Then I click on button "SearchButton"
		# Scenario 2:
			Given I check I am on "User" page
			Then I click on "Columns" button with type "button"
			Then I click on "LastName" button with class "-checked"
			And I see text "<LastName>" not displayed
		# Scenario 3: (Should be removed from scenarios)
		# Scenario 4:
			Given I check I am on "User" page
			And I enter the details as
				|	Fields			|	Value							|
				|	SearchInput	|	<FailSearchText>	|
			Then I click on button "SearchButton"
			Then I see text "No matching records found." displayed
    # Scenario 5:
			Given I check I am on "User" page
			And I enter the details as
				|	Fields			|	Value		|
				|	SearchInput	|	<Blank>	|
			Then I click on button "SearchButton"
  		Then I click on "Unlock" button of "<LockedAccount>" row
			And I wait for "2000" milliseconds
			Then I see "Unlock account for Test2 Test2?" displayed on popup and I click "OK"
			# Should receive an email that user was unlocked.
		# Scenario 6:
			Given I check I am on "User" page
  		Then I click on "Reset Password" button of "<Email>" row
			And I wait for "2000" milliseconds
			Then I see "Reset password for <SearchFirstName> <SearchLastName>?" displayed on popup and I click "OK"
			# Should receive an email with the link to reset the password of the user.
			Then I see "Reset password for <SearchFirstName> <SearchLastName>?" displayed on popup and I click "Cancel"
		# Scenario 7:
			Given I check I am on "User" page
			Then I click on button "Active"
			Then I see "Deactivate account for user <SearchFirstName> <SearchLastName>" displayed on popup and I click "Yes"
				
		Examples:
			|	PortalName	|	LoginUserName							|	LoginPassword		|	SearchText	|	FailSearchText	|	Email												|	FirstName				|	LastName				|	LockedAccount							|	LockedAccountFirstName	|	LockedAccountLastName	|	Blank	|	Column1		|	Column2		|	Column3	|	Column4	|	
      |	APT					|	test_user@aptours.com.au	| admin67testUser	| Test				|	qwerty					|	test_updated_user@test.com	|	Test_Updated_FN	|	Test_Updated_LN	|	Test_User2@aptours.com.au	|	Test2										|	Test2									|	 			|	LastName	|	FirstName	|	Email		|	Active	|
  
  
	
	Scenario Outline: APT-320: As a Promotions User, I want to SEARCH Promotions Table, so that results are returned against elected criteria
  	# Scenario 1: Search from Global search bar
			Given I want to login to the portal "<PortalName>"
			And I wait for "2000" milliseconds
			And I check I am on "Login" page
			Then I enter the details as
				|	Fields				|	Value						|
				|	UserNameInput	|	<EmailUserName>	|
				|	PasswordInput	|	<Password>			|
			Then I click on button with value "Login"
			And I wait for "2000" milliseconds
			And I check I am on "HomePage" page
			Then I click on text "Modules"
			Then I click on text "Promotions"
			And I wait for "2000" milliseconds
			And I check I am on "Promotions" page
			And I enter the details as
				|	Fields							|	Value									|
				|	Input_PromotionCode	|	<SearchPromotionCode>	|
			Then I click on button with value "Find Promotion"
			Then I check that table "UsersTable" with row containing "<SearchPromotionCodeResult>" returns atleast "1" row
  	# Scenario 2: Search with invalid text
			Given I check I am on "Promotions" page
			And I enter the details as
				|	Fields							|	Value											|
				|	Input_PromotionCode	|	<FailSearchPromotionCode>	|
			Then I click on button with value "Find Promotion"
			Then I see text "No matching records found." displayed
  	# Scenario 3: Filter the search results with multi filters
  	# Scenario 4: Filter from Columns by single or multiple fields
  	# Scenario 5: Sort Results
  	# Scenario 6: Reset all Filters
  	# Scenario 7: Re-routing from Promotion search page
  	# Scenario 8:
				
		Examples:
			|	PortalName	|	EmailUserName							|	Password				|	SearchPromotionID	|	SearchPromotionCode	| SearchPromotionDescription	|	FailSearchPromotionCode	| Blank	|	SearchPromotionCodeResult			|
      |	APT					|	test_user@aptours.com.au	| admin67testUser	| 10109							|	APT									| Shoestring									|	qwerty									|	 			|	DISTRESS APT EUR18 test50 SD	|
  	
  
	
	Scenario Outline: APT-381: As a Promotions User, I want to SEARCH, FIND AND ADD one or more customers to assign to a promotion
	
	
	
	Scenario Outline: APT-382: As a Promotions User, I want to SEARCH, FIND and ADD one or more packages to assign to a promotion
  
  
  
  Scenario Outline: APT-217: As a Promotions User, I want to CREATE a Promotion, so that it can be applied to Packages
  
  
  
  Scenario Outline: APT-229: As a Promotions User, I want to UPDATE a Promotion, so that it is up to date
  
  
	
	Scenario Outline: APT-230: As a Promotions User, I want to READ/VIEW a Promotion, so that I can verify it is correct
	
	
	
	Scenario Outline: APT-70: As a Promotions User, I want to CREATE a new Promotions Group in the interest of combining them with other groups