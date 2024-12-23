Feature: Test All Possible scenarios for finder extensions

    Scenario: Validate add chrome extension for finder
        When I open finder extension html page

    Scenario: Validate "500apps.com" domain search in finder extension with add list of new email
        When I open finder extension html page
        When I click on element contains class "fd-search-btn"
        When I add "500apps.com" into the inputfield "company.com"
        When I click on element contains class "fd-search-btn"
        When I wait for the element "//*[@title='Add to list']" with in "20" seconds
        When I click on element using title "Add to list"
        When I add "test" into the inputfield "Enter name"
        When I add "500appslist" into the inputfield "Enter list name"
        And  I click on the button using text "Add"

    Scenario: Validate "500apps.com" domain search in finder extension with add list of existing list
        When I open finder extension html page
        When I click on element contains class "fd-search-btn"
        When I add "500apps.com" into the inputfield "company.com"
        When I click on element contains class "fd-search-btn"
        When I wait for the element "//*[@title='Add to list']" with in "20" seconds
        When I click on element using title "Add to list"
        When I add "test" into the inputfield "Enter name"
        When I add "500appslist" into the inputfield "Enter list name"
        And  I click on the button using text "Add"

    Scenario: Validate "500apps.com" domain search in finder extension to existing list from select dropdown
        When I open finder extension html page
        When I click on element contains class "fd-search-btn"
        When I add "500apps.com" into the inputfield "company.com"
        When I click on element contains class "fd-search-btn"
        When I wait for the element "//*[@title='Add to list']" with in "20" seconds
        When I click on element using title "Add to list"
        When I add "test" into the inputfield "Enter name"
        When I click on the element contains text "Select an option"
        When I press the ENTER
        And  I click on the button using text "Add"

    Scenario: Validate "tcs.com" domain search in finder extension with add list of new email
        When I open finder extension html page
        When I click on element contains class "fd-search-btn"
        When I add "tcs.com" into the inputfield "company.com"
        When I click on element contains class "fd-search-btn"
        When I wait for the element "//*[@title='Add to list']" with in "20" seconds
        When I click on element using title "Add to list"
        When I add "test" into the inputfield "Enter name"
        When I add "tcslist" into the inputfield "Enter list name"
        And  I click on the button using text "Add"

    Scenario: Validate "tcs.com" domain search in finder extension to existing list from select dropdown
        When I open finder extension html page
        When I click on element contains class "fd-search-btn"
        When I add "tcs.com" into the inputfield "company.com"
        When I click on element contains class "fd-search-btn"
        When I wait for the element "//*[@title='Add to list']" with in "20" seconds
        When I click on element using title "Add to list"
        When I add "test" into the inputfield "Enter name"
        When I click on the element contains text "Select an option"
        When I press the ENTER
        And  I click on the button using text "Add"

    Scenario: Validate the number of added emails count to the list
        When I open "https://infinity.500apps.com/finder" url
        When  I click on the linktext "Lists"
        When I wait for the element "//a[normalize-space()='500appslist']" with in "20" seconds
        Then I expect that element text "500appslist" is visible
        Then I expect that element text "(//div[normalize-space()='2'])['1']" does not exist "no"

    Scenario: Validate the number of added emails count to the list
        When  I click on the linktext "Lists"
        When I wait for the element "//a[normalize-space()='tcslist']" with in "20" seconds
        Then I expect that element text "tcslist" is visible
        Then I expect that element text "(//div[normalize-space()='2'])['1']" does not exist "no"

    Scenario: Validate delete list functionality
        When  I click on the linktext "Lists"
        When I wait for the element "//*[@title='Delete']" with in "20" seconds
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that button text "tcslist" does not exist "no"

    Scenario: Validate delete list functionality
        When  I click on the linktext "Lists"
        When I wait for the element "//*[@title='Delete']" with in "20" seconds
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        Then I expect that button text "500appslist" does not exist "no"


