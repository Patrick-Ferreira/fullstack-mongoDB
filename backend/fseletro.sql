CREATE DATABASE IF NOT EXISTS `fseletro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fseletro`;



CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `preco` decimal(8,2) DEFAULT NULL,
  `precofinal` decimal(8,2) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `produtos` (`categoria`, `descricao`, `preco`, `precofinal`, `imagem`) VALUES
('geladeira', 'Geladeira Frost Free Brastemp Side Inverse 540 litros', '6389.00', '5019.00', './imagens/Geladeira_Brastemp.jpeg'),
('geladeira', 'Geladeira Frost Free Brastemp Branca 375 litros', '2068.60', '1910.90', './imagens/Refrigerador_brastemp.jpeg'),
('geladeira', 'Geladeira Frost Free Consul Prata 340 litros', '2199.90', '2069.00', './imagens/Geladeira_Consul.jpeg'),
('fogao', 'Fogão 4 Bocas Consul Inox com Mesa de Vidro', '1209.90', '1129.00', './imagens/Fogao_consul.jpeg'),
('fogao', 'Fogão de Piso 4 Bocas Atlas Monaco com Atendimento Automático', '609.90', '519.70', './imagens/fogao_Atlas_monaco.jpeg'),
('microondas', 'Micro-ondas Consul 32 Litros Inox 220V', '580.90', '409.88', './imagens/microondas_consul.jpeg'),
('microondas', 'Microondas 25L Espelhado Philco 220V', '508.70', '464.53', './imagens/microondas_Philco.jpeg'),
('microondas', 'Forno de Microondas Electrolux 20L Branco', '459.90', '436.05', './imagens/Microondas_Eletrolux.jpeg'),
('lavalouca', 'Lava-Louça Electrolux Inox com 10 Serviços, 06 Programas de Lavagens.', '3599.00', '2799.90', './imagens/lava_louca_eletrolux.jpeg'),
('lavalouca', 'Lava Louça Compacta 8 Serviços Branca 127V Brastemp', '1970.50', '1730.61', './imagens/lava_louca_compacta.jpeg'),
('lavadora', 'Lavadora de Roupas Brastemp 11 kg com Turbo Perfomance Branca', '1699.00', '1214.00', './imagens/Lavadora_brastemp.jpeg'),
('lavadora', 'Lavadora de Roupas Philco Inverter 12KG', '2399.90', '2179.90', './imagens/lavadora_philco.jpeg');

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `nome_cliente` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pedidos` (`id_pedido`, `produto_id`, `quantidade`, `nome_cliente`) VALUES
(1, 12, 70, 'Patrick'),
(2, 5, 60, 'Jessica'),
(3, 8, 15, 'Amanda'),
(4, 6, 28, 'Pedro');
(5, 3, 48, 'Jose');




CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `mensagem` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `comentarios` (`id`, `nome`, `mensagem`, `data`) VALUES
(10, 'Patrick Ferreira', 'Estou muito satisfeito', '2020-10-31 10:43:46'),
(12, 'Maria', 'Chegou Muito Rapido!', '2020-11-07 09:21:20');

--- SELECAO JOIN ENTRE A TABELA PEDIDOS E PRODUTOS
SELECT * FROM pedidos JOIN produto ON pedidos.produto_id = produtos.idproduto;

--- BUSCA DE CAMPOS ESPECÍFICOS COM JOIN
SELECT id_pedido, nome_cliente, quantidade, descricao from pedidos JOIN produto on pedidos.produto_id;

------------------------------
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `FK_pedido` (`produto_id`);

ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`),
  ADD UNIQUE KEY `imagem` (`imagem`);

ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_pedido` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`idproduto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

