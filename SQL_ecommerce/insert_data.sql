-- persistência de dados - populando o banco

-- Clientes genéricos
insert into clients (name, address, clientType) values 
('João Silva', 'Rua das Flores, 123', 'pf'),
('Maria Lima', 'Av. Brasil, 456', 'pf'),
('Loja Tech', 'Av. Central, 1000', 'pj'),
('Mercado Bom Preço', 'Rua das Laranjeiras, 789', 'pj');

-- Pessoa física
insert into client_pf (idClientPF, CPF) values 
(1, '12345678901'),
(2, '98765432100');

-- Pessoa jurídica
insert into client_pj (idClientPJ, CNPJ, companyName) values 
(3, '11222333000144', 'Tech Solutions Ltda'),
(4, '99888777000122', 'Supermercado Bom Preço SA');

-- produtos
insert into product (Pname, classification_kids, category, avaliacao, size) values
('DroneX', false, 'eletronico', 4.5, '30x30x10'),
('Camiseta', false, 'vestimenta', 4.0, 'M'),
('Boneca Elsa', true, 'brinquedos', 4.8, '25cm'),
('Chocolate', false, 'alimentos', 3.9, '100g'),
('Cadeira', false, 'moveis', 4.2, '80x80x100');

-- pedidos
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
(1, 'confirmado', 'Compra de Drone e Cadeira', 25.00, false),
(2, 'em processamento', 'Compra de Boneca Elsa', 10.00, true),
(3, 'cancelado', 'Compra de Chocolate', 5.00, false);

-- fornecedores
insert into supplier (socialName, CNPJ, contact) values 
('FornecedorTech', '11222333000101', '11999999999'),
('Brinquedos Ltda', '22334455000166', '11988888888');

-- vendedores
insert into seller (socialName, absName, CNPJ, CPF, location, contact) values
('VendedorTech', 'Carlos Souza', '33445566000177', null, 'São Paulo', '11977777777'),
('Moda Varejo', 'Ana Viana', null, '123456789', 'Curitiba', '11966666666');

-- produto vendido por vendedores
insert into productSeller (idPSseller, idPSproduct, prodQuantity) values
(1, 1, 10), -- DroneX
(2, 2, 50), -- Camiseta
(1, 5, 15); -- Cadeira

-- produto em pedidos
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
(1, 1, 1, 'disponivel'), -- DroneX no pedido 1
(5, 1, 2, 'disponivel'), -- Cadeira no pedido 1
(3, 2, 1, 'disponivel'), -- Boneca Elsa no pedido 2
(4, 3, 3, 'sem estoque'); -- Chocolate no pedido 3

-- estoques
insert into productStorage (storageLocation, quantity) values
('Galpão SP', 100),
('Centro RJ', 50);

-- produtos no estoque
insert into storageLocation (idSLproduct, idSLstorage, location) values
(1, 1, 'Prateleira 1'),
(2, 2, 'Prateleira 4'),
(3, 1, 'Prateleira 2');

insert into productSupplier (idPSproduct, idPSsupplier, quantity) values
(1, 1, 20),
(3, 2, 100);

insert into payments (idPayment, idClient, typePayment, limitAvailable) values
(1, 1, 'cartao_credito', 3000.00),
(2, 1, 'pix', 1000.00),
(3, 2, 'cartao_debito', 1500.00),
(4, 3, 'boleto', 5000.00);

insert into delivery (idOrder, trackingCode, deliveryStatus) values
(1, 'BR1234567890XYZ', 'entregue'),
(2, 'BR0987654321ZYX', 'em transporte');


