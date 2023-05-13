CREATE TABLE 
    Marcas
    (
        Codigo int identity(1,1),
        Nome varchar(100),
        Descricao ntext
        CONSTRAINT PK_Marcas PRIMARY KEY (Codigo)
    )

CREATE TABLE
     Produtos
     (
            Codigo int identity(1,1),
            Nome varchar(50),
            Descricao varchar(255),
            Codigo_Marca int,
            CONSTRAINT PK_Produtos PRIMARY KEY (Codigo),
            CONSTRAINT FK_Produtos_Marcas FOREIGN KEY (Codigo_Marca)
                REFERENCES Marcas(Codigo)
     )

CREATE TABLE
    Distribuidor
    (
        Codigo int identity(1,1),
        Nome_Fantasia varchar(100),
        Razao_Social varchar(100),
        CNPJ varchar(14),
        Logradouro varchar(50),
        CEP varchar(8),
        Cidade varchar(30),
        Estado varchar(2),
        CONSTRAINT PK_Distribuidor PRIMARY KEY (Codigo)
    )

CREATE TABLE
    Pedido_Compra
    (
        Codigo int identity(1,1),
        Valor decimal(6,2),
        Data_compra datetime,
        Nota_fiscal varchar(10),
        Codigo_Distribuidor int,
        CONSTRAINT PK_Pedido_Compra PRIMARY KEY (Codigo),
        CONSTRAINT FK_Pedido_Compra_Distribuidor FOREIGN KEY (Codigo_Distribuidor)
            REFERENCES Distribuidor(Codigo)
    )

CREATE TABLE
    Item_Pedido_Compra
    (
        Codigo int identity(1,1),
        Valor_Unitario decimal(6,2),
        Quantidade int,
        Valor_Total decimal(6,0),
        Codigo_Produto int,
        Codigo_Pedido_Compra int,
        CONSTRAINT PK_Item_Pedido_Compra PRIMARY KEY (Codigo),
        CONSTRAINT FK_Item_Pedido_Compra_Produtos FOREIGN KEY (Codigo_Produto)
            REFERENCES Produtos(Codigo),
        CONSTRAINT FK_Item_Pedido_Compra_Pedido FOREIGN KEY (Codigo_Pedido_Compra)
            REFERENCES Pedido_Compra(Codigo)
    )
    
CREATE TABLE
    Forma_Pagamento
    (
        Codigo int identity(1,1),
        Nome varchar(25),
        Tipo varchar(25),
        CONSTRAINT PK_Forma_Pagamento PRIMARY KEY (Codigo)
    )

CREATE TABLE
    Clientes
    (
        Codigo int identity(1,1),
        Nome varchar(100),
        CPF varchar(11),
        Email varchar(40),
        Telefone_Residencial varchar(11),
        Celular varchar(11),
        Logradouro varchar(40),
        Cidade varchar(30),
        Estado varchar(2),
        CEP varchar(8),
        CONSTRAINT PK_Clientes PRIMARY KEY (Codigo)
    )    

CREATE TABLE
    Fidelidade
    (
        Codigo_Cliente int identity(1,1),
        Data_Adesao datetime,
        Pontos int,
        CONSTRAINT PK_Fidelidade PRIMARY KEY (Codigo_Cliente)
    )

CREATE TABLE
    Pedido_Venda
    (
        Codigo int identity(1,1),
        Valor decimal(6,2),
        Valor_Imposto decimal(6,2),
        Data_Venda datetime,
        Nota_Fiscal int,
        Celular varchar(11),
        Codigo_Cliente int,
        Codigo_Forma_Pagamento int,
        CONSTRAINT PK_Pedido_Venda PRIMARY KEY (Codigo),
        CONSTRAINT FK_Pedido_Venda_Cliente FOREIGN KEY (Codigo_Cliente)
            REFERENCES Clientes(Codigo),
        CONSTRAINT FK_Pedido_Venda_Forma_Pagamento FOREIGN KEY (Codigo_Forma_Pagamento)
            REFERENCES Forma_Pagamento(Codigo)
    )

CREATE TABLE
    Item_Pedido_Venda
    (
        Codigo int identity(1,1),
        Valor_Unitario decimal(6,2),
        Quantidade int,
        Valor_Imposto decimal(6,2),
        Valor_Total decimal(6,2),
        Codigo_Produto int,
        Codigo_Pedido_Venda int,
        CONSTRAINT PK_Item_Pedido_Venda PRIMARY KEY (Codigo),
        CONSTRAINT FK_Item_Pedido_Venda_Pedido FOREIGN KEY (Codigo_Pedido_Venda)
            REFERENCES Pedido_Venda(Codigo),
        CONSTRAINT FK_Item_Pedido_Venda_Produtos FOREIGN KEY (Codigo_Produto)
            REFERENCES Produtos(Codigo)
    )