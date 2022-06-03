*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  Collections


*** Variables ***
${session}              https://robotframework.org/
${jsHamburger}          /js/app.20450c80.js


${UserGuide}            https://robotframework.org/robotframework/#user-guide
${StandardLibraries}    https://robotframework.org/robotframework/#standard-libraries
${PublicAPI}            https://robot-framework.readthedocs.io/en/stable
${Github}               https://github.com/robotframework/robotframework
${Forum}                https://forum.robotframework.org
${Foundation}           foundation
${Robocon}              https://robocon.io
${YouTube}              https://www.youtube.com/channel/UCuOaCtN8bI9O_E2VYIumIqg
${Shop}                 https://shop.robotframework.org
${RPA}                  https://robotframework.org/rpa



*** Test Cases ***
Do a GET Request session
    create session      mysession     ${session}
    ${response}=  GET On Session    mysession    ${session}
#    проверка статус кода на запрос
    Status Should Be    200     ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}   text/html; charset=utf-8
#    проверка наличия титула на странице
    should contain    ${response.text}        <title>Robot Framework</title>
#    проверка на наличие ссылок на вкладке документы, наличие js файлов с сылкой на внешнии ресурсф
    should contain    ${response.text}        ${jsHamburger}


Do a GET Request js
    create session    mysession     ${session}
    ${response}=  GET On Session  mysession     ${jsHamburger}
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       application/javascript; charset=utf-8
#    проверка наличи ссылок на внешний ресурс
    Should contain    ${response.text}        ${UserGuide}
    should contain    ${response.text}        ${StandardLibraries}
    should contain    ${response.text}        ${PublicAPI}
    Should contain    ${response.text}        ${Github}
    should contain    ${response.text}        ${Forum}
    should contain    ${response.text}        ${Foundation}
    Should contain    ${response.text}        ${Robocon}
    should contain    ${response.text}        ${YouTube}
    should contain    ${response.text}        ${Shop}
    should contain    ${response.text}        ${RPA}


Go To Link
#    create session    mysession
    ${response}=  GET On Session  mysession     ${UserGuide}
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8

    create session    mysession     ${StandardLibraries}
    ${response}=  GET On Session  mysession    /
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8

    create session    mysession     ${PublicAPI}
    ${response}=  GET On Session  mysession    /
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html

    create session    mysession     ${Github}
    ${response}=  GET On Session  mysession    /
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8

    create session    mysession     ${Forum}
    ${response}=  GET On Session  mysession    /
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8

    create session    mysession     ${session}
    ${response}=  GET On Session  mysession    ?/${Foundation}
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8

    create session    mysession     ${Robocon}
    ${response}=  GET On Session  mysession    /
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8

    create session    mysession     ${YouTube}
    ${response}=  GET On Session  mysession    /
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8

    create session    mysession     ${Shop}
    ${response}=  GET On Session  mysession    /
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8

    create session    mysession     ${RPA}
    ${response}=  GET On Session  mysession    /
#    проверка статус кода на запрос
    Status Should Be  200  ${response}
    ${getHeaderValue}=    Get From Dictionary     ${response.headers}     Content-Type
    Should be equal     ${getHeaderValue}       text/html; charset=utf-8



*** Keywords ***
