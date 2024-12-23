Feature: Company Search module

    Background:
        When I wait for the element "//a[text()=' Company Search ']" with in "10" seconds
        When I click on the element contains text "Company Search"

    Scenario: Validate the user can able to get the results for multiple industries
        When I click on the element contains text "Please select industry"
        And  I click on the element contains text "Art And Entertainment"
        And  I click on "Industry" mutliselect drop down
        And  I click on the element contains text "Automotive And Vehicles"
        And  I click on "Industry" mutliselect drop down
        And  I click on the element contains text "Business And Industrial"
        And  I click on the element contains text "Please select tech spend"
        And  I click on the element contains text "$10 - $1000"
        And  I click on the element contains text "$10 - $1000"
        And  I click on the element contains text "$1000 - $10000"
        And  I click on the button using text "Search"
        When I wait for the element "//button[contains(text(),'Export')]" with in "30" seconds
        Then I expect that element text "1 - 50 of 1000" is visible

    Scenario: Validate the user can navigate to Twitter page
        When I click on the element contains text "Please select industry"
        And  I click on the element contains text "Art And Entertainment"
        And  I click on the element contains text "Please select tech spend"
        And  I click on the element contains text "$10 - $1000"
        And  I click on the element contains text "Twitter"
        And  I click on the button using text "Search"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "15" seconds
        And  I click on "twitter" symbol button
        And  I focus on last opened tab "1"
        And  I wait for the element "//span[normalize-space()='Explore']" with in "5" seconds
        Then I expect that element text "Explore" is visible
        When I close last opened tab
        When I wait for the element "//h2[normalize-space()='Finder.io']" with in "5" seconds
        Then I expect that element text "Finder.io" is visible

    Scenario: Validate the user can navigate to Linkedin page
        When I click on the element contains text "Please select industry"
        And  I click on the element contains text "Art And Entertainment"
        And  I click on the element contains text "Please select tech spend"
        And  I click on the element contains text "$10 - $1000"
        And  I click on the element contains text "Linkedin"
        And  I click on the button using text "Search"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "15" seconds
        And  I click on "linkedin" symbol button
        And  I focus on last opened tab "1"
        And  I close last opened tab
        And  I wait for the element "//h2[normalize-space()='Finder.io']" with in "5" seconds
        Then I expect that element text "Finder.io" is visible

    Scenario: Validate the user can navigate to facebook page
        When I click on the element contains text "Please select industry"
        And  I click on the element contains text "Art And Entertainment"
        And  I click on the element contains text "Please select tech spend"
        And  I click on the element contains text "$10 - $1000"
        And  I click on the element contains text "Facebook"
        And  I click on the button using text "Search"
        And  I wait for the element "//button[contains(text(),'Export')]" with in "15" seconds
        And  I click on "facebook mx-2" symbol button
        And  I focus on last opened tab "1"
        When I close last opened tab
        When I wait for the element "//h2[normalize-space()='Finder.io']" with in "20" seconds
        Then I expect that element text "Finder.io" is visible
