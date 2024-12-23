Feature: Email Verifier module

    Background:
        When I wait for the element "//a[text()='Email Verify']" with in "10" seconds
        When I click on the linktext "Email Verify"

    Scenario: Validate the user can get error header message in Bulk Emailverifier
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        Then I expect that element text "Error Header key not found email" is visible

    Scenario: Validate the user can able to get a tooltip message of Bulk email verifier
        When I click on the element contains text "Switch to Bulk Email Verify"
        Then I expect that element contains text "Create your mailing list and ensure the email addresses are accurate to prevent undeliverable email messages" is visible

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify
        When I add "Mantra.Technologies@gmail.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        Then I expect the free domain error message as "Free domains are not supported"

    Scenario: Validate the user can able to verify whether there is no empty field in Email verifier
        When I add "mantra.technologies" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        Then I expect validation message "Please include an '@' in the email address. 'mantra.technologies' is missing an '@'." for input field "input" matched

    Scenario: Validate the user can able to verify whether an email is correct or not in Email verifier
        When I add "mantra.technologies@" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        Then I expect validation message "Please enter a part following '@'. 'mantra.technologies@' is incomplete." for input field "input" matched

    Scenario: Validate the user can able to verify whether an email is complete or not in Email verifier
        When I add "mantra.technologies@500apps" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        Then I expect error message "Please enter a valid domain" is visible

    Scenario: Validate the user can able to verify whether an email is verified or not in Email verifier
        When I add "mantra.technologies@500apps." into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        Then I expect validation message "'.' is used at a wrong position in '500apps.'." for input field "input" matched

    Scenario: Validate the user can able to verify whether an email is valid in Email verifier
        When I add "mantra@technologies@500apps.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        Then I expect validation message "A part following '@' should not contain the symbol '@'." for input field "input" matched

    Scenario: Validate the user can give duplicate list name in add to list popup
        When I add "preethi.thakur@wipro.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "emailverify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "emailverify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        Then I expect that element text "This list is already exists." is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can give duplicate list name in add to list popup in bulk email verifier
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "30" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "bulkemailverify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "bulkemailverify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        Then I expect that element text "This list is already exists." is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to same list in ADD TO LIST popup
        When I add "preethi.thakur@wipro.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "emailverify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I select the "text" "emailverify" from the dropdown using label "Add the selected Name and Email to the existing lists"
        And  I click on the button using text "Save"
        Then I expect that element text "This contact already exists in the list. Please try with a different list" is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to same list in ADD TO LIST popupin Bulk Email
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "30" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "bulkemailverify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I select the "text" "bulkemailverify" from the dropdown using label "Add the selected Name and Email to the existing lists"
        And  I click on the button using text "Save"
        Then I expect that element text "This contact already exists in the list. Please try with a different list" is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to different list in ADD TO LIST popup
        When I add "preethi.thakur@wipro.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Verify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailverify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to different list in ADD TO LIST popup in Bulk Email verifier
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "30" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "BulkEmail" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Bulkemailverify" into the text field in slide out "modal-add-to-list-email-verify___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can upload 1000 csv file in Bulk Email verifier
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify1000.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "40" seconds
        Then I expect that element text "Email" is visible

    Scenario: Validate the user can upload 2000 csv file in Bulk Email verifier
        When I click on the element contains text "Switch to Bulk Email Verify"
        And  I upload a file "Bulkverify2000.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "50" seconds
        Then I expect that element text "Email" is visible

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify eg: Yahoo.com
        When I add "Mantra.Technologies@yahoo.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify eg: outlook.com
        When I add "Mantra.Technologies@outlook.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for "10" seconds
        Then I expect that element text "Email" is visible

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify eg: ProtonMail.com
        When I add "Mantra.Technologies@protonmail.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify eg: AOL.com
        When I add "Mantra.Technologies@AOL.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify eg: zohomail.com
        When I add "valerian.ruby@zohomail.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Confidence')]" with in "10" seconds
        And  I click on the linktext "Verify"
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify eg: yandex.mail
        When I add "Mantra.Technologies@yandex.mail" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify eg: GMX.com
        When I add "Mantra.Technologies@GMX.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to verify whether free domains are accepted or not in email verify eg: Zoho.mail
        When I add "Mantra.Technologies@zoho.mail" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to verify whether message is displaying for valid and invalid Emails
        When I add "sumit.patel@500apps.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//*[contains(text(),'Search Results')]" with in "30" seconds
        And  I click on the element contains text "Confidence"
        And  I press the RIGHTARROW
        And  I press the RIGHTARROW
        And  I press the RIGHTARROW
        Then I expect that element text "Email exists" is visible
        When I add "valerian.ruby@500apps.com" into the inputfield "Email Address"
        And  I click on the button using text "Verify"
        And  I wait for the element "//*[contains(text(),'Search Results')]" with in "30" seconds
        Then I expect that element text "//span[contains(text(),'Failed')]" does not exist "no"
        Then I expect that element with text "Save" does not exist "yes"
