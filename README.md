# 📦 E-commerce - Esquema de Banco de Dados

Este repositório contém o modelo conceitual e a estrutura de banco de dados em **MySQL** para um sistema de e-commerce. O objetivo é representar de forma clara e eficiente as entidades, relacionamentos e atributos necessários para o funcionamento de uma loja virtual.

## 🧠 Contexto do Projeto

Um sistema de e-commerce precisa controlar informações de **clientes**, **pedidos**, **produtos**, **estoques**, **fornecedores**, **terceiros/vendedores**, e **pagamentos**. Este projeto abrange as funcionalidades principais de um sistema como esse, permitindo consultas, inserções e relacionamentos eficientes entre as tabelas.

## 📁 Estrutura de Diretórios

```
ecommerce-database/
│
├── ecommerce_schema.sql     # Script SQL com toda a estrutura do banco
└── README.md                # Documentação do projeto
```

## 🧱 Entidades e Relacionamentos

- **Cliente**: informações de clientes (nome, documento, endereço)
- **Pedido**: dados dos pedidos realizados, status e rastreamento de frete
- **Produto**: catálogo de produtos
- **Relação Produto/Pedido**: itens comprados em cada pedido
- **Estoque**: locais onde os produtos estão armazenados
- **Produto_has_Estoque**: mapeamento de quais produtos estão em qual estoque e em que quantidade
- **Fornecedor**: responsáveis por fornecer os produtos
- **Disponibilizando_um_produto**: produtos vinculados aos fornecedores
- **Terceiro/Vendedor**: vendedores externos ou parceiros
- **Pagamento**: controle da forma de pagamento por pedido

## ⚙️ Tecnologias Utilizadas

- **MySQL** (sintaxe padrão)
- Modelagem baseada em notação Entidade-Relacionamento

## 💡 Como Usar

1. Faça o clone deste repositório:
   ```bash
   git clone https://github.com/seu-usuario/ecommerce-database.git
   ```
2. Importe o arquivo `ecommerce_schema.sql` no seu banco de dados MySQL:
   ```sql
   SOURCE caminho/para/ecommerce_schema.sql;
   ```

## ✍️ Observações

- Este projeto é um modelo inicial e pode ser expandido com tabelas como: categorias de produto, cupons de desconto, usuários/admins, status detalhados de pedidos e integração com gateways de pagamento.

---

Feito com 💻 por [Seu Nome]
