# Testattava tuote: http://jimms.fi
# 1. Onko kaikilla tuotealueilla "landing page".
# 2. Jokaisen tuotealueen "landing pagelta" pääsee takaisin pääsivulle ja toisten tuotealueiden "landing pageille".
# 3. Yhteystiedot sivulta löytyy yhteystiedot (sähköposti ja puhelinnumero).
# Havainnot: Kampanjat-tuotealueella ei ole "landing pagea" eikä linkkiä (väärästä linkistä Jimms tarjoaa hyvän error sivun kuitenkin). Bugeja ei ollut.
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

1: Onko kaikilla tuotealueilla "landing page".
    # Test Case ID: 1
    # Test Priority: High
    # Module Name: Product Landing Pages
    # Test Designed By: Joni Mitronen 
    # Test Designed Date: 07-10-2024
    # Test Title: Onko kaikilla tuotealueilla "landing page".
    # Test Summary: Tarkistetaan, että jokaisella tuotealueella on toimiva "landing page", johon pääsee navigoimalla pääsivulta.
    # Pre-conditions: Verkkosivusto on saatavilla ja navigointipalkki on näkyvissä.
    # Dependencies: SeleniumLibrary
    # Expected Result: Kaikilla tuotealueilla on toimiva linkki, joka ohjaa käyttäjän vastaavalle "landing page" -sivulle.
    
    # avataan browser
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


2. Jokaisen tuotealueen "landing pagelta" pääsee takaisin pääsivulle ja toisten tuotealueiden "landing pageille".
    # Test Case ID: 2
    # Test Priority: High
    # Module Name: Product Navigation
    # Test Designed By: Joni Mitronen 
    # Test Designed Date: 07-10-2024
    # Test Title: Jokaisen tuotealueen "landing pagelta" pääsee takaisin pääsivulle ja toisten tuotealueiden "landing pageille".
    # Test Summary: Varmistetaan, että jokaiselta "landing page" -sivulta pääsee takaisin pääsivulle sekä muihin tuotealueiden "landing page" -sivuille.
    # Pre-conditions: Verkkosivusto on saatavilla ja navigointipalkki on näkyvissä.
    # Dependencies: SeleniumLibrary
    # Expected Result: Käyttäjä pystyy navigoimaan takaisin pääsivulle ja siirtymään toisten tuotealueiden "landing page" -sivuille ilman virheitä.

    # avataan browser
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
        # vaihtoehtoinen tapa navigoida suoraan linkkiin
        Run Keyword And Continue On Failure    Go To    https://www.jimms.fi/fi/Product/${tuotealueet}
        # nuku
        Sleep    0.5s
        # ota screenshot landing pagesta 
        Capture Page Screenshot    ${tuotealueet}.png
        # käydään läpi jokaisella sivulla kaikki linkit
        FOR    ${counter}    IN RANGE    1    ${count}+1
            # käydään läpi navigointi palkki ja kategoriat, otetaan ne talteen muuttujiin 
            ${tuotealueet}=    Get Text    xpath=/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${counter}]/a  
            # syystä että miten Jimms sivu on suunniteltu, jos tulee vastaan Sim Racing tehdään seuraavaa
            Run Keyword If    '${tuotealueet}' == 'Sim Racing'    Set Global Variable   ${tuotealueet}    SimRacing
            # käydään läpi jokaisella sivulla kaikki linkit
            Run Keyword And Continue On Failure    Go To    https://www.jimms.fi/fi/Product/${tuotealueet}
            # nuku
            Sleep    0.2s
        END
        # palaa pääsivulle
        Go To    ${url}  # Palaa pääsivulle
    END
    # suljetaan browser 
    Close Browser

3. Yhteystiedot sivulta löytyy yhteystiedot (sähköposti ja puhelinnumero).
    # Test Case ID: 3
    # Test Priority: Medium
    # Module Name: Contact Information
    # Test Designed By: Joni Mitronen 
    # Test Designed Date: 07-10-2024
    # Test Title: Yhteystiedot sivulta löytyy yhteystiedot (sähköposti ja puhelinnumero).
    # Test Summary: Tarkistetaan, että yhteystietosivulta löytyvät tarvittavat yhteystiedot, mukaan lukien puhelinnumero ja sähköpostiosoite.
    # Pre-conditions: Verkkosivusto on saatavilla ja yhteystiedot-linkki on näkyvissä.
    # Dependencies: SeleniumLibrary
    # Expected Result: Yhteystiedot-sivulta löytyvät puhelinnumero ja sähköpostiosoite, ja ne näkyvät oikein.

    # avataan browser
    Open Browser    ${url}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    # suurennetaan kokonäytölle
    Maximize Browser Window
    # painetaan yhteystiedot linkkiä
    Click Element    xpath=/html/body/div[1]/div/a[4]
    # tarkistetaan että ollaan oikealla sivulla
     Page Should Contain    Asiakaspalvelu
    # laita muuttujiin puhelinnumero ja sähköposti
    ${puhelinnumero}=    Get Text    xpath=/html/body/main/div[2]/div/div[2]/div/div/div[2]/div[1]/div/div/p[2]
    ${sähköposti}=    Get Text    xpath=/html/body/main/div[2]/div/div[2]/div/div/div[2]/div[1]/div/div/p[3]/a
    # tulostetaan yhteystiedot
    Log    ${puhelinnumero}
    Log    ${sähköposti}
    # sulje browser
    Close Browser