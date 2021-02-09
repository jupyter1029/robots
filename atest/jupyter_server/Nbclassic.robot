*** Settings ***

Resource    Variables.robot
Resource    ClassicNotebook/Keywords.robot

*** Keywords ***

Start Nbclassic

    [Arguments]     @{arguments}

    ${extra_args} =   Set Variable
    # Turn-off authentication by setting the token to None.
    ...     --ServerApp.token=
    ...     --no-browser

    ${jupyter_server_process} =     Start Process   jupyter-nbclassic      @{arguments}    @{extra_args}
    ...     stderr=STDOUT

    Set Global Variable     ${jupyter_server_process}


*** Test Cases ***

Test Entrypoint

    Start Nbclassic
    Check Server Status
    [Teardown]  Teardown Jupyter Server

Test Landing Page

    ${HEADLESS} =    Get variable value    ${HEADLESS}    ${True}
    &{options} =    create dictionary   headless=${HEADLESS}

    Start Nbclassic
    Check Server Status
    Open Browser    http://127.0.0.1:8888   options=${options}
    Verify Classic Notebook Landing Page
    Close Browser
    [Teardown]  Teardown Jupyter Server

Test file_to_run

    ${HEADLESS} =    Get variable value    ${HEADLESS}    ${True}
    &{options} =    create dictionary   headless=${HEADLESS}

    Start Nbclassic
    Check Server Status
    Open Browser    http://127.0.0.1:8888   options=${options}
    Verify Classic Notebook Landing Page
    Close Browser
    [Teardown]  Teardown Jupyter Server
