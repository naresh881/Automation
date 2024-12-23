Feature: Domain Search module

    Background:
        When I wait for the element "//a[text()='Domain Search']" with in "10" seconds

    Scenario: Validate the user can able to find the emails using a domain 
        When I add "freddiemac.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//*[contains(text(),'Search Results')]" with in "10" seconds
        Then I expect that element contains text "Search Results" is visible
        When I wait for the element "//*[contains(text(),'@freddiemac.com')]" with in "3" seconds
        Then I expect that element contains text "@freddiemac.com" is visible
        Then I expect that element contains text "50 Emails found" is visible

    Scenario: Validate the user can able to find the Common pattern using a domain
        When I add "ge.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//*[contains(text(),'Search Results')]" with in "10" seconds
        Then I expect that element contains text "Search Results" is visible
        When I wait for the element "//*[contains(text(),'@ge.com')]" with in "5" seconds
        Then I expect that element contains text "@ge.com" is visible
        When I wait for the element "//*[contains(text(),'first.last@')]" with in "5" seconds
        Then I expect that element contains text "first.last@" is visible

    Scenario: Validate the user can able to add the email to list from domain search add to list popup
        When I click on the linktext "Domain Search"
        When I add "nike.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//*[contains(text(),'Search Results')]" with in "10" seconds
        Then I expect that element contains text "@nike.com" is visible
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Domainsearchlist" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I refresh the page
        When I click on the linktext "Lists"
        And  I click on the linktext "Domainsearchlist"
        Then I expect that element contains text "@nike.com" is visible
        Then I expect that element contains text "Domain Search" is visible
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Domainsearchlist" does not exist "yes"

    Scenario: Validate the user can filter the emails by category
        When I add "agilecrm.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[contains(text(),'Search Results')]" with in "10" seconds
        And  I select category "text" "Work" in domainsearch
        Then I expect that element text "Work" is visible
        When I select category "text" "Generic" in domainsearch
        Then I expect that element text "Generic" is visible

    Scenario: Validate the user can use the clear all button in Domain search
        When I add "agilecrm.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[contains(text(),'Search Results')]" with in "10" seconds
        Then I expect that element contains text "Search Results" is visible
        When I click on the element contains text "Clear All"
        And  I click on the button using text "Domain Search"
        Then I expect validation message "Please fill in this field." for input field "input-domain-search" matched
        Then I expect that element with text "Search results" does not exist "yes"
        And  I expect that element with text "Get company details" does not exist "yes"

    Scenario: Validate the user can click on source popup in Domain search
        When I add "agilecrm.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[contains(text(),'Search Results')]" with in "10" seconds
        Then I expect that element contains text "Search Results" is visible
        When I click on the button with text "1"
        Then I expect that element contains text "Source List" is visible
        And  I expect that element contains text "@agilecrm.com" is visible

    Scenario: Validate the user can able to upload the csv file and verify the count in first page
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "15" seconds
        Then I expect that element text "Export" is visible
        Then I verified the count of the emails "50" using the element "//tr//h5"

    Scenario: Validate the user can able to filter category in the bulk Domain search
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "15" seconds
        Then I expect that element text "Export" is visible
        When I select category "text" "Work" in domainsearch
        Then I expect that element text "Work" is visible
        When I select category "text" "Generic" in domainsearch
        Then I expect that element text "Generic" is visible

    Scenario: Validate the user can able to add a contact to the list form the bulk Domain search
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "15" seconds
        Then I expect that element contains text "Export" is visible
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "BulkDomainsearchlist" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I refresh the page
        When I click on the linktext "Lists"
        And  I click on the linktext "BulkDomainsearchlist"
        Then I expect that element contains text "Domain Search" is visible
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Domainsearchlist" does not exist "yes"

    Scenario: Validate the user can click on source link popup in the bulk Domain search
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "15" seconds
        Then I expect that element contains text "Search Results" is visible
        When I click on the button with text "1"
        Then I expect that element text "Source List" is visible

    Scenario: Validate the user can click the Domain search verify button
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I wait for the element "//button[normalize-space()='Domain Search']" with in "5" seconds
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[contains(text(),'Search Results')]" with in "10" seconds
        And  I wait for "2" seconds
        When I click on element "Verify"
        And  I wait for the element "//button[normalize-space()='Verify']" with in "5" seconds
        And  I click on the button using text "Verify"
        And  I wait for the element "//td[normalize-space()='Email exists']" with in "15" seconds
        Then I expect that element text "Email exists" is visible

    Scenario: Validate the user can able to add email to CRM apps in domain search
        When I click on the linktext "Apps"
        And  I click on toggle button "Agile CRM"
        And  I wait for the element "//h4[normalize-space()='My Apps']" with in "2" seconds
        And  I add "user01@yopmail.com" into the inputfield using Id "form_input_email"
        And  I add "dj3fke6eq4gte30bju6m1vtskg" into the inputfield using Id "form_input_api_key"
        And  I add "durgaprasad" into the inputfield using Id "form_input_domain"
        And  I wait for the element "//button[normalize-space()='Save']" with in "2" seconds
        And  I click on the button using text "Save"
        Then I expect that element text "Agile CRM" is visible
        When I wait for the element "//a[normalize-space()='Domain Search']" with in "2" seconds
        And  I click on the linktext "Domain Search"
        And  I add "500apps.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I wait for the element "//button[normalize-space()='Domain Search']" with in "15" seconds
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//td[normalize-space()='Save']" with in "15" seconds
        And  I click on the linktext "Save"
        And  I click on the button text "Agile CRM"
        And  I wait for the element "//button[normalize-space()='Save']" with in "5" seconds
        And  I click on the button having text "Save"
        And  I wait for the element "//h4[normalize-space()='Add to CRM']" with in "10" seconds
        Then I expect that element with text "Add your contacts to a CRM list." does not exist "yes"

    Scenario: Validate the user can able to add email to CRM apps in Bulk domain search
        When I click on the linktext "Domain Search"
        And  I wait for the element "//small[normalize-space()='Switch to Bulk Domain Search']" with in "5" seconds
        And  I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//td[normalize-space()='Save']" with in "15" seconds
        And  I click on the linktext "Save"
        And  I click on the button text "Agile CRM"
        And  I wait for the element "//button[normalize-space()='Save']" with in "5" seconds
        And  I click on the button having text "Save"
        And  I wait for the element "//h4[normalize-space()='Add to CRM']" with in "10" seconds
        Then I expect that element with text "Add to Agile CRM" does not exist "yes"

    Scenario: Validate the user can able to click verify button in Bulk domain Search
        When I click on the linktext "Domain Search"
        And  I wait for the element "//small[normalize-space()='Switch to Bulk Domain Search']" with in "5" seconds
        And  I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//tbody/tr" with in "15" seconds
        And  I click on the linktext "Verify"
        And  I wait for the element "//button[normalize-space()='Verify']" with in "5" seconds
        And  I click on the button using text "Verify"
        And  I wait for the element "//td[normalize-space()='Email exists']" with in "15" seconds
        Then I expect that element text "Email exists" is visible

    Scenario: Validate the user can click prev and next buttons in Bulk domain search
        When I click on the linktext "Domain Search"
        And  I wait for the element "//small[normalize-space()='Switch to Bulk Domain Search']" with in "30" seconds
        And  I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//a[normalize-space()='Next']" with in "30" seconds
        And  I click on the linktext "Next"
        And  I wait for the element "//button[normalize-space()='1']" with in "2" seconds
        And  I click on the linktext "Prev"
        Then I expect that element text "1" is visible
