*** Settings ***

Library     PuppeteerLibrary

*** Keywords ***

Verify Classic Notebook Landing Page

    Set Screenshot Directory    ${OUTPUT DIR}
    Wait Until Element Is Visible   id:ipython_notebook
    Capture Page Screenshot
