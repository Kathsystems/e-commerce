CREATE TABLE IF NOT EXISTS `cliente` (
	`idcliente` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(45) NOT NULL,
	`identificacao` varchar(45) NOT NULL,
	`endereco` varchar(45) NOT NULL,
	PRIMARY KEY (`idcliente`)
);

CREATE TABLE IF NOT EXISTS `pedido` (
	`idpedido` int AUTO_INCREMENT NOT NULL,
	`status_pedido` varchar(45) NOT NULL,
	`descricao` varchar(255) NOT NULL,
	`cliente_idcliente` int NOT NULL,
	`frete` float NOT NULL,
	`status_frete` varchar(45) NOT NULL,
	`código_rastreio_frete` varchar(45) NOT NULL,
	PRIMARY KEY (`idpedido`)
);

CREATE TABLE IF NOT EXISTS `produto` (
	`idproduto` int AUTO_INCREMENT NOT NULL,
	`categoria` varchar(45) NOT NULL,
	`descricao` varchar(255) NOT NULL,
	`valor` decimal(10,2) NOT NULL,
	PRIMARY KEY (`idproduto`)
);

CREATE TABLE IF NOT EXISTS `relacao_produto_pedido` (
	`produto_idproduto` int NOT NULL,
	`pedido_idpedido` int NOT NULL,
	`quantidade` varchar(45) NOT NULL,
	PRIMARY KEY (`produto_idproduto`, `pedido_idpedido`)
);

CREATE TABLE IF NOT EXISTS `terceiro_vendedor` (
	`idterceiro_vendedor` int AUTO_INCREMENT NOT NULL,
	`razao_social` varchar(45) NOT NULL,
	`local` varchar(45) NOT NULL,
	PRIMARY KEY (`idterceiro_vendedor`)
);

CREATE TABLE IF NOT EXISTS `fornecedor` (
	`idfornecedor` int AUTO_INCREMENT NOT NULL,
	`nome_razao_social` varchar(45) NOT NULL,
	`cnpj_pf` varchar(45) NOT NULL,
	PRIMARY KEY (`idfornecedor`)
);

CREATE TABLE IF NOT EXISTS `estoque` (
	`idestoque` int AUTO_INCREMENT NOT NULL,
	`local` varchar(45) NOT NULL,
	PRIMARY KEY (`idestoque`)
);

CREATE TABLE IF NOT EXISTS `produto_has_estoque` (
	`produto_idproduto` int NOT NULL,
	`estoque_idestoque` int NOT NULL,
	`quantidade` int NOT NULL,
	PRIMARY KEY (`produto_idproduto`, `estoque_idestoque`)
);

CREATE TABLE IF NOT EXISTS `disponibilizando_um_produto` (
	`fornecedor_idfornecedor` int NOT NULL,
	`produto_idproduto` int NOT NULL,
	PRIMARY KEY (`fornecedor_idfornecedor`, `produto_idproduto`)
);

CREATE TABLE IF NOT EXISTS `pagamento` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`pedido_idpedido` int NOT NULL,
	`forma_pagamento` varchar(45) NOT NULL,
	PRIMARY KEY (`id`)
);


ALTER TABLE `pedido` ADD CONSTRAINT `pedido_fk3` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente`(`idcliente`);

ALTER TABLE `relacao_produto_pedido` ADD CONSTRAINT `relacao_produto_pedido_fk0` FOREIGN KEY (`produto_idproduto`) REFERENCES `produto`(`idproduto`);

ALTER TABLE `relacao_produto_pedido` ADD CONSTRAINT `relacao_produto_pedido_fk1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido`(`idpedido`);



ALTER TABLE `produto_has_estoque` ADD CONSTRAINT `produto_has_estoque_fk0` FOREIGN KEY (`produto_idproduto`) REFERENCES `produto`(`idproduto`);

ALTER TABLE `produto_has_estoque` ADD CONSTRAINT `produto_has_estoque_fk1` FOREIGN KEY (`estoque_idestoque`) REFERENCES `estoque`(`idestoque`);
ALTER TABLE `disponibilizando_um_produto` ADD CONSTRAINT `disponibilizando_um_produto_fk0` FOREIGN KEY (`fornecedor_idfornecedor`) REFERENCES `fornecedor`(`idfornecedor`);

ALTER TABLE `disponibilizando_um_produto` ADD CONSTRAINT `disponibilizando_um_produto_fk1` FOREIGN KEY (`produto_idproduto`) REFERENCES `produto`(`idproduto`);
ALTER TABLE `pagamento` ADD CONSTRAINT `pagamento_fk1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido`(`idpedido`);