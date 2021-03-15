*** Settings ***
Resource        ResourceAPI.robot
Suite Setup     Conectar a minha API

*** Test Case ***
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar carrinho de compras
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna todas as cores
    Conferir se vem todos os precos
    Conferir se vem todos codigos internos
    Conferir total do frete
    Conferir quantidade do carrinho
    Conferir se vem todos os tamanhos
