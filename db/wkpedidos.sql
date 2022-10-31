-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 31-Out-2022 às 14:35
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wkpedidos`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ApagarItem` (IN `piditem` INTEGER)  BEGIN
	Delete from pedidosprodutos 
 	wHERE iditem = piditem;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spInserePedidosprodutos` (IN `pcodigoproduto` INTEGER, `pnumeropedido` INTEGER, `pqtde` INTEGER, `pvalor_unitario` DECIMAL(15,2))  BEGIN
/* Abaixo fica a declaração da variavel excessao que sera um
  inteiro pequeno e é inicializada com 0;
  A segunda linha declare indica que quando ocorrer alguma excessão em
  algum comando, essa variável excessao será preenchida com o valor 1, tornando
  possivel verificar se houve algum problema.
*/
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;

/* Aqui verificamos se os parâmetros não estão vazios, para não inserirmos
  campos em branco no banco.
  Caso ambos estejam preenchidos, inicio a transaction com o comando
  START TRANSACTION.
*/
 if (pcodigoproduto <> "" and pnumeropedido <> "" and pqtde <> "" and pvalor_unitario <> "" ) then

    START TRANSACTION;

    /* aqui inserimos o nome passado por parâmetro na tabela cliente */
    
    INSERT INTO pedidosprodutos(numeropedido, codigoproduto, qtde,valor_unitario) VALUES(pnumeropedido, pcodigoproduto, pqtde, pvalor_unitario);

    /* Caso a variavel contenha 1, ou seja, caso tenha ocorrido algum erro
      Retornamos uma mensagem de erro, atravez da variavel Msg, e logo em
      seguida executamos o comando ROLLBACK.
      Esse comando que é o responsavel por desfazer toda e qualquer
      alteração que tenhamos feito no banco.
    */
    IF excessao = 1
    THEN
      SELECT 'Erro ao inserir na tabela pedidosprodutos' AS Msg;
      ROLLBACK;
    ELSE
      /* Caso excessao ainda seja 0, ele continua aqui, onde executamos
      o proximo comando cuja função é retornar o ultimo ID(chave primaria)
      que foi inserido na tabela cliente e o guarda na variavel @idCliente
      */
      SELECT DISTINCT LAST_INSERT_ID() INTO @iditem FROM pedidosprodutos;
      /* De novo, caso tenha ocorrido erro, imprime mensagem e execura
      um ROLLBACK */
      IF excessao = 1
      THEN
        SELECT 'Erro ao selecionar o ultim ID inserido' AS Msg;
        ROLLBACK;
      ELSE
        /* Aqui iremos inserir os dados na tabela endereco, utilizando a
        variavel com o id do ultimo cliente inserido, que pegamos no
        comando SELECT acima, e tambem o parametro contendo a rua.
        */
       COMMIT;
        
      END IF;
    END IF;
  ELSE
    /* Como estão faltando parametros, estão vazios, imprime-se a mensagem
     a seguir.*/
    SELECT 'Parametros necessarios' AS Msg;
  END IF;

/* aqui finalizamos a procedure*/
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatepedidosprodutos` (IN `pqtde` INTEGER, `pvalor_unitario` DECIMAL(15,2), `piditem` INTEGER)  BEGIN
	update pedidosprodutos set qtde=pqtde,valor_unitario=pvalor_unitario
 	
	WHERE iditem = piditem;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`codigo`, `nome`, `cidade`, `uf`) VALUES
(1, 'CLIENTE 01', 'SAO PAULO', 'SP'),
(2, 'CLIENTE 02', 'SAO PAULO', 'SP'),
(3, 'CLIENTE 03', 'SAO PAULO', 'SP'),
(4, 'CLIENTE 04', 'SAO PAULO', 'SP'),
(5, 'CLIENTE 05', 'SAO PAULO', 'SP'),
(6, 'CLIENTE 06', 'SAO PAULO', 'SP'),
(7, 'CLIENTE 07', 'SAO PAULO', 'SP'),
(8, 'CLIENTE 08', 'SAO PAULO', 'SP'),
(9, 'CLIENTE 09', 'SAO PAULO', 'SP'),
(10, 'CLIENTE 10', 'SAO PAULO', 'SP'),
(11, 'CLIENTE 11', 'RIO DE JANEIRO', 'RJ'),
(12, 'CLIENTE 12', 'RIO DE JANEIRO', 'RJ'),
(13, 'CLIENTE 13', 'RIO DE JANEIRO', 'RJ'),
(14, 'CLIENTE 14', 'RIO DE JANEIRO', 'RJ'),
(15, 'CLIENTE 15', 'RIO DE JANEIRO', 'RJ'),
(16, 'CLIENTE 16', 'RIO DE JANEIRO', 'RJ'),
(17, 'CLIENTE 17', 'RIO DE JANEIRO', 'RJ'),
(18, 'CLIENTE 18', 'RIO DE JANEIRO', 'RJ'),
(19, 'CLIENTE 19', 'RIO DE JANEIRO', 'RJ'),
(20, 'CLIENTE 20', 'RIO DE JANEIRO', 'RJ'),
(21, 'CLIENTE 21', 'RIO DE JANEIRO', 'RJ'),
(22, 'CLIENTE 22', 'RIO DE JANEIRO', 'RJ'),
(23, 'CLIENTE 23', 'RIO DE JANEIRO', 'RJ'),
(24, 'CLIENTE 24', 'RIO DE JANEIRO', 'RJ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `numeropedido` int(11) NOT NULL,
  `dataemissao` datetime NOT NULL,
  `codigocliente` int(11) NOT NULL,
  `valortotal` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidosprodutos`
--

CREATE TABLE `pedidosprodutos` (
  `iditem` int(11) NOT NULL,
  `numeropedido` int(11) NOT NULL,
  `codigoproduto` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor_unitario` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `codigoproduto` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `precovenda` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`codigoproduto`, `descricao`, `precovenda`) VALUES
(1, 'produto 01', '1.00'),
(2, 'produto 02', '2.00'),
(3, 'produto 03', '3.00'),
(4, 'produto 04', '4.00'),
(5, 'produto 05', '5.00'),
(6, 'produto 06', '6.00'),
(7, 'produto 07', '7.00'),
(8, 'produto 08', '8.00'),
(9, 'produto 09', '9.00'),
(10, 'produto 10', '10.00'),
(11, 'produto 11', '11.00'),
(12, 'produto 12', '12.00'),
(13, 'produto 13', '13.00'),
(14, 'produto 14', '14.00'),
(15, 'produto 15', '15.00'),
(16, 'produto 16', '16.00'),
(17, 'produto 17', '17.00'),
(18, 'produto 18', '18.00'),
(19, 'produto 19', '19.00'),
(20, 'produto 20', '20.00'),
(21, 'produto 21', '21.00'),
(22, 'produto 22', '22.00'),
(23, 'produto 23', '23.00'),
(24, 'produto 24', '24.00'),
(25, 'produto 25', '25.00'),
(31, 'produto 31', '31.00'),
(32, 'produto 32', '32.00'),
(33, 'produto 33', '33.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `iclientesnome` (`nome`),
  ADD KEY `iclientescidade` (`cidade`),
  ADD KEY `iclientesuf` (`uf`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`numeropedido`),
  ADD KEY `ipedidoscliente` (`codigocliente`),
  ADD KEY `ipedidosdataemissao` (`dataemissao`);

--
-- Indexes for table `pedidosprodutos`
--
ALTER TABLE `pedidosprodutos`
  ADD PRIMARY KEY (`iditem`),
  ADD UNIQUE KEY `ipedidosprodutositem` (`numeropedido`,`iditem`),
  ADD KEY `ipedidosprodutos` (`numeropedido`,`codigoproduto`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`codigoproduto`),
  ADD UNIQUE KEY `iprodutosdescricao` (`descricao`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `numeropedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedidosprodutos`
--
ALTER TABLE `pedidosprodutos`
  MODIFY `iditem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `codigoproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
