Feature: Domain Search module

    Background:
        When I wait for the element "//a[text()='Domain Search']" with in "10" seconds

    Scenario: Validate the user can use Reset button in the bulk Domain search
        When I click on the linktext "Domain Search"
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//tbody/tr" with in "25" seconds
        Then I expect that element contains text "Export" is visible
        When I scroll till the page up
        And  I click on the button with text "Reset"
        Then I expect that element with text "BulkDS50.csv" does not exist "yes"

    Scenario: Validate the user can verify error header message in Bulk domain search
        When I click on the linktext "Domain Search"
        And  I click on the element contains text "Bulk Domain Search"
        And  I upload a file "Bulkverify50.csv" in "finder" app using class "file-input"
        Then I expect that element text "Error Header key not found domain" is visible

    Scenario: Validate the user can verify the tooltip message of Bulkdomain search.
        When I click on the linktext "Domain Search"
        And  I click on the element contains text "Bulk Domain Search"
        Then I expect that element text "The bulk domain search option allows you to scrape more websites at once" is visible

    Scenario: Validate the user can give a website link in Domain Search
        When I click on the linktext "Domain Search"
        When I add "http://www.exxonmobil.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "15" seconds
        Then I expect that element text "Search Results" is visible
        Then I expect that element contains text "@exxonmobil.com" is visible

    Scenario: Validate the user can give Alphanumerics as domain in domain search
        When I click on the linktext "Domain Search"
        And  I add "123Abc!#$.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        Then I expect error message "Please enter a valid domain" is visible

    Scenario: Validate the user can give combination of uppercase and lowercase letters can given as domain in domain search
        When I click on the linktext "Domain Search"
        And  I add "AaBbCcDd.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "5" seconds
        Then I expect that element text "Search Results" is visible

    Scenario: Validate the user can give Uppercase letters as domain name
        When I click on the linktext "Domain Search"
        And  I add "BERKSHIREHATHAWAY.COM" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "5" seconds
        Then I expect that element text "Search Results" is visible

    Scenario: Validate the user can able to see results after clearing data in domain search
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for "10" seconds
        And  I clear the data using "Enter Domain Name (eg: 500apps.com)" from the text field
        Then I expect that element with text "Search Results" does not exist "no"

    Scenario: Validate the user can able to get error message if special characters are given as domain in domain search
        When I click on the linktext "Domain Search"
        And  I add "#$%&*&*.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        Then I expect error message "Please enter a valid domain" is visible

    Scenario: Validate the user can able to get error message for invalid domains
        When I click on the linktext "Domain Search"
        And  I add "mantra" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        Then I expect error message "Please enter a valid domain" is visible

    Scenario: Validate the user can able to get error message for invalid domains in domain search
        When I click on the linktext "Domain Search"
        And  I add "500apps" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        Then I expect error message "Please enter a valid domain" is visible

    Scenario: Validate the user can give numbers as domain in domain search
        When I click on the linktext "Domain Search"
        And  I add "1234567.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "5" seconds
        Then I expect that element text "Search Results" is visible

    Scenario: Validate the user can give maximum range of characters in Domain Search
        When I click on the linktext "Domain Search"
        And  I add "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        Then I expect error message "Please enter a valid domain" is visible
        When I clear the data using "Enter Domain Name (eg: 500apps.com)" from the text field
        And  I add "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//h1[normalize-space()='No results found']" with in "15" seconds
        Then I expect that element text "No results found" is visible

    Scenario: Validate the user can give IP address in Domain name
        When I click on the linktext "Domain Search"
        When I add "69.63.181.15" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//h1[normalize-space()='No results found']" with in "15" seconds
        Then I expect that element text "No results found" is visible

    Scenario: Validate the user can give duplicate list name in add to list popup
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "15" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Domain" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Source"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Domain" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        Then I expect that element text "This list is already exists." is visible
        When I click on the button using text "×"
        And  I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can give duplicate list name in add to list popup for bulk domain search
        When I click on the linktext "Domain Search"
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "25" seconds
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        And  I pass data "BulkDomain" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Source"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "BulkDomain" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        Then I expect that element text "This list is already exists." is visible
        When I click on the button using text "×"
        When I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        And  I click on the linktext "Lists"
        And  I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to same list in ADD TO LIST popup
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "15" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Domain" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Source"
        When I click on the linktext "Save"
        And  I select the "text" "Domain" from the dropdown using label "Add the selected Name and Email to the existing lists"
        And  I click on the button using text "Save"
        Then I expect that element text "This contact already exists in the list. Please try with a different list" is visible
        When I click on the button using text "×"
        When I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to same list in ADD TO LIST popupin Bulk domain search
        When I click on the linktext "Domain Search"
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "25" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "BulkDomain" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Source"
        And  I click on the linktext "Save"
        And  I select the "text" "BulkDomain" from the dropdown using label "Add the selected Name and Email to the existing lists"
        And  I click on the button using text "Save"
        Then I expect that element text "This contact already exists in the list. Please try with a different list" is visible
        When I click on the button using text "×"
        When I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to different list in ADD TO LIST popup
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "15" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Domain" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Source"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "Finder" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        When I wait for the element "//*[normalize-space()='Search Results']" with in "5" seconds
        And  I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can save a same contact to different list in ADD TO LIST popup in Bulk domain search
        When I click on the linktext "Domain Search"
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "25" seconds
        When I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "BulkDomain" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        And  I wait for the element "//a[normalize-space()='Save']" with in "5" seconds
        And  I click on the element contains text "Source"
        And  I click on the linktext "Save"
        And  I click on the linktext "Create New"
        When I pass data "BulkDomainsearch" into the text field in slide out "modal-add-to-list-domain-search___BV_modal_content_" using placeholder "List Name"
        And  I click on "Add to List" label "Create List" button with index number "4"
        And  I click on the button using text "Save"
        Then I expect that element text "Saved" is visible
        When I wait for the element "//*[normalize-space()='Search Results']" with in "1" seconds
        And  I scroll till the page up
        And  I wait for the element "//a[normalize-space()='Lists']" with in "5" seconds
        When I click on the linktext "Lists"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"
        When I click on "Delete" icon in a row
        And  I click on the button using text "Confirm"

    Scenario: Validate the user can upload 1000 csv file in Bulk Domain search
        When I click on the linktext "Domain Search"
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS1000.csv" in "finder" app using class "file-input"
        And  I wait for the element "//button[normalize-space()='Export']" with in "35" seconds
        Then I expect that element text "Search Results" is visible

    Scenario: Validate the user can upload 2000 csv file in Bulk Domain search
        When I click on the linktext "Domain Search"
        When I click on the element contains text "Bulk Domain Search"
        And  I upload a file "BulkDS2000.csv" in "finder" app using class "file-input"
        When I wait for the element "//button[normalize-space()='Export']" with in "50" seconds
        Then I expect that element text "Search Results" is visible

    Scenario: Validate the user can get error message for free domain eg: Yahoo.com
        When I click on the linktext "Domain Search"
        When I add "yahoo.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for "10" seconds
        Then I expect that element contains text "Search Results" is visible
        Then I expect that element text "Search Results" is visible

    Scenario: Validate the user can get error message for free domain eg: Outlook.com
        When I click on the linktext "Domain Search"
        When I add "outlook.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "Search Results" is visible
        Then I expect that element contains text "Email" is visible

    Scenario: Validate the user can get error message for free domain eg: ProtonMail.com
        When I click on the linktext "Domain Search"
        When I add "protonmail.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "Search Results" is visible
        Then I expect that element contains text "50 Emails found" is visible

    Scenario: Validate the user can get error message for free domain eg: AOL.com
        When I click on the linktext "Domain Search"
        When I add "AOL.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//*[normalize-space()='Email']" with in "30" seconds
        Then I expect that element contains text "No results found" is visible

    Scenario: Validate the user can get error message for free domain eg: zohomail.com
        When I click on the linktext "Domain Search"
        When I add "zohomail.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "Search Results" is visible
        Then I expect that element contains text "50 Emails found" is visible

    Scenario: Validate the user can get error message for free domain eg: yandex.mail
        When I click on the linktext "Domain Search"
        When I add "yandex.mail" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "Search Results" is visible
        Then I expect that element contains text "21 Emails Found" is visible

    Scenario: Validate the user can get error message for free domain eg: GMX.com
        When I click on the linktext "Domain Search"
        When I add "GMX.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "Search Results" is visible
        Then I expect that element contains text "Email" is visible

    Scenario: Validate the user can get error message for free domain eg: zoho.mail
        When I click on the linktext "Domain Search"
        When I add "zoho.mail" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        When I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "Search Results" is visible
        Then I expect that element contains text "2 Emails Found" is visible

    Scenario: Validate the user can able to add finder.io extension
        When I click on the linktext "Domain Search"
        And  I click on the button using text "Add Chrome Extension"
        When I wait for the element "//span[@class='d-none d-xl-block ml-1']" with in "5" seconds
        Then I expect that element text "Finder.io by 500Apps, Chrome Extensions" is visible

    Scenario: Validate the user can see clear all button for invalid domains or not
        When I click on the linktext "Domain Search"
        And  I add "wipro" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        Then I expect that element with text "Clear All" does not exist "yes"

    Scenario: Validate the user can get emails for gm.com, ge.com, pg.com
        When I click on the linktext "Domain Search"
        And  I add "gm.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "50 Emails found" is visible
        When I click on the element contains text "Clear All"
        And  I add "ge.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "50 Emails found" is visible
        When I click on the element contains text "Clear All"
        And  I add "pg.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "50 Emails found" is visible

    Scenario: Validate the user can get pagination for empty pages or not
        When I click on the linktext "Domain Search"
        And  I add "wipro.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//tr//h5" with in "20" seconds
        Then I expect that element contains text "50 Emails found" is visible
        When I scroll till the page down
        Then I expect that element text "Next" is visible
        When I click on the button with text "Clear All"
        And  I add "wipro.come" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//span[contains(text(),'Clear All')]" with in "5" seconds
        Then I expect that element contains text "No results found" is visible

    Scenario: Validate the user can give space as character in domain search
        When I click on the linktext "Domain Search"
        And  I add "     " into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        Then I expect that element with text "Please fill in this field." does not exist "yes"

    Scenario: Validate the user can get same category filters if applied for different bulk searches
        When I click on the linktext "Domain Search"
        And  I wait for the element "//small[normalize-space()='Switch to Bulk Domain Search']" with in "5" seconds
        And  I click on the element contains text "Switch to Bulk Domain Search"
        And  I upload a file "BulkDS50.csv" in "finder" app using class "file-input"
        And  I wait for "15" seconds
        When I select category "text" "Generic" in domainsearch
        Then I expect that element text "Generic" is visible
        When I scroll till the page up
        And  I click on the button with text "Reset"
        Then I expect that element with text "BulkDS50.csv" does not exist "yes"
        When I upload a file "BulkDS100.csv" in "finder" app using class "file-input"
        And  I wait for the element "//td[normalize-space()='Save']" with in "15" seconds
        Then I expect that element text "All Types" is visible

    Scenario: Validate the user can verify whether different page is displaying for every new domain search
        When I click on the linktext "Domain Search"
        And  I add "agilecrm.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//a[normalize-space()='Next']" with in "30" seconds
        And  I click on the linktext "Next"
        Then I expect that element text "2" is visible
        When I scroll till the page up
        And  I add "500apps.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//a[normalize-space()='Next']" with in "30" seconds
        Then I expect that element text "1" is visible

    Scenario: Validate the user can get same Crm integration app to save contact which is added in Apps module
        When I click on the linktext "Apps"
        And  I click on toggle button "Agile CRM"
        And  I wait for the element "//h4[normalize-space()='My Apps']" with in "2" seconds
        And  I add "user01@yopmail.com" into the inputfield using Id "form_input_email"
        And  I add "dj3fke6eq4gte30bju6m1vtskg" into the inputfield using Id "form_input_api_key"
        And  I add "durgaprasad" into the inputfield using Id "form_input_domain"
        And  I click on the button using text "Save"
        And  I wait for "10" seconds
        Then I expect that element text "Agile CRM" is visible
        When I wait for the element "//a[normalize-space()='Domain Search']" with in "2" seconds
        And  I click on the linktext "Domain Search"
        And  I add "500apps.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I wait for the element "//button[normalize-space()='Domain Search']" with in "15" seconds
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//td[normalize-space()='Save']" with in "15" seconds
        And  I click on the linktext "Save"
        And  I wait for "5" seconds
        Then I expect that element text "Agile CRM" is visible
        When I click on the button using text "×"
        When I click on the linktext "Apps"
        And  I click on the button using "Agile CRM"
        And  I click on the options "trash" under my apps "Agile CRM"
        And  I click on the button using text "Confirm"
        Then I expect that element text "//h5[text()='Agile CRM']" does not exist "yes"

    Scenario: Validate the user can give .co.in domains as valid domains
        When I click on the linktext "Domain Search"
        And  I add "sbi.co.in" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "30" seconds
        Then I expect that element contains text "50 Emails found" is visible
        When I add "derbyacappella.co.uk" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//span[contains(text(),'Clear All')]" with in "30" seconds
        Then I expect that element contains text "No results found" is visible

    Scenario: Validate the user can able to get Common pattern for domains like hostpapa.ca
        When I click on the linktext "Domain Search"
        And  I add "hostpapa.ca" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//span[@class='mr-1 text-dark font-weight-bold']" with in "30" seconds
        Then I expect that element text "Cannot find" is visible

    Scenario: Validate the user can able to verify whether there are no empty paginations for Bulk domain Search
        When I wait for the element "//small[normalize-space()='Switch to Bulk Domain Search']" with in "5" seconds
        And  I click on the element contains text "Switch to Bulk Domain Search"
        And  I upload a file "BulkDS10.csv" in "finder" app using class "file-input"
        And  I click on the linktext "Next"
        And  I click on the linktext "Next"
        Then I expect that element text "//button[aria-label='Go to page 4']" does not exist "yes"

    Scenario: Validate the user can able to verify whether Save button is enabled for valid emails in bulk domain search
        When I click on the linktext "Domain Search"
        And  I wait for the element "//small[normalize-space()='Switch to Bulk Domain Search']" with in "5" seconds
        And  I click on the element contains text "Switch to Bulk Domain Search"
        And  I upload a file "BulkDS10.csv" in "finder" app using class "file-input"
        And  I wait for the element "//td[normalize-space()='Save']" with in "15" seconds
        Then I expect that element text "Save" is visible

    Scenario: Validate the user can able to verify whether Clear all button is disabled untill search results are loaded
        When I click on the linktext "Domain Search"
        And  I add "livetrucking.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        Then I expect that element with text "Clear All" does not exist "yes"
        When I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "30" seconds
        Then I expect that element contains text "6 Emails Found" is visible
        Then I expect that element text "Clear All" is visible

    Scenario: Validate the user can able to verify whether filters are applying and displaying accurate results for domain search
        When I click on the linktext "Domain Search"
        And  I add "phillips66.com" into the inputfield "Enter Domain Name (eg: 500apps.com)"
        And  I click on the button using text "Domain Search"
        And  I wait for the element "//*[normalize-space()='Search Results']" with in "30" seconds
        When I select category "text" "Generic" in domainsearch
        Then I expect that element text "Generic" is visible
        When I select category "text" "Work" in domainsearch
        Then I expect that element text "Work" is visible