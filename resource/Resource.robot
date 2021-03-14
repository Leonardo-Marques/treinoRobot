
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser

#### Ações
Acessar a página home do site
    Go To               ${URL}
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text          name=search_query    ${PRODUTO}

Clicar no botão pesquisar
    Click Element       name=submit_search

Clicar no produto
    Click Element    css=.block_content .products-block>:nth-child(1)>a

Adicionar o produto ao carrinho
    Wait Until Element Is Visible   id=add_to_cart
    Click Element                   id=add_to_cart
    Wait Until Element Is Visible   css=.button-container>a>span

Posseguir para checkout
    Click Element                   css=.button-container>a>span
    Wait Until Element Is Visible   css=.cart_navigation.clearfix>:nth-child(1)
    Click Element                   css=.cart_navigation.clearfix>:nth-child(1)

Fazer login em uma conta
    Wait Until Element Is Visible   id=email
    Input Text                      id=email  teste@auhbbteste.uk
    Input Text                      id=passwd  12345
    Click Button                    id=SubmitLogin

Prosseguir para frete
    Wait Until Element Is Visible   css=.cart_navigation.clearfix>button
    Click Element                   css=.cart_navigation.clearfix>button
    Wait Until Element Is Visible   css=.delivery_options_address

Aceitar ps termos de serviço
    Select Checkbox                 css=#cgv

Ir para pagamento
    Click Element                               css=.cart_navigation.clearfix>button
    Wait Until Element Is Visible               css=.payment_module

Pagar com transferência bancária
    Click Element                               css=*[title='Pay by bank wire']
    Wait Until Element Is Visible               css=.cart_navigation.clearfix>button
    Click Element                               css=.cart_navigation.clearfix>button

Conferir se o pedido foi realizado com sucesso
    Wait Until Element Is Visible                css=.cheque-indent>strong
    Element Text Should Be                       css=.cheque-indent>strong   Your order on My Store is complete.
