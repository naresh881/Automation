Feature: Lists module

    Background:
        When I wait for the element "//a[text()=' Lists ']" with in "10" seconds
        When I click on the linktext "Lists"

    Scenario: Validate the user can save characters as list name
        When I click on the linktext "Add List"
        And  I add "@#$%^" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "@#$%^" is visible
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "@#$%" does not exist "yes"

    Scenario: Validate the user can able to verify whether the maximum limit of list name is 50 characters
        When I click on the linktext "Add List"
        And  I add "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz" does not exist "yes"

    Scenario: Validate the user can save Alphanumerics as list name
        When I click on the linktext "Add List"
        And  I add "ABC123!@#" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "ABC123!@#" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "ABC123!@#" does not exist "yes"

    Scenario: Validate the user can edit Alphanumerics as list name
        When I click on the linktext "Add List"
        And  I add "finder" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "finder" is visible
        When I click on "Edit" icon in a row
        And  I add "ABCD1234!@#$" into the inputfield "List Name"
        And  I click on create list "Update List" button
        Then I expect that element text "ABCD1234!@#$" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "ABCD1234!@#$" does not exist "yes"

    Scenario: Validate the user can edit characters as list name
        When I click on the linktext "Add List"
        And  I add "finderapp" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "finderapp" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Edit" icon in a row
        And  I add "@#$%" into the inputfield "List Name"
        And  I click on create list "Update List" button
        Then I expect that element text "@#$%" is visible
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "@#$%" does not exist "yes"

    Scenario: Validate the user can able to verify whether the maximum limit of edit list name is 50 characters
        When I click on the linktext "Add List"
        And  I add "finder123" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "finder123" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Edit" icon in a row
        And  I add "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz" into the inputfield "List Name"
        And  I click on create list "Update List" button
        Then I expect that element text "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz" does not exist "yes"

    Scenario: Validate the user can view the list name in contacts
        When I click on the linktext "Add List"
        And  I add "Finderapp" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "Finderapp" is visible
        When I wait for the element "//div[normalize-space()='Name']" with in "5" seconds
        When I click on the linktext "Finderapp"
        Then I expect that element text "Contacts" is visible
        Then I expect that element contains text "Showing for List" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Finderapp" does not exist "yes"

    Scenario: Validate the user can able to view created time of list name
        When I click on the linktext "Add List"
        And  I add "Domainsearch" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "Domainsearch" is visible
        Then I expect that element text "Created On" is visible
        Then I expect that element text "a few seconds ago" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Domainsearch" does not exist "yes"

    Scenario: Validate the user can add duplicate list
        When I click on the linktext "Add List"
        And  I add "domainfinder" into the inputfield "List Name"
        And  I click on create list "Create List" button
        When I click on the linktext "Add List"
        And  I add "domainfinder" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect error message as "This list is already exists."
        When I click on element "createListForm" "bi-x b-icon bi" in slide out
        And  I click on the element contains text "Number of Contacts"
        And  I press the RIGHTARROW
        And  I press the RIGHTARROW
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "domain" does not exist "yes"

    Scenario: Validate the user can able to get the validation message when clicked on create list button without giving any data in the fields
        When I click on the linktext "Add List"
        And  I click on create list "Create List" button
        Then I expect validation message "Please fill in this field." for input field "input-listname" matched

    Scenario: Validate the user can able to get the validation message when clicked on Update list button without giving any data in the fields
        When I click on the linktext "Add List"
        And  I add "email@finder" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "email@finder" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Edit" icon in a row
        And  I clear the data using "List Name" from the text field
        And  I click on create list "Update List" button
        Then I expect validation message "Please fill in this field." for input field "input-listname" matched
        When I click on element "createListForm" "bi-x b-icon bi" in slide out
        And  I click on the element contains text "Number of Contacts"
        And  I press the RIGHTARROW
        And  I press the RIGHTARROW
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "email@finder" does not exist "yes"

    Scenario: Validate the user can click on the Cancel button in Lists
        When I click on the linktext "Add List"
        And  I add "finderlist" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "finderlist" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Delete" icon in a row
        And  I click on the button using text "Cancel"
        Then I expect that element text "finderlist" is visible
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "finderlist" does not exist "yes"

    Scenario: Validate the user can able to edit list name after updating
        When I click on the linktext "Add List"
        And  I add "finderlists" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "finderlists" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Edit" icon in a row
        And  I click on create list "Update List" button
        Then I expect that element text "finderlists" is visible
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "finderlists" does not exist "yes"

    Scenario: Validate the user can update duplicate list name
        When I click on the linktext "Add List"
        And  I add "finderapplist" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "finderapplist" is visible
        When I click on the linktext "Add List"
        And  I add "listfinder" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "listfinder" is visible
        When I click on the element contains text "Number of Contacts"
        When I press the RIGHTARROW
        When I press the RIGHTARROW
        When I click on "Edit" icon in a row
        And  I add "finderapplist" into the inputfield "List Name"
        And  I click on create list "Update List" button
        Then I expect error message as "This list is already exists."
        When I click on element "createListForm" "bi-x b-icon bi" in slide out
        And  I click on the element contains text "Number of Contacts"
        And  I press the RIGHTARROW
        And  I press the RIGHTARROW
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "finderapplist" does not exist "yes"

    Scenario: Validate the user can give duplicate list name
        When I click on the linktext "Add List"
        And  I add "findemail" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "findemail" is visible
        When I click on the linktext "Add List"
        And  I add "FINDEMAIL" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect error message as "This list is already exists."
        When I click on element "createListForm" "bi-x b-icon bi" in slide out
        And  I click on the element contains text "Number of Contacts"
        And  I press the RIGHTARROW
        And  I press the RIGHTARROW
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "findemail" does not exist "yes"

    Scenario: Validate the user can able to click on the cancel button in No.of.contacts module
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//button[contains(text(),'Export')]" with in "10" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Domainserach" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        And  I click on the linktext "Domainserach"
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Cancel"
        Then I expect that element text "Email" is visible
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Domainserach" does not exist "yes"

    Scenario: Validate the user can able to get the count of No.of.contacts
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "10" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Domain123" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        Then I expect that element text "1" is visible
        When I click on the linktext "Domain123"
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        Then I expect that element text "0" is visible
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Domain123" does not exist "yes"

    Scenario: Validate the user can search with invalid character in lists
        When I click on the linktext "Add List"
        And  I add "Finderlistapp" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "Finderlistapp" is visible
        When I click on "search btn btn-sm btn-white cursor-pointer search-unique" icon
        And  I add "#" into search field "Search"
        Then I expect that element text "No Results Found" is visible
        When I press "BACKSPACE"
        And  I wait for the element "//div[normalize-space()='Name']" with in "5" seconds
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Finderlistapp" does not exist "yes"

    Scenario: Validate the user can search with invalid character in contacts
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "10" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Updatedlist" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        And  I click on the linktext "Lists"
        And  I click on the linktext "Updatedlist"
        When I click on "search btn btn-sm btn-white cursor-pointer search-unique" icon
        And  I add "#" into search field "Email"
        Then I expect that element text "No Results Found" is visible
        When I press "BACKSPACE"
        And  I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Updatedlist" does not exist "yes"

    Scenario: Validate the user can give spaces as list name
        When I click on the linktext "Add List"
        And  I add "       " into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "This field is required." is visible

    Scenario: Validate the user can Edit list by give spaces as list name
        When I click on the linktext "Add List"
        And  I add "Finder" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "Finder" is visible
        When I click on "Edit" icon in a row
        And  I add "       " into the inputfield "List Name"
        And  I click on create list "Update List" button
        Then I expect that element text "This field is required." is visible
        When I click on element "createListForm" "bi-x b-icon bi" in slide out
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Finder" does not exist "yes"

    Scenario: Validate the user can give spaces as list name in Add to list popup
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "10" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "      " into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        Then I expect that element text "This field is required." is visible

    Scenario: Validate the user can view the validation message even after closing the Add List popup
        When I click on the linktext "Add List"
        And  I add "       " into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "This field is required." is visible
        When I press the TAB
        When I press the ENTER
        And  I click on the linktext "Add List"
        Then I expect that element with text "This field is required." does not exist "yes"

    Scenario: Validate the user can give special characters as list name in Add to list popup
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[contains(text(),'Search Results')]" with in "15" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "@#$%" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I wait for the element "//*[contains(text(),'Search Results')]" with in "1" seconds
        And  I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "@#$%" does not exist "yes"

    Scenario: Validate the user can give special characters as list name in Add to list popup in Bulk Domain Search
        When I click on the linktext "Domain Search"
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "25" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "@#$%&" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I wait for the element "//*[contains(text(),'Search Results')]" with in "1" seconds
        And  I scroll till the page up
        When I click on the linktext "Lists"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "@#$%&" does not exist "yes"

    Scenario: Validate the user can give Alphanumerics as list name in Add to list popup
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[contains(text(),'Search Results')]" with in "15" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "@#$%1234ABCD" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I wait for the element "//*[contains(text(),'Search Results')]" with in "1" seconds
        And  I scroll till the page up
        When I click on the linktext "Lists"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "@#$%1234ABCD" does not exist "yes"

    Scenario: Validate the user can give Alphanumerics as list name in Add to list popup in Bulk Domain Search
        When I click on the linktext "Domain Search"
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "25" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "@#$%1234ABCD" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I wait for the element "//*[contains(text(),'Search Results')]" with in "1" seconds
        And  I scroll till the page up
        When I click on the linktext "Lists"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "@#$%1234ABCD" does not exist "yes"
