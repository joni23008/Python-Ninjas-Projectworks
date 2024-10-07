# Testattava tuote: http://jimms.fi
# 1. Onko kaikilla tuotealueilla "landing page"
# 2. Testaa hakutoimintoa tuotteen pääsivulta (hakusana ps5)
    #- robotti ottaa kuvankaappauksen ensimmäisestä tuotteesta
    #- robotti menee tuotteen tuotesivulle
    #- robotti tarkastaa, että on oikealla tuotesivulla ja haku täsmää joltain osin annettuun hakusanaan
# 3. Löytyykö tuotesivulta linkki "Lisää koriin"
# 4. Löytyykö "Lisää koriin" -linkkiin liittyvä ikoni. Robotti ottaa ikonista kuvankaappauksen.
# 5. Robotti lisää tuotteen ostoskoriin

*** Settings ***
Library   SeleniumLibrary
Library    String

*** Variables ***
${url}    http://jimms.fi

*** Test Cases ***
1: Verify that the user can select a flight from Boston to Cairo and view flight details

    # Test Case ID: 1
    # Test Priority: High
    # Module Name: Flight Booking Module
    # Test Designed By: Joni Mitronen
    # Test Designed Date: 07-Oct-2024
    # Test Title: Verify flight selection and details page
    # Test Summary: Ensure that the user can search for flights from Boston to Cairo, select a flight, and view correct flight details.
    # Pre-conditions: User should be on the flight search page with valid flight routes available.
    # Dependencies: Requires search functionality to work.
    
    Open Browser    ${url}    Chrome


    # Expected Result: 
    # The system should display the flight details (airline, flight number, and price) for the selected flight, and allow the user to proceed to booking.
