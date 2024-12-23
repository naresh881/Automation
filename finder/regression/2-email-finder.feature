Feature: Email Finder module

    Background:
        When I wait for the element "//a[text()='Email Finder']" with in "10" seconds

    Scenario: Validate the user can able to get error header message in Bulk Email finder
        When I click on the linktext "Email Finder"
        And  I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        Then I expect that element text "Error Header key not found first" is visible

    Scenario: Validate the user can get the tooltip message of Bulk email finder
        When I click on the linktext "Email Finder"
        And  I click on the element contains text "Bulk Email Finder"
        Then I expect that element text "Save time by getting qualified bulk prospects from companies and websites with a single click" is visible

    Scenario: Validate the user can able to verify whether there is no empty field in Email finder
        When I click on the linktext "Email Finder"
        And  I add "mantra" into the inputfield "First Name"
        And  I add "technologies" into the inputfield using Id "input-last"
        And  I click on the button using text "Find"
        Then I expect validation message "Please fill in this field." for input field "input-domain" matched

    Scenario: Validate the user can able to verify whether there is no empty field in Email finder
        When I click on the linktext "Email Finder"
        And  I add "mantra" into the inputfield "First Name"
        And  I add "studiob.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        Then I expect validation message "Please fill in this field." for input field "input-last" matched

    Scenario: Validate the user can able to verify whether there is no empty field in Email finder
        When I click on the linktext "Email Finder"
        And  I add "mantra" into the inputfield "First Name"
        And  I add "technologies" into the inputfield using Id "input-last"
        And  I add "#$%.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        Then I expect error message "Please enter a valid domain" is visible

    Scenario: Validate the user can able to get a free domains message for Email Finder
        When I click on the linktext "Email Finder"
        And  I add "valerian" into the inputfield "First Name"
        And  I add "devyn" into the inputfield using Id "input-last"
        And  I add "gmail.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "5" seconds
        Then I expect that element text "Free domains are not supported" is visible

    Scenario: Validate the user can give IP address in email finder
        When I click on the linktext "Email Finder"
        And  I add "rajesh" into the inputfield "First Name"
        And  I add "uttangi" into the inputfield using Id "input-last"
        And  I add "69.63.181.15" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "30" seconds
        Then I expect that element text "We cannot find any active mail server" is visible

    Scenario: Validate the user can give duplicate list name in add to list popup
        When I click on the linktext "Email Finder"
        And  I add "David" into the inputfield "First Name"
        And  I add "Rogelberg" into the inputfield using Id "input-last"
        And  I add "studiob.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "15" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailfinder" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailfinder" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        Then I expect that element text "This list is already exists." is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can give duplicate list name in add to list popup for bulk email finder
        When I click on the linktext "Email Finder"
        And  I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "30" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Bulkemailfinder" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Bulkemailfinder" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        Then I expect that element text "This list is already exists." is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to same list in ADD TO LIST popup
        When I click on the linktext "Email Finder"
        And  I add "David" into the inputfield "First Name"
        And  I add "Rogelberg" into the inputfield using Id "input-last"
        And  I add "studiob.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "15" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailfinder" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I select the "text" "Emailfinder" from the dropdown using label "Add the selected Name and Email to the existing lists"
        And  I click on the button using text "Save"
        Then I expect that element text "This contact already exists in the list. Please try with a different list" is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to same list in ADD TO LIST popupin Bulk Email Finder
        When I click on the linktext "Email Finder"
        And  I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "30" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Bulkemailfinder" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I select the "text" "Bulkemailfinder" from the dropdown using label "Add the selected Name and Email to the existing lists"
        And  I click on the button using text "Save"
        Then I expect that element text "This contact already exists in the list. Please try with a different list" is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to different list in ADD TO LIST popup
        When I click on the linktext "Email Finder"
        And  I add "David" into the inputfield "First Name"
        And  I add "Rogelberg" into the inputfield using Id "input-last"
        And  I add "studiob.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//td[normalize-space()='Email exists']" with in "10" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Emailfinder" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Finderemail" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to different list in ADD TO LIST popup in Bulk Email finder
        When I click on the linktext "Email Finder"
        And  I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "25" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Bulkemail" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Message"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Bulkemailfinder" into the text field in slide out "modal-add-to-list-email-finder___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I scroll till the page up
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can upload 1000 csv file in Bulk Email finder
        When I click on the linktext "Email Finder"
        And  I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind1000.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "40" seconds
        Then I expect that element text "Email" is visible

    Scenario: Validate the user can upload 2000 csv file in Bulk Email finder
        When I click on the linktext "Email Finder"
        And  I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind2000.csv" in "finder" app using class "file-input"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "110" seconds
        Then I expect that element text "Email" is visible

    Scenario: Validate the user can able to get a free domains message for Email Finder eg: Yahoo.com
        When I click on the linktext "Email Finder"
        And  I add "valerian" into the inputfield "First Name"
        And  I add "devyn" into the inputfield using Id "input-last"
        And  I add "yahoo.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to get a free domains message for Email Finder eg: outlook.com
        When I click on the linktext "Email Finder"
        And  I add "ruby" into the inputfield "First Name"
        And  I add "david" into the inputfield using Id "input-last"
        And  I add "outlook.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to get a free domains message for Email Finder eg: ProtonMail.com
        When I click on the linktext "Email Finder"
        And  I add "valerian" into the inputfield "First Name"
        And  I add "devyn" into the inputfield using Id "input-last"
        And  I add "protonmail.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "20" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to get a free domains message for Email Finder eg: AOL.com
        When I click on the linktext "Email Finder"
        And  I add "valerian" into the inputfield "First Name"
        And  I add "devyn" into the inputfield using Id "input-last"
        And  I add "AOL.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to get a free domains message for Email Finder eg: zohomail.com
        When I click on the linktext "Email Finder"
        And  I add "valerian" into the inputfield "First Name"
        And  I add "devyn" into the inputfield using Id "input-last"
        And  I add "zohomail.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element text "Email exists" is visible

    Scenario: Validate the user can able to get a free domains message for Email Finder eg: yandex.mail
        When I click on the linktext "Email Finder"
        And  I add "valerian" into the inputfield "First Name"
        And  I add "devyn" into the inputfield using Id "input-last"
        And  I add "yandex.mail" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to get a free domains message for Email Finder eg: GMX.com
        When I click on the linktext "Email Finder"
        And  I add "ruby" into the inputfield "First Name"
        And  I add "andrew" into the inputfield using Id "input-last"
        And  I add "gmx.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element text "Email exists" is visible

    Scenario: Validate the user can able to get a free domains message for Email Finder eg: zoho.mail
        When I click on the linktext "Email Finder"
        And  I add "ruby" into the inputfield "First Name"
        And  I add "andrew" into the inputfield using Id "input-last"
        And  I add "zoho.mail" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I wait for the element "//div[contains(text(),'Email')]" with in "10" seconds
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to get a validation message if searched without .com, .in
        When I click on the linktext "Email Finder"
        And  I add "ruby" into the inputfield "First Name"
        And  I add "valerian" into the inputfield using Id "input-last"
        And  I add "walmart" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        And  I click on the button using text "Find"
        Then I expect error message "Please enter a valid domain" is visible

    Scenario: Validate the user can able to verify whether Save button is enabled for valid emails in bulk email finder
        When I click on the linktext "Email Finder"
        And  I click on the element contains text "Bulk Email Finder"
        And  I upload a file "Bulkfind50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "25" seconds
        And  I click on the linktext "Save"
        Then I expect that element text "Add to List" is visible

    Scenario: Validate the user can able to verify whether Save button is enabled for valid emails
        When I click on the linktext "Email Finder"
        And  I add "allen" into the inputfield "First Name"
        And  I add "peacock" into the inputfield using Id "input-last"
        And  I add "mckesson.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        Then I expect that element text "Save" is visible

    Scenario: Validate the user can able to verify whether Save button is disabled for invalid emails
        When I click on the linktext "Email Finder"
        And  I add "ruby" into the inputfield "First Name"
        And  I add "valerian" into the inputfield using Id "input-last"
        And  I add "mckesson.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        Then I expect that element with text "Save" does not exist "yes"

    Scenario: Validate the user can able to verify whether Search results button is displaying or not
        When I click on the linktext "Email Finder"
        And  I add "neil" into the inputfield "First Name"
        And  I add "ryan" into the inputfield using Id "input-last"
        And  I add "walmart.com" into the inputfield using Id "input-domain"
        And  I click on the button using text "Find"
        Then I expect that element text "Search Results" is visible
