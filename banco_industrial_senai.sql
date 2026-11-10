-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 10/11/2026 às 13:55
-- Versão do servidor: 8.0.42-0ubuntu0.24.04.1
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_industrial_senai`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `componentes_maq`
--

CREATE TABLE `componentes_maq` (
  `id_componente` int NOT NULL,
  `id_maquina` int NOT NULL,
  `nome_componente` varchar(100) NOT NULL,
  `horas_uso_acumulado` int NOT NULL,
  `limite_horas_alerta` int NOT NULL
) ;

--
-- Despejando dados para a tabela `componentes_maq`
--

INSERT INTO `componentes_maq` (`id_componente`, `id_maquina`, `nome_componente`, `horas_uso_acumulado`, `limite_horas_alerta`) VALUES
(1, 1, 'Motor principal', 320, 500),
(2, 2, 'Correia transportadora', 280, 300),
(3, 3, 'Sistema hidraulico', 150, 400),
(4, 4, 'Braco robotico', 450, 600),
(5, 5, 'Filtro de ar', 200, 250);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque_pecas`
--

CREATE TABLE `estoque_pecas` (
  `id_peca` int NOT NULL,
  `codigo_part_number` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `qtd_estoque` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ;

--
-- Despejando dados para a tabela `estoque_pecas`
--

INSERT INTO `estoque_pecas` (`id_peca`, `codigo_part_number`, `descricao`, `qtd_estoque`, `preco_unitario`) VALUES
(1, 'MOT-100', 'Motor eletrico', 10, 850.00),
(2, 'COR-200', 'Correia industrial', 25, 120.50),
(3, 'FIL-300', 'Filtro de ar', 40, 35.90),
(4, 'SEN-400', 'Sensor de temperatura', 15, 210.00),
(5, 'ROL-500', 'Rolamento industrial', 30, 78.75);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_sensores`
--

CREATE TABLE `historico_sensores` (
  `id_leitura` int NOT NULL,
  `id_ordem` int NOT NULL,
  `temperatura_medida` decimal(5,2) NOT NULL,
  `vibracao_mm_s` decimal(5,2) NOT NULL,
  `data_hora_leitura` datetime NOT NULL,
  `prompt_geracao_ia` varchar(100) DEFAULT 'GERADO_POR_LLM'
) ;

--
-- Despejando dados para a tabela `historico_sensores`
--

INSERT INTO `historico_sensores` (`id_leitura`, `id_ordem`, `temperatura_medida`, `vibracao_mm_s`, `data_hora_leitura`, `prompt_geracao_ia`) VALUES
(1, 1, 65.50, 2.30, '2026-10-01 08:30:00', 'GERADO_POR_LLM'),
(2, 2, 82.10, 4.75, '2026-10-03 10:00:00', 'GERADO_POR_LLM'),
(3, 3, 70.25, 3.10, '2026-10-05 10:45:00', 'GERADO_POR_LLM'),
(4, 4, 58.90, 1.85, '2026-10-07 13:30:00', 'GERADO_POR_LLM'),
(5, 5, 91.40, 5.20, '2026-10-09 15:00:00', 'GERADO_POR_LLM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `linhas_producao`
--

CREATE TABLE `linhas_producao` (
  `id_linha` int NOT NULL,
  `id_unidade` int NOT NULL,
  `nome_linha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `linhas_producao`
--

INSERT INTO `linhas_producao` (`id_linha`, `id_unidade`, `nome_linha`) VALUES
(1, 1, 'Montagem Industrial'),
(2, 2, 'Usinagem'),
(3, 3, 'Pintura'),
(4, 4, 'Embalagem'),
(5, 5, 'Controle de Qualidade');

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinas_senai`
--

CREATE TABLE `maquinas_senai` (
  `id_maquina` int NOT NULL,
  `id_linha` int NOT NULL,
  `id_tipo` int NOT NULL,
  `tag_patrimonio` varchar(30) NOT NULL,
  `data_aquisicao` date NOT NULL,
  `status_operacao` varchar(20) NOT NULL
) ;

--
-- Despejando dados para a tabela `maquinas_senai`
--

INSERT INTO `maquinas_senai` (`id_maquina`, `id_linha`, `id_tipo`, `tag_patrimonio`, `data_aquisicao`, `status_operacao`) VALUES
(1, 1, 1, 'PAT-0001', '2022-03-15', 'ATIVA'),
(2, 2, 2, 'PAT-0002', '2021-07-20', 'MANUTENCAO'),
(3, 3, 3, 'PAT-0003', '2023-01-10', 'ATIVA'),
(4, 4, 4, 'PAT-0004', '2020-11-05', 'ATIVA'),
(5, 5, 5, 'PAT-0005', '2024-02-18', 'DESATIVADA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordens_servico`
--

CREATE TABLE `ordens_servico` (
  `id_ordem` int NOT NULL,
  `id_maquina` int NOT NULL,
  `id_tecnico` int NOT NULL,
  `data_abertura` datetime NOT NULL,
  `tipo_manutencao` varchar(20) NOT NULL,
  `status_os` varchar(20) NOT NULL
) ;

--
-- Despejando dados para a tabela `ordens_servico`
--

INSERT INTO `ordens_servico` (`id_ordem`, `id_maquina`, `id_tecnico`, `data_abertura`, `tipo_manutencao`, `status_os`) VALUES
(1, 1, 1, '2026-10-01 08:00:00', 'PREVENTIVA', 'CONCLUIDA'),
(2, 2, 2, '2026-10-03 09:30:00', 'CORRETIVA', 'EM_ANDAMENTO'),
(3, 3, 3, '2026-10-05 10:15:00', 'PREDITIVA', 'ABERTA'),
(4, 4, 4, '2026-10-07 13:00:00', 'PREVENTIVA', 'CONCLUIDA'),
(5, 5, 5, '2026-10-09 14:45:00', 'CORRETIVA', 'CANCELADA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pecas_os`
--

CREATE TABLE `pecas_os` (
  `id_ordem` int NOT NULL,
  `id_peca` int NOT NULL,
  `qtd_utilizada` int NOT NULL,
  `preco_aplicado` decimal(10,2) NOT NULL
) ;

--
-- Despejando dados para a tabela `pecas_os`
--

INSERT INTO `pecas_os` (`id_ordem`, `id_peca`, `qtd_utilizada`, `preco_aplicado`) VALUES
(1, 1, 1, 850.00),
(2, 2, 2, 120.50),
(3, 4, 1, 210.00),
(4, 5, 2, 78.75),
(5, 3, 1, 35.90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id_tecnico` int NOT NULL,
  `nome_tecnico` varchar(100) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  `nivel_certificacao` varchar(30) NOT NULL
) ;

--
-- Despejando dados para a tabela `tecnicos`
--

INSERT INTO `tecnicos` (`id_tecnico`, `nome_tecnico`, `especialidade`, `nivel_certificacao`) VALUES
(1, 'Carlos Oliveira', 'Mecanica', 'SENIOR'),
(2, 'Mariana Santos', 'Eletrica', 'PLENO'),
(3, 'Joao Pereira', 'Automacao', 'SPECIALIST'),
(4, 'Ana Costa', 'Hidraulica', 'JUNIOR'),
(5, 'Pedro Almeida', 'Mecanica Industrial', 'PLENO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_maquina`
--

CREATE TABLE `tipos_maquina` (
  `id_tipo` int NOT NULL,
  `nome_tipo` varchar(50) NOT NULL,
  `horas_revisao_padrao` int NOT NULL
) ;

--
-- Despejando dados para a tabela `tipos_maquina`
--

INSERT INTO `tipos_maquina` (`id_tipo`, `nome_tipo`, `horas_revisao_padrao`) VALUES
(1, 'Torno CNC', 500),
(2, 'Esteira Transportadora', 300),
(3, 'Prensa Hidraulica', 400),
(4, 'Robo Industrial', 600),
(5, 'Compressor', 250);

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades_senai`
--

CREATE TABLE `unidades_senai` (
  `id_unidade` int NOT NULL,
  `nome_unidade` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `unidades_senai`
--

INSERT INTO `unidades_senai` (`id_unidade`, `nome_unidade`, `cidade`) VALUES
(1, 'SENAI Curitiba', 'Curitiba'),
(2, 'SENAI Sao Paulo', 'Sao Paulo'),
(3, 'SENAI Campinas', 'Campinas'),
(4, 'SENAI Joinville', 'Joinville'),
(5, 'SENAI Londrina', 'Londrina');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `componentes_maq`
--
ALTER TABLE `componentes_maq`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `id_maquina` (`id_maquina`);

--
-- Índices de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  ADD PRIMARY KEY (`id_peca`),
  ADD UNIQUE KEY `codigo_part_number` (`codigo_part_number`);

--
-- Índices de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD PRIMARY KEY (`id_leitura`),
  ADD KEY `id_ordem` (`id_ordem`);

--
-- Índices de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD PRIMARY KEY (`id_linha`),
  ADD KEY `id_unidade` (`id_unidade`);

--
-- Índices de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD PRIMARY KEY (`id_maquina`),
  ADD UNIQUE KEY `tag_patrimonio` (`tag_patrimonio`),
  ADD KEY `id_linha` (`id_linha`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Índices de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD PRIMARY KEY (`id_ordem`),
  ADD KEY `id_maquina` (`id_maquina`),
  ADD KEY `id_tecnico` (`id_tecnico`);

--
-- Índices de tabela `pecas_os`
--
ALTER TABLE `pecas_os`
  ADD PRIMARY KEY (`id_ordem`,`id_peca`),
  ADD KEY `id_peca` (`id_peca`);

--
-- Índices de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- Índices de tabela `tipos_maquina`
--
ALTER TABLE `tipos_maquina`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `componentes_maq`
--
ALTER TABLE `componentes_maq`
  MODIFY `id_componente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  MODIFY `id_peca` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  MODIFY `id_leitura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  MODIFY `id_linha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  MODIFY `id_maquina` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  MODIFY `id_ordem` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id_tecnico` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipos_maquina`
--
ALTER TABLE `tipos_maquina`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  MODIFY `id_unidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `componentes_maq`
--
ALTER TABLE `componentes_maq`
  ADD CONSTRAINT `componentes_maq_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`);

--
-- Restrições para tabelas `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD CONSTRAINT `historico_sensores_ibfk_1` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`);

--
-- Restrições para tabelas `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD CONSTRAINT `linhas_producao_ibfk_1` FOREIGN KEY (`id_unidade`) REFERENCES `unidades_senai` (`id_unidade`);

--
-- Restrições para tabelas `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD CONSTRAINT `maquinas_senai_ibfk_1` FOREIGN KEY (`id_linha`) REFERENCES `linhas_producao` (`id_linha`),
  ADD CONSTRAINT `maquinas_senai_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_maquina` (`id_tipo`);

--
-- Restrições para tabelas `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD CONSTRAINT `ordens_servico_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`),
  ADD CONSTRAINT `ordens_servico_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`);

--
-- Restrições para tabelas `pecas_os`
--
ALTER TABLE `pecas_os`
  ADD CONSTRAINT `pecas_os_ibfk_1` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`),
  ADD CONSTRAINT `pecas_os_ibfk_2` FOREIGN KEY (`id_peca`) REFERENCES `estoque_pecas` (`id_peca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
