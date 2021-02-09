*** Settings ***

Library     Process
Library     RequestsLibrary

*** Keywords ***

Start Unauthenticated Jupyter Server

    [Arguments]     @{arguments}

    ${extra_args} =   Set Variable
    # Turn-off authentication by setting the token to None.
    ...     --ServerApp.token=
    ...

    ${jupyter_server_process} =     Start Process   jupyter-server      @{arguments}    @{extra_args}
    ...     stderr=STDOUT

    Set Global Variable     ${jupyter_server_process}

Check Server Status

    [Arguments]     ${address}=http://127.0.0.1:8888
    Create Session  jupyter-server      ${address}      max_retries=10          disable_warnings=${True}
    GET on Session  jupyter-server      /api/status            expected_status=200

Teardown Jupyter Server

    ${result} =     Terminate Process   ${jupyter_server_process}
    Log  ${result.stdout}