# Testattava tuote: http://jimms.fi
# 2. Testaa hakutoimintoa tuotteen pääsivulta (hakusana ps5)
    #- robotti ottaa kuvankaappauksen ensimmäisestä tuotteesta
    #- robotti menee tuotteen tuotesivulle
    #- robotti tarkastaa, että on oikealla tuotesivulla ja haku täsmää joltain osin annettuun hakusanaan

*** Settings ***
Library   SeleniumLibrary
Library    String

*** Variables ***
${url}    http://jimms.fi
${hakusana}    PS5

*** Test Cases ***
0: Asetetaan screenshot-kansio
    Set Screenshot Directory    C:\\Users\\latel\\Documents\\GitHub\\Python-Ninjas-Projectworks\\Screenshots
2. Testaa hakutoimintoa tuotteen pääsivulta (hakusana ps5)

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
    Sleep    2

Kuvankaappaus ensimmäisestä tuotteesta
    Capture Element Screenshot    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img    Ensimmäinen_tuote.png

Menee tuotteen tuotesivulle
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[2]/h5/a/span

robotti tarkastaa, että on oikealla tuotesivulla ja haku täsmää joltain osin annettuun hakusanaan
    Page Should Contain    ${hakusana}