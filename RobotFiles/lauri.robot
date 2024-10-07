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