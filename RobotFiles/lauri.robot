# Testattava tuote: http://jimms.fi
# 2. Testaa hakutoimintoa tuotteen pääsivulta (hakusana ps5)
    #- robotti ottaa kuvankaappauksen ensimmäisestä tuotteesta
    #- robotti menee tuotteen tuotesivulle
    #- robotti tarkastaa, että on oikealla tuotesivulla ja haku täsmää joltain osin annettuun hakusanaan
# Extra. kirjaudu ja tarkastele ostoshistoriaa
# Extra. Haun "ps5" järjestäminen vaikka hinnan mukaan. ota kuva halvimmasta tuotteesta.

*** Settings ***
Library   SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${url}    http://jimms.fi
${hakusana}    ps5

*** Test Cases ***
0: Asetetaan screenshot-kansio
    Set Screenshot Directory    C:\\Users\\latel\\Documents\\GitHub\\Python-Ninjas-Projectworks\\Screenshots
2.1 Testaa hakutoimintoa tuotteen pääsivulta (hakusana ps5)
    
    Open Browser    ${url}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window
    
    Click Element    name:q
    Input Text    name:q    ${hakusana}
    Press Keys    name:q    ENTER

2.2 Kuvankaappaus ensimmäisestä tuotteesta
    Wait Until Element Is Visible    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img
    Capture Element Screenshot    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img    Ensimmäinen_tuote.png

2.3 Menee tuotteen tuotesivulle
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[2]/h5/a/span

2.4 robotti tarkastaa, että on oikealla tuotesivulla ja haku täsmää joltain osin annettuun hakusanaan
    ${expected_url}=    Get Location
    Location Should Be    ${expected_url}
    ${hakusana}    Convert To Upper Case    ${hakusana}
    Should Be Equal    ${hakusana}    PS5
    Page Should Contain    ${hakusana}


Haku ps5 ja järjestäminen hinnan mukaan ja kuvan kaappaus halvimmasta tuotteesta
    Click Element    xpath:/html/body/header/div/div[2]/div/a/picture/img
    Click Element    name:q
    Input Text    name:q    ${hakusana}
    Press Keys    name:q    ENTER

Järjestäminen hinnan mukaan ja kuvan kaappaus
    Wait Until Element Is Visible    xpath:/html/body/main/div[2]/div/div[2]/div[3]/div/div/div[1]/div/button/span
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[3]/div/div/div[1]/div/button/span
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[3]/div/div/div[1]/div/ul/li[7]/a
    Wait Until Element Is Visible    xpath:/html/body/main/div[2]/div/div[2]
    Capture Element Screenshot    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img    Halvin_tuote.png

Kirjaudu verkkosivulle
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a/span
    
    Click Element    name:UserName
    Input Text    name:UserName    lauri23008@student.hamk.fi
    # salasana sijaitsee koneessa environmental variables johon voi laittaa salasanan piiloon jotta salasana ei näy kovakoodattuna
    # koodi pääsee käsiksi sinne komennolla 'Get Environment Variable' joka hakee keywordillä tässä tapauksessa 'PASSWORD'
    # Keywordin PASSWORD takana on sitten kyseinen salasana joka syötetään haluttuun paikkaan joka määritelty koodissa
    ${Password}=    Get Environment Variable    PASSWORD
    Click Element    name:Password
    Input Password    name:Password    ${Password}
    
    Click Element    xpath:/html/body/main/div/div[2]/div[1]/div/div/div/form/div[4]/input

Katsele ostoshistoriaa
    Wait Until Page Contains    Lauri
    Mouse Over    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a/span
    Wait Until Element Is Visible    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/ul
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/ul/li[2]/a
    Page Should Contain Button    xpath:/html/body/main/div[2]/div/div/div[1]/button[1]
    Capture Page Screenshot    ostoshistoria.png