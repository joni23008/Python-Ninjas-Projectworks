# Testattava tuote: http://jimms.fi
# 1. Onko kaikilla tuotealueilla "landing page"


*** Settings ***
Library   SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${url}    http://jimms.fi
${hakusana}    ps5
@{tuotealueet}
*** Test Cases ***
0: Asetetaan screenshot-kansio
    Set Screenshot Directory    C:\\Users\\jonim\\Documents\\GitHub\\Python-Ninjas-Projectworks\\Screenshots

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
    
    # avaatan browser
    Open Browser    ${url}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    # suurennetaan kokonäytölle
    Maximize Browser Window

    # selvitetään indexi, montako tuotealuetta
    ${count}=    Get Element Count    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]/a                         
    Log    ${count}



    FOR    ${counter}    IN RANGE    1    ${count}+1
        # käydään läpi navigointi palkki ja kategoriat, otetaan ne talteen muuttujiin 
        ${tuotealueet}=    Get Text    xpath=/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${counter}]/a    
        Log    ${tuotealueet}

        # syystä että miten Jimms sivu on suunniteltu, jos tulee vastaan Sim Racing tehdään seuraavaa
        Run Keyword If    '${tuotealueet}' == 'Sim Racing'    Set Global Variable   ${tuotealueet}    SimRacing

        # lopuksi tarkistetaan onko vastaavalla kategorialla linkki ns. landing page. 
        Run Keyword And Continue On Failure    Page Should Contain Link    https://www.jimms.fi/fi/Product/${tuotealueet}
    END
    # suljetaan browser 
    Close Browser