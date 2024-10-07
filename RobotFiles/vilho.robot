# Testattava tuote: http://jimms.fi
# 3. Löytyykö tuotesivulta (ps5, ensimmäinen tuote joka ilmestyy) linkki "Lisää koriin"
# 4. Löytyykö "Lisää koriin" -linkkiin liittyvä ikoni. Robotti ottaa ikonista kuvankaappauksen.
# 5. Robotti lisää tuotteen ostoskoriin

*** Settings ***
Library   SeleniumLibrary
Library    String

*** Variables ***
${url}    http://jimms.fi
${hakusana}    ps5

*** Test Cases ***
1: Onko kaikilla tuotealueilla "landing page"

    # Test Case ID: 1
    # Test Priority:
    # Module Name: 
    # Test Designed By: Joni Mitronen
    # Test Designed Date: 07-10-2024
    # Test Title: Onko kaikilla tuotealueilla "landing page"
    # Test Summary: 
    # Pre-conditions: 
    # Dependencies:
    # Expected Result:  
    
    Open Browser    ${url}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
        Maximize Browser Window

    Click Element    name:q
    Input Text    name:q    ps5
    Press Keys    name:q    ENTER

    Sleep    5s

    Page Should Contain Element    xpath://a[@title="Lisää koriin"]