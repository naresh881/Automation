Feature: Lists module

    Background:
        When  I click on the linktext "Lists"

    Scenario: Validate the user can able to create a list
        When I click on the linktext "Add List"
        And  I add "Finder list" into the inputfield "List Name"
        And  I click on create list "Create List" button
        Then I expect that element text "Finder list" is visible

    Scenario: Validate the user can able to edit a list
        When I click on "Edit" icon in a row
        And  I add "Finder_Updatedlist" into the inputfield "List Name"
        And  I click on create list "Update List" button
        Then I expect that element text "Finder_Updatedlist" is visible

    Scenario: Validate the user can able to search with a letter
        When I wait for the element "//a[normalize-space()='Add List']" with in "5" seconds
        And  I click on "search btn btn-sm btn-white cursor-pointer search-unique" icon
        When I add "U" into search field "Search"
        Then I expect that element text "Finder_Updatedlist" is visible

    Scenario: Validate the user can able to Delete a list
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "Finder_Updatedlist" does not exist "yes"

    Scenario: Validate the user can able to Delete a contact from the list
        When I click on the linktext "Domain Search"
        When I add "nike.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//*[contains(text(),'Search Results')]" with in "10" seconds
        Then I expect that element contains text "@nike.com" is visible
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "deletecontact" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I refresh the page
        When I click on the linktext "Lists"
        And  I click on the linktext "deletecontact"
        Then I expect that element contains text "@nike.com" is visible
        Then I expect that element contains text "Domain Search" is visible
        When I click on "Delete" icon in contacts
        And  I click on the button using text "Confirm"
        Then I expect that element text "No Contacts Found!" is visible
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that element with text "deletecontact" does not exist "yes"
