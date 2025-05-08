-- Quem são todos os clientes cadastrados?
SELECT * FROM cliente;

-- Quais veículos são da marca Ford?
SELECT * FROM veiculo WHERE marca = 'Ford';

-- Quais ordens de serviço já foram concluídas?
SELECT * FROM ordem_servico WHERE status = 'concluido';

-- Quais são os veículos dos clientes?
SELECT c.nome AS cliente, v.marca, v.modelo, v.placa
FROM cliente c
JOIN veiculo v ON c.id = v.id_cliente;

-- Quais ordens de serviço, seus clientes e veículos?
SELECT os.id AS ordem_id, c.nome AS cliente, v.marca, v.modelo, os.status
FROM ordem_servico os
JOIN cliente c ON os.id_cliente = c.id
JOIN veiculo v ON os.id_veiculo = v.id;

-- Quais são os 3 serviços mais caros? 
SELECT * FROM servico
ORDER BY valor DESC
LIMIT 3;

-- Total gasto em cada ordem de serviço (serviço  peças)
SELECT
    os.id AS ordem,
    SUM(s.valor) AS total_servicos,
    SUM(p.valor) AS total_pecas,
    SUM(s.valor + p.valor) AS total_geral
FROM ordem_servico os
JOIN servico_executado se ON os.id = se.id_ordem_servico
JOIN servico s ON s.id = se.id_servico
JOIN peca_utilizada pu ON pu.id_os = os.id
JOIN peca p ON p.id = pu.id_peca
GROUP BY os.id;

-- Clientes que já gastaram mais de R$ 500 no total (em ordens de serviço)
SELECT c.nome, SUM(os.valor_total) AS total_gasto
FROM cliente c
JOIN ordem_servico os ON os.id_cliente = c.id
GROUP BY c.nome
HAVING total_gasto > 500;



