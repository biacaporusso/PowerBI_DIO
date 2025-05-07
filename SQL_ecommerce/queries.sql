-- Quantos pedidos foram feitos por cada cliente?
SELECT c.name AS cliente, COUNT(o.idOrder) AS total_pedidos
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient
ORDER BY total_pedidos DESC;


-- Algum vendedor também é fornecedor?
SELECT sel.socialName AS nome_vendedor, sel.CPF, sel.CNPJ
FROM seller sel
JOIN supplier sup
ON 
    (sel.CPF IS NOT NULL AND sel.CPF = sup.CNPJ)
    OR (sel.CNPJ IS NOT NULL AND sel.CNPJ = sup.CNPJ);


-- Relação de nomes dos fornecedores e nomes dos produtos que eles fornecem
SELECT sup.socialName AS fornecedor, p.Pname AS produto
FROM productSupplier ps
JOIN supplier sup ON ps.idPSsupplier = sup.idSupplier
JOIN product p ON ps.idPSproduct = p.idProduct
ORDER BY sup.socialName;


-- Relação de produtos, fornecedores e locais de estoque
SELECT 
    p.Pname AS produto,
    sup.socialName AS fornecedor,
    psup.quantity AS quantidade_fornecida,
    ps.storageLocation AS local_estoque
FROM product p
JOIN productSupplier psup ON p.idProduct = psup.idPSproduct
JOIN supplier sup ON psup.idPSsupplier = sup.idSupplier
JOIN storageLocation sl ON p.idProduct = sl.idSLproduct
JOIN productStorage ps ON sl.idSLstorage = ps.idProdStorage
ORDER BY p.Pname;


-- Pedidos que custaram mais de R$20 de frete
SELECT 
    o.idOrder,
    c.name AS cliente,
    o.sendValue AS frete
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
WHERE o.sendValue > 20
ORDER BY o.sendValue DESC;


-- Quantidade total de produtos por pedido
SELECT 
    o.idOrder,
    c.name AS cliente,
    SUM(po.poQuantity) AS total_itens
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
JOIN productOrder po ON o.idOrder = po.idPOorder
GROUP BY o.idOrder
ORDER BY total_itens DESC;
