# Testattava tuote: http://jimms.fi
# 1. Onko kaikilla tuotealueilla "landing page"


*** Settings ***
Library   SeleniumLibrary
Library    String

*** Variables ***
${url}    http://jimms.fi
${hakusana}    ps5
@{tuotealueet}=    Tietokoneet    Komponentit    Oheislaitteet    Pelaaminen    SimRacing      Verkkotuotteet    Tarvikkeet    Erikoistuotteet    Ohjelmistot    Palvelut    Kampanjat

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
    
    # loopataan tuotealueet lista ja katsotaan onko linkki olemassa.
    FOR    ${tuotealue}    IN    @{tuotealueet}

        Run Keyword And Continue On Failure    Page Should Contain Link    https://www.jimms.fi/fi/Product/${tuotealue}

    END

    