-- criacao do banco de dados para o cenario de ecommerce

-- drop database ecommerce_refinado;
create database ecommerce_refinado;
use ecommerce_refinado;

-- criar tabela cliente -> superclasse
create table clients(
	idClient int auto_increment primary key,
    name varchar(255) not null,
    address varchar(100),
    clientType enum('pf', 'pj') not null
);
alter table clients auto_increment=1;


-- pessoa física
create table client_pf (
    idClientPF int primary key,
    CPF char(11) not null unique,
    foreign key (idClientPF) references clients(idClient) on delete cascade
);

-- pessoa jurídica
create table client_pj (
    idClientPJ int primary key,
    CNPJ char(14) not null unique,
    companyName varchar(255),
    foreign key (idClientPJ) references clients(idClient) on delete cascade
);


-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('eletronico', 'vestimenta', 'brinquedos', 'alimentos', 'moveis') not null,
    avaliacao float default 0,
    size varchar(10) -- dimensão do produto
);
alter table product
modify column Pname varchar(100) not null;


-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('cancelado', 'confirmado', 'em processamento') default 'em processamento',
    orderDescription varchar(255),
    sendValue float default 10, -- frete
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);


-- criar tabela estoque 
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);


-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    absName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique(CPF)
);
-- DICA: tabela pessoa juridica, e dentro seleciona se é fornecedor ou vendedor

-- relacionamento produto-vendedor
create table productSeller(
	idPSseller int,
    idPSproduct int,
    prodQuantity int default 1,
    primary key(idPSseller, idPSproduct),
    constraint fk_ps_seller foreign key (idPSseller) references seller(idSeller),
    constraint fk_ps_product foreign key(idPSproduct) references product(idProduct)
);
desc productSeller;


-- relacionamento produto-pedido
create table productOrder(
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('disponivel', 'sem estoque') default 'disponivel',
primary key (idPOproduct, idPOorder),
constraint fk_po_product foreign key (idPOproduct) references product(idProduct),
constraint fk_po_order foreign key (idPOorder) references orders(idOrder)
);


-- relacionamento produto-estoque
create table storageLocation(
idSLproduct int,
idSLstorage int,
location varchar(255) not null,
constraint fk_sl_product foreign key (idSLproduct) references product(idProduct),
constraint fk_sl_storage foreign key (idSLstorage) references productStorage (idProdStorage)
);

-- relacionamento produto-fornecedor
create table productSupplier(
idPSproduct int,
idPSsupplier int,
quantity int not null,
primary key (idPSproduct, idPSsupplier),
constraint fk_product_supplier_product foreign key (idPSproduct) references product(idProduct),
constraint fk_product_supplier_supplier foreign key (idPSsupplier) references supplier(idSupplier)
);


-- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
create table payments(
	idPayment int,
    idClient int,
    typePayment enum('boleto', 'cartao_credito', 'cartao_debito', 'pix'),
    limitAvailable float,
    primary key(idPayment, idClient)
);


-- Entrega – Possui status e código de rastreio;
create table delivery (
    idDelivery int auto_increment primary key,
    idOrder int,
    trackingCode varchar(100),
    deliveryStatus enum('em separacao', 'em transporte', 'entregue', 'cancelado') default 'em separacao',
    constraint fk_delivery_order foreign key (idOrder) references orders(idOrder)
        on delete cascade
);

show tables;





