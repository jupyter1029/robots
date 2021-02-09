*** Settings ***

Resource    Variables.robot


*** Test Cases ***

Test "port" trait

    Start Unauthenticated Jupyter Server    --ServerApp.port=9999
    Check Server Status     http://127.0.0.1:9999
    [Teardown]  Teardown Jupyter Server

