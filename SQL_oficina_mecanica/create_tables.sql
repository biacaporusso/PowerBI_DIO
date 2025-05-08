
-- drop database oficina_mecanica;
create database oficina_mecanica;
use oficina_mecanica;

create table cliente (
	id int auto_increment primary key,
    nome varchar(100) not null,
    endereco varchar(100),
    CPF char(11) not null,
    contato varchar(45) not null,
    constraint unique_cpf UNIQUE (CPF)
);


create table mecanico (
	id int auto_increment primary key,
    nome varchar(100) not null, 
    codigo varchar(45),
    endereco varchar(100),
    especialidade varchar(45) not null,
    constraint unique_codigo UNIQUE (codigo)
);


create table veiculo (
	id int auto_increment primary key,
    id_cliente int,
    marca varchar(45),
    modelo varchar(45),
    placa varchar(10) not null,
    constraint fk_id_cliente foreign key (id_cliente) references cliente(id) 
);


create table ordem_servico(
	id int auto_increment primary key,
    data_emissao date,
    valor_total float not null,
    status enum('em analise', 'iniciado', 'concluido') default 'em analise',
    data_conclusao date,
    id_cliente int,
    id_veiculo int,
	CONSTRAINT fk_os_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id),
	CONSTRAINT fk_os_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo(id)
);


create table peca (
	id int auto_increment primary key,
    nome varchar(45) not null,
    valor float not null
);


create table servico (
	id int auto_increment primary key,
    tipo_de_servico varchar(45) not null,
    valor float not null,
    id_veiculo int,
    constraint fk_id_veiculo foreign key (id_veiculo) references veiculo(id)
);


create table execucao_servico (
	id_mecanico int,
    id_servico int,
    primary key (id_mecanico, id_servico),
    constraint fk_id_mecanico foreign key (id_mecanico) references mecanico(id),
    constraint fk_id_servico foreign key (id_servico) references servico(id)
);


create table servico_executado (
	id_servico int,
    id_ordem_servico int,
    primary key(id_servico, id_ordem_servico),
    constraint fk_se_servico foreign key (id_servico) references servico(id),
    constraint fk_se_os foreign key (id_ordem_servico) references ordem_servico(id)
);

create table peca_utilizada (
	id_peca int,
    id_os int,
    primary key(id_peca, id_os),
    constraint fk_pu_peca foreign key (id_peca) references peca(id),
    constraint fk_pu_os foreign key (id_os) references ordem_servico(id)
);


