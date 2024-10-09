#  Testattava tuote: http://jimms.fi
#  3. Löytyykö tuotesivulta (ps5, ensimmäinen tuote joka ilmestyy) linkki "Lisää koriin"
#  4. Löytyykö "Lisää koriin" -linkkiin liittyvä ikoni. Robotti ottaa ikonista kuvankaappauksen.
#  5. Robotti lisää tuotteen ostoskoriin

*** Settings ***
Library   SeleniumLibrary
Library    String

*** Variables ***
${url}    http://jimms.fi
${hakusana}    ps5    

*** Test Cases ***
3. Selvitä löytyykö "Lisää ostoskoriin" -painike

    #  Test Case ID: 1
    #  Test Priority:
    #  Module Name: 
    #  Test Designed By: Joni Mitronen
    #  Test Designed Date: 07-10-2024
    #  Test Title: Onko kaikilla tuotealueilla "landing page"
    #  Test Summary: 
    #  Pre-conditions: 
    #  Dependencies:
    #  Expected Result:  
    

    #  Avataan sivusto Chrome -selaimella, jätetään selain auki ja avataan selain kokonäytölle.
    Open Browser    ${url}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window

    #  Klikataan hakupalkkia, kirjoitetaan hakupalkkiin "ps5" ja painetaan näppäimistöltä "Enter" painiketta.
    Click Element    name:q
    Input Text    name:q    ps5
    Press Keys    name:q    ENTER
    Wait Until Element Is Visible    xpath://a[@title="Lisää koriin"]

    #  Testataan löytyykö sivulta "Lisää koriin" -elementti.
    Page Should Contain Element    xpath://a[@title="Lisää koriin"]

4. Luo kuvankaappaukselle hakemisto, ja ota kuvankaappaus tietystä elementistä kyseiseen hakemistoon

    # Testataan löytyykö "Lisää koriin" -elementtiin liittyvä ostoskorin ikoni.
    Page Should Contain Element    xpath://a[@title="Lisää koriin"]//i

    #  Luodaan hakemisto, johon otetaan tietystä elementistä kuvankaappaus.
    Set Screenshot Directory    C:\\Users\\Vilho\\OneDrive\\Desktop\\Gitit\\Python-Ninjas-Projectworks\\Screenshots
    Capture Element Screenshot    xpath://i[@class="material-icon me-1"]    ostoskori.png
    

5. Lisätään tuote ostoskoriin.

    #  Klikataan "Lisää koriin" -elementtiä, jonka jälkeen tuote siirtyy ostoskoriin
    Click Element    xpath://a[@title="Lisää koriin"]
    Sleep    1s

6. Poista tuote ostoskorin "dropdown" -valikosta, klikkaa ostoskori auki ja varmista että ostoskori on tyhjä
    
    Mouse Over    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div/a
    Wait Until Element Is Visible    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div/div/div

    Click Element    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div/div/div/div[1]/article/div[2]/div[2]/div/span[1]
    Sleep    1s

    Click Element    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div/a
    Page Should Contain    Ostoskorisi on tyhjä