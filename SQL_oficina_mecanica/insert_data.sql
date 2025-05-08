INSERT INTO cliente (nome, endereco, CPF, contato) VALUES
('João Silva', 'Rua das Flores, 123', '12345678901', '(43)99999-1234'),
('Maria Oliveira', 'Av. Brasil, 456', '98765432100', '(43)98888-5678'),
('Pedro Martins', 'Rua Nova, 77', '11122233344', '(43)97777-1111'),
('Larissa Rocha', 'Rua Central, 202', '55566677788', '(43)96666-2222'),
('Bruna Carvalho', 'Rua do Sol, 50', '99988877766', '(43)95555-0000');


INSERT INTO mecanico (nome, codigo, endereco, especialidade) VALUES
('Carlos Mendes', 'M001', 'Rua dos Mecânicos, 10', 'Suspensão'),
('Ana Torres', 'M002', 'Rua das Oficinas, 20', 'Freios'),
('Bruno Lima', 'M003', 'Rua das Ferramentas, 15', 'Motor'),
('Fernanda Alves', 'M004', 'Rua da Borracharia, 99', 'Elétrica'),
('Renato Souza', 'M005', 'Av. Técnica, 101', 'Direção');


INSERT INTO veiculo (id_cliente, marca, modelo, placa) VALUES
(1, 'Ford', 'Fiesta', 'ABC1234'),
(2, 'Chevrolet', 'Onix', 'XYZ5678'),
(3, 'Volkswagen', 'Gol', 'DEF2345'),
(4, 'Hyundai', 'HB20', 'GHI6789'),
(5, 'Toyota', 'Corolla', 'JKL4321');


INSERT INTO ordem_servico (data_emissao, valor_total, status, data_conclusao, id_cliente, id_veiculo) VALUES
('2025-05-01', 500.00, 'concluido', '2025-05-03', 1, 1),
('2025-05-02', 300.00, 'iniciado', NULL, 2, 2),
('2025-05-03', 650.00, 'em analise', NULL, 3, 3),
('2025-05-04', 400.00, 'iniciado', NULL, 4, 4),
('2025-05-05', 750.00, 'concluido', '2025-05-06', 5, 5);


INSERT INTO peca (nome, valor) VALUES
('Pastilha de freio', 150.00),
('Filtro de óleo', 50.00),
('Correia dentada', 200.00),
('Velas de ignição', 100.00),
('Amortecedor dianteiro', 250.00);


INSERT INTO servico (tipo_de_servico, valor, id_veiculo) VALUES
('Troca de pastilha', 200.00, 1),
('Troca de óleo', 100.00, 2),
('Troca de correia', 300.00, 3),
('Revisão elétrica', 250.00, 4),
('Substituição de amortecedor', 350.00, 5);


INSERT INTO execucao_servico (id_mecanico, id_servico) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO servico_executado (id_servico, id_ordem_servico) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO peca_utilizada (id_peca, id_os) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
