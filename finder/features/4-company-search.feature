Feature: Company Search module

    Background:
        When I click on the element contains text "Company Search"

    Scenario: Validate the user can able to get the results for selected industry
        When I click on the element contains text "Please select industry"
        And  I click on the element contains text "Art And Entertainment"
        And  I click on the button using text "Search"
        And  I wait for the element "//a[@class='cursor-pointer text-secondary mr-4']" with in "10" seconds
        When I scroll till the page up
        Then I expect that element text "Art And Entertainment" is visible

    Scenario: Validate the user can able to find search result count is 50 or not
        When I click on the element contains text "Please select industry"
        And  I click on the element contains text "Art And Entertainment"
        And  I click on the button using text "Search"
        And  I wait for the element "//a[@class='cursor-pointer text-secondary mr-4']" with in "10" seconds
        When I scroll till the page up
        Then I expect that element text "Food And Drink" is visible
        And  I expect that element contains text "1 - 50 of 1000" is visible

    Scenario: Validate the user can use Clear all button in company search
        When I click on the element contains text "Please select industry"
        And  I click on the element contains text "Art And Entertainment"
        And  I click on the element contains text "Please select tech spend"
        And  I click on the element contains text "$10 - $1000"
        And  I click on the button using text "Search"
        And  I wait for the element "//span[text()='Showing']" with in "10" seconds
        And  I scroll till the page up
        When I click on the element contains text "Clear All"
        And  I click on the button using text "Search"
        Then I expect that element text "Please select industry" is visible
        Then I expect that element text "Please select tech spend" is visible
        Then I expect that button text "Clear All" does not exist "yes"

    Scenario: Validate the user can use scroll functionality of the form
        When I click on the element contains text "Please select industry"
        And  I click on the element contains text "Art And Entertainment"
        And  I click on the button using text "Search"
        And  I wait for the element "//span[text()='Showing']" with in "10" seconds
        When I click on the element contains text "Alexa Rank"
        And  I press the DOWNARROW
        And  I press the DOWNARROW
        And  I press the DOWNARROW
        And  I press the DOWNARROW
        And  I press the DOWNARROW
        And  I wait for the element "//span[contains(text(),'1 - 50 of 1000')]" with in "10" seconds
        Then I expect that element contains text "1 - 50 of 1000" is visible

    Scenario: Validate the user can able to get the industry validation
        When I click on the button using text "Search"
        Then I expect that element contains text "Please select industry" is visible
