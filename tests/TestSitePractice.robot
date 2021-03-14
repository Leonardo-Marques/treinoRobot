*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caminho feliz
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no produto
    Adicionar o produto ao carrinho
    Posseguir para checkout
    Fazer login em uma conta
    Prosseguir para frete
    Aceitar ps termos de serviço
    Ir para pagamento
    Pagar com transferência bancária
    Conferir se o pedido foi realizado com sucesso
