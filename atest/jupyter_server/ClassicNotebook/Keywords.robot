*** Settings ***

Library     PuppeteerLibrary

*** Keywords ***

Verify Classic Notebook Landing Page

    Wait Until Element Is Visible   id:ipython_notebook
    Capture Page Screenshot
