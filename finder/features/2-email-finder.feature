Feature: Email Finder module

    Background:
        When  I click on the linktext "Email Finder"

    Scenario: Validate the user can able to find emails using Valid First name, last name and domain name
        When I add "David" into the inputfield "First Name"
        And  I add "Rogelberg" into the inputfield using Id "input-last"
        And  I add "studiob.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        When I wait for the element "//span[normalize-space()='Clear All']" with in "5" seconds
        Then I expect that element contains text "david.rogelberg@studiob.com" is visible
        And  I expect that element contains text "100%" is visible
        And  I expect that element contains text "Email exists" is visible
        And  I expect that element contains text "Save" is visible

    Scenario: Validate the user can able to find emails using Invalid Details
        When I add "david" into the inputfield "First Name"
        And  I add "valerian" into the inputfield using Id "input-last"
        And  I add "wipro.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        When I wait for the element "//span[normalize-space()='Clear All']" with in "5" seconds
        Then I expect that element contains text "david.valerian@wipro.com" is visible
        And  I expect that element contains text "100%" is visible
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can use the clear all button in Email finder
        When I add "David" into the inputfield "First Name"
        And  I add "Rogelberg" into the inputfield using Id "input-last"
        And  I add "studiob.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        When I wait for the element "//span[normalize-space()='Clear All']" with in "5" seconds
        Then I expect that element contains text "Get User Details" is visible
        Then I expect that element contains text "david.rogelberg@studiob.com" is visible
        When I click on the element contains text "Clear All"
        And  I click on the button using text "Find"
        Then I expect validation message "Please fill in this field." for input field "input-domain-search" matched
        Then I expect that element with text "Search Results" does not exist "yes"
        Then I expect that element with text "Get User Details" does not exist "yes"

    Scenario: Validate the user can able to add the Success email to the list
        When I add "David" into the inputfield "First Name"
        And  I add "Rogelberg" into the inputfield using Id "input-last"
        And  I add "studiob.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//span[normalize-space()='Clear All']" with in "5" seconds
        Then I expect that element contains text "@studiob.com" is visible
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailfinderlist" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I scroll till the page up
        When I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        And  I click on the linktext "Lists"
        And  I click on the linktext "Emailfinderlist"
        Then I expect that element contains text "studiob.com" is visible
        Then I expect that element contains text "Email Finder" is visible
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Emailfinderlist" does not exist "yes"

    Scenario: Validate the user can able to upload the csv file and verify the search results in the bulk email finder
        When I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "30" seconds
        Then I expect that element contains text "Export" is visible
        And  I expect that element contains text "Search Results" is visible
        Then I verified the count of the emails "25" using the element "//tbody//tr"

    Scenario: Validate the user can able to add a success email to the list from the bulk email finder
        When I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "30" seconds
        Then I expect that element contains text "Export" is visible
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailfinderlist" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        And  I click on the linktext "Emailfinderlist"
        Then I expect that element contains text "Email Finder" is visible
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Emailfinderlist" does not exist "yes"

    Scenario: Validate the user can click on Reset button in the bulk email finder
        When I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "30" seconds
        And  I click on the button with text "Reset"
        Then I expect that element with text "Bulkfind50" does not exist "yes"

    Scenario: Validate the user can add email to CRM apps in Email finder
        When I add "David" into the inputfield "First Name"
        And  I add "Rogelberg" into the inputfield using Id "input-last"
        And  I add "studiob.com" into the inputfield using Id "input-domain"
        And  I wait for the element "//button[normalize-space()='Find']" with in "5" seconds
        And  I click on the button using text "Find"
        And  I wait for the element "//td[normalize-space()='Save']" with in "5" seconds
        When I click on the linktext "Save"
        And  I click on the button text "Agile CRM"
        And  I wait for the element "//td[normalize-space()='Save']" with in "1" seconds
        And  I click on the button having text "Save"
        And  I wait for the element "//h4[normalize-space()='Add to CRM']" with in "10" seconds
        Then I expect that element with text "Add to Agile CRM" does not exist "yes"

    Scenario: Validate the user can add email to CRM apps in Bulk email finder
        When I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "30" seconds
        When I click on the linktext "Save"
        And  I click on the button text "Agile CRM"
        And  I wait for the element "//button[normalize-space()='Save']" with in "1" seconds
        And  I click on the button having text "Save"
        And  I wait for the element "//h4[normalize-space()='Add to CRM']" with in "10" seconds
        Then I expect that element with text "Add to Agile CRM" does not exist "yes"

    Scenario: Validate the user can click prev and next buttons in Bulk email finder
        When I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//a[normalize-space()='Next']" with in "30" seconds
        When I click on the linktext "Next"
        And  I wait for the element "//button[normalize-space()='1']" with in "2" seconds
        And  I click on the linktext "Prev"
        Then I expect that element text "1" is visible
