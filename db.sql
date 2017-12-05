create table Cliente (
	cod_cliente int auto_increment,
	cpf char(11) not null,
	nome varchar(120) not null,
	email varchar(256),
	telefone char(11),
	primary key (cod_cliente)
);

create table Usuario (
	cod_usuario int auto_increment,
  cod_funcao int,
	nome varchar(120) not null,
	email varchar(256),
	telefone char(11),
	primary key (cod_usuario)
);

create table Recebimento (
	cod_recebimento int auto_increment,
  cod_nota_venda int,
	num_parcela int not null,
	valor_parcela decimal(12,2),
	data_recebimento datetime,
	recebido enum('S', 'N'),
	primary key (cod_recebimento)
);

create table TipoRecebimento (
	cod_tipo int auto_increment,
	descricao varchar(120) not null,
	primary key (cod_tipo)
);

create table NotaDeVenda (
	cod_nota_venda int auto_increment,
	cod_cliente int,
	cod_usuario int,
	cod_tipo int,
	data_venda datetime,
	data_entrega datetime,
	total decimal(12, 2),
	forma_pagamento varchar(120),
	primary key (cod_nota_venda)
);

create table ItemSaida (
	cod_item_saida int auto_increment,
	cod_nota_venda int,
	cod_prod_saida int,
	qtde int,
	primary key (cod_item_saida)
);

create table Funcao (
	cod_funcao int auto_increment,
	descricao varchar(120),
	primary key (cod_funcao)
);

create table Movimento (
	cod_movimento int auto_increment,
	cod_usuario int,
	cod_produto int,
	data_evento datetime,
	motivo varchar(120),
	qtde int,
	primary key (cod_movimento)
);

create table Produto (
	cod_produto int auto_increment,
	cod_fornecedor int,
	nome varchar(30) not null,
	descricao varchar(120),
	preco_custo decimal(12,2),
	preco_venda decimal(12,2),
	qtde int,
	primary key (cod_produto)
);

create table Fornecedor (
	cod_fornecedor int auto_increment,
	cnpj char(14) not null,
	nome varchar(120) not null,
	telefone char(11),
	email varchar(256),
	primary key (cod_fornecedor)
);

create table NotaDeCompra (
	cod_nota_compra int auto_increment,
	cod_fornecedor int,
	cod_usuario int,
	data_compra datetime,
	data_entrega datetime,
	total decimal(12,2),
	primary key (cod_nota_compra)
);

create table ItemEntrada (
	cod_item_entrada int auto_increment,
	cod_nota_compra int,
	cod_prod_entrada int,
	qtde int,
	primary key (cod_item_entrada)
);

create table Pagamento (
	cod_pagamento int auto_increment,
	cod_nota_compra int,
	num_parcelas int not null,
	valor_parcela decimal(12,2),
	data_pagamento datetime,
	pago enum('S', 'N'),
	primary key (cod_pagamento)
);

alter table Recebimento add constraint Rec_Venda_FK
foreign key (cod_nota_venda) references NotaDeVenda(cod_nota_venda);

alter table NotaDeVenda add constraint Venda_Usuario_FK
foreign key (cod_usuario) references Usuario(cod_usuario);

alter table NotaDeVenda add constraint Venda_Cliente_FK
foreign key (cod_cliente) references Cliente(cod_cliente);

alter table NotaDeVenda add constraint Venda_Tipo_FK
foreign key (cod_tipo) references TipoRecebimento(cod_tipo);

alter table Usuario add constraint Usuario_Funcao_FK
foreign key (cod_funcao) references Funcao(cod_funcao);

alter table ItemSaida add constraint Saida_Venda_FK
foreign key (cod_nota_venda) references NotaDeVenda(cod_nota_venda);

alter table ItemSaida add constraint Saida_Produto_FK
foreign key (cod_prod_saida) references Produto(cod_produto);

alter table Movimento add constraint Mov_Usuario_FK
foreign key (cod_usuario) references Usuario(cod_usuario);

alter table Movimento add constraint Mov_Produto_FK
foreign key (cod_produto) references Produto(cod_produto);

alter table Produto add constraint Produto_Forn_FK
foreign key (cod_fornecedor) references Fornecedor(cod_fornecedor);

alter table ItemEntrada add constraint Entrada_Compra_FK
foreign key (cod_nota_compra) references NotaDeCompra(cod_nota_compra);

alter table ItemEntrada add constraint Entrada_Produto_FK
foreign key (cod_prod_entrada) references Produto(cod_produto);

alter table NotaDeCompra add constraint Compra_Forn_FK
foreign key (cod_fornecedor) references Fornecedor(cod_fornecedor);

alter table NotaDeCompra add constraint Compra_Usuario_FK
foreign key (cod_usuario) references Usuario(cod_usuario);

alter table Pagamento add constraint Paga_Compra_FK
foreign key (cod_nota_compra) references NotaDeCompra(cod_nota_compra);