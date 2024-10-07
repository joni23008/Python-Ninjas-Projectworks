# Testattava tuote: http://jimms.fi
# 1. Onko kaikilla tuotealueilla "landing page"


*** Settings ***
Library   SeleniumLibrary
Library    String

*** Variables ***
${url}    http://jimms.fi
${hakusana}    ps5

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
    
    Open Browser    ${url}    Chrome
