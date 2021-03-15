*** Settings ***
Library         RequestsLibrary
Library         Collections

*** Variable ***
${URL_API}      http://5d9cc58566d00400145c9ed4.mockapi.io/

*** Keywords ***
####SETUP E TEARDOWNS
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}
    ${HEADERS}     Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}

#### Ações
Requisitar carrinho de compras
    ${RESPOSTA}    Get On Session  fakeAPI    shopping_cart
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

#### Conferências
Conferir se retorna todas as cores
    Dictionary Should Contain Item    ${RESPOSTA.json()}    color    ['Black', 'Orange', 'Yellow']

Conferir se vem todos os precos
    Dictionary Should Contain Item    ${RESPOSTA.json()}  price  ['27.00', '16.51', '16.40']

Conferir se vem todos codigos internos
    Dictionary Should Contain Item    ${RESPOSTA.json()}  sku  ['demo_2', 'demo_1', 'demo_7']

Conferir se vem todos os tamanhos
    Dictionary Should Contain Item    ${RESPOSTA.json()}  size  ['S', 'S', 'S']

Conferir total do frete
    Dictionary Should Contain Item    ${RESPOSTA.json()}  total_shipping  2.00

Conferir quantidade do carrinho
    Dictionary Should Contain Item    ${RESPOSTA.json()}  shopping_cart  1

Conferir o status code
    [Arguments]      ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}     ${REASON_DESEJADO}/
