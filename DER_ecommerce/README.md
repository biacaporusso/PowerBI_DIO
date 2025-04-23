# 📦 Diagrama Entidade-Relacionamento de E-commerce

Este projeto foi desenvolvido como parte de um curso sobre modelagem de dados relacionais.
O objetivo é representar, por meio de um Diagrama Entidade-Relacionamento (DER), os principais elementos de um sistema de e-commerce.

---

## 🧩 Funcionalidades modeladas

- **Cadastro de clientes** (Pessoa Física ou Jurídica).
- **Pedidos de compra** associados a clientes.
- **Entregas** com status e código de rastreio vinculadas aos pedidos.
- **Pagamentos** com múltiplas formas possíveis (crédito, débito ou PIX).
- **Produtos** disponibilizados por fornecedores e vendidos por terceiros.
- **Controle de estoque** por local e quantidade.
- **Relacionamento entre produtos e pedidos** (itens do pedido).

---

## 🔗 Estrutura do DER

A modelagem foi feita com foco em:
- Boa normalização (evitando redundâncias).
- Clareza nas relações 1:1, 1:N e N:M.
- Separação lógica entre entidades principais e suas extensões (ex: Pessoa Física/Jurídica).
- Suporte a múltiplos vendedores e fornecedores.
