Feature: Email Verifier module

    Background:
        When  I click on the linktext "Email Verify"

    Scenario: Validate the user can find the authenticity of an email with a valid email
        When I add "madhavi.perekala@girmiti.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//span[normalize-space()='Clear All']" with in "5" seconds
        Then I expect that element contains text "madhavi.perekala@girmiti.com" is visible
        And  I expect that element contains text "100%" is visible
        And  I expect that element contains text "Email exists" is visible
        And  I expect that element contains text "Save" is visible

    Scenario: Validate the user can find the authenticity of an email with a invalid email
        When I add "david.robert@500apps.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//span[normalize-space()='Clear All']" with in "5" seconds
        Then I expect that element contains text "david.robert@500apps.com" is visible
        And  I expect that element contains text "100%" is visible
        And  I expect that element contains text "Email does not exist. It will bounce." is visible
        And  I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can use the clearall button in email verify
        When I add "jonah.cohn@veriday.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//span[normalize-space()='Clear All']" with in "5" seconds
        Then I expect that element contains text "jonah.cohn@veriday.com" is visible
        And  I expect that element contains text "Get User Details" is visible
        When I click on the element contains text "Clear All"
        And  I click on the button using text "Verify"
        Then I expect validation message "Please fill in this field." for input field "input" matched
        Then I expect that element with text "Get User Details" does not exist "yes"

    Scenario: Validate the user can add the found email to the list from email verify
        When I add "madhavi.perekala@girmiti.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//span[normalize-space()='Clear All']" with in "5" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailverifylist" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        And  I click on the linktext "Lists"
        And  I click on the linktext "Emailverifylist"
        Then I expect that element contains text "girmiti.com" is visible
        And  I expect that element contains text "Email Verify" is visible
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Emailverifylist" does not exist "yes"

    Scenario: Validate the user can upload the csv file and verify the search results in the bulk email verify
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "30" seconds
        Then I expect that element contains text "Export" is visible
        Then I expect that element contains text "Save" is visible
        Then I verified the count of the emails "25" using the element "//b[contains(text(),'Email')]//following::tr//p"

    Scenario: Validate the user can click on Reset button in the bulk email verify
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "30" seconds
        Then I expect that element contains text "Export" is visible
        When I click on the button with text "Reset"
        Then I expect that element with text "Bulkverify50.csv" does not exist "yes"

    Scenario: Validate the user can add a success email to the list from the bulk email verify
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "30" seconds
        Then I expect that element contains text "Export" is visible
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailverifylist" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        And  I click on the linktext "Emailverifylist"
        Then I expect that element contains text "Email Verify" is visible
        When I click on the element contains text "Created Date"
        And  I press the RIGHTARROW
        And  I press the RIGHTARROW
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Emailfinderlist" does not exist "yes"

    Scenario: Validate the user can add email to CRM apps in Email verifier
        When I add "preethi.thakur@wipro.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//td[normalize-space()='Save']" with in "5" seconds
        When I click on the linktext "Save"
        And  I click on the button text "Agile CRM"
        And  I wait for the element "//button[normalize-space()='Save']" with in "3" seconds
        And  I click on the button having text "Save"
        And  I wait for the element "//h4[normalize-space()='Add to CRM']" with in "10" seconds
        Then I expect that element with text "Add to Agile CRM" does not exist "yes"

    Scenario: Validate the user can add email to CRM apps in Bulk email verify
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "30" seconds
        And  I click on the linktext "Save"
        And  I click on the button text "Agile CRM"
        And  I wait for the element "//button[normalize-space()='Save']" with in "3" seconds
        And  I click on the button having text "Save"
        And  I wait for the element "//h4[normalize-space()='Add to CRM']" with in "1" seconds
        Then I expect that element with text "Add to Agile CRM" does not exist "yes"
        When I click on the button using text "×"
        And  I wait for the element "//a[normalize-space()='Apps']" with in "1" seconds
        And  I click on the linktext "Apps"
        And  I click on the button using "Agile CRM"
        And  I click on the options "trash" under my apps "Agile CRM"
        And  I click on the button using text "Confirm"
        Then I expect that element with text " Agile CRM " does not exist "yes"

    Scenario: Validate the user can click prev and next buttons in Bulk Email verifier
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//a[normalize-space()='Next']" with in "30" seconds
        And  I click on the linktext "Next"
        And  I wait for the element "//button[normalize-space()='1']" with in "2" seconds
        And  I click on the linktext "Prev"
        Then I expect that element text "1" is visible
