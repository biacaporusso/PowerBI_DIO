# 🔧 Sistema de Gestão de Oficina Mecânica – DER

Este projeto consiste em um **Diagrama Entidade-Relacionamento (DER)** para representar o funcionamento de uma oficina mecânica.  
O sistema foi modelado com o objetivo de organizar **ordens de serviço (OS)**, clientes, veículos, serviços prestados, peças utilizadas e a equipe de mecânicos responsável pela execução.

---

## 🚗 Narrativa do Projeto

Clientes levam veículos à oficina para manutenção ou revisão.  
Cada veículo é avaliado por uma equipe de mecânicos que identifica os serviços necessários e preenche uma **ordem de serviço (OS)**.

A OS possui um número, valor total, data de emissão, status e data de conclusão.  
Cada OS pode conter vários **serviços** e **peças**, cujos valores são somados ao total.  
Os serviços são executados por um ou mais **mecânicos**, com base em suas especialidades.

---

## 🧱 Entidades e Relacionamentos

### Principais entidades:
- **Cliente**: Dados cadastrais do cliente.
- **Veículo**: Associado ao cliente; cada veículo pode passar por múltiplos serviços.
- **Serviço**: Relacionado ao veículo; pode ser executado em várias ordens de serviço.
- **Peça**: Itens utilizados durante a execução dos serviços.
- **Mecânico**: Equipe responsável pela execução dos serviços.
- **OS (Ordem de Serviço)**: Documento que reúne os serviços executados e peças utilizadas em um veículo.

### Relacionamentos chave:
- `serviço_executado`: Relaciona ordens de serviço com os serviços executados.
- `peça_utilizada`: Relaciona ordens de serviço com as peças utilizadas.
- `execução_serviço`: Indica quais mecânicos participaram de qual serviço.

---
