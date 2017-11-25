create table Cliente (
	cod_cliente int auto_increment,
	cpf char(11) not null,
	nome varchar(120) not null,
	email varchar(256),
	telefone char(11),
	primary key (cod_cliente)
);

create table Vendedor (
	cod_vendedor int auto_increment,
	cpf char(11) not null,
	nome varchar(120) not null,
	email varchar(256),
	telefone char(11),
	primary key (cod_vendedor)
);

create table Estoquista (
	cod_estoquista int auto_increment,
	cpf char(11) not null,
	nome varchar(120) not null,
	email varchar(256),
	telefone char(11),
	primary key (cod_estoquista)
);

create table ContasAReceber (
	cod_contas_receber int auto_increment,
	num_parcelas int not null,
	valor_parcela decimal(12, 2) not null,
	primary key (cod_contas_receber)
);

create table NotaDeVenda (
	cod_nota_venda int auto_increment,
	cod_cliente int,
	cod_vendedor int,
	data_venda date,
	data_entrega date,
	total decimal(12, 2),
	primary key (cod_nota)
);

create table ItemSaida (
	cod_item_saida int auto_increment,
	cod_nota_venda int,
	cod_produto int,
	qtde int,
	primary key (cod_item_saida)
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

create table Movimento (
	cod_movimento int auto_increment,
	cod_estoquista int,
	cod_produto int,
	data_evento date,
	motivo varchar(120),
	qtde int,
	primary key (cod_movimento)
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
	data_compra date,
	data_entrega date,
	total decimal(12,2);
	primary key (cod_nota_compra)
);

create table ItemEntrada (
	cod_item_entrada int auto_increment,
	cod_nota_compra int,
	cod_produto int,
	qtde int,
	primary key (cod_item_entrada)
);

create table ContasAPagar (
	cod_contas_pagar int auto_increment,
	cod_nota_compra int,
	num_parcelas int not null,
	valor_parcela decimal(12,2),
	primary key (cod_contas_pagar)
);