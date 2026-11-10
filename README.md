Banco de Dados Industrial — SENAI 2026

Sobre o projeto

Projeto trimestral de conclusão do Curso Técnico em Desenvolvimento de
Sistemas do SENAI. O objetivo é implementar um banco de dados para
organizar unidades, linhas de produção, máquinas, técnicos, ordens de
serviço, peças e leituras de sensores.

Estrutura do banco de dados

O banco contém 10 tabelas:

1. UNIDADES_SENAI — cadastro das unidades do SENAI.
2. LINHAS_PRODUCAO — linhas de produção vinculadas às unidades.
3. TIPOS_MAQUINA — tipos de máquinas e horas padrão para revisão.
4. MAQUINAS_SENAI — máquinas vinculadas às linhas e aos tipos de
máquina.
5. COMPONENTES_MAQ — componentes associados às máquinas.
6. TECNICOS — cadastro dos técnicos e níveis de certificação.
7. ORDENS_SERVICO — ordens de manutenção e técnicos responsáveis.
8. ESTOQUE_PECAS — cadastro e controle de peças em estoque.
9. PECAS_OS — associação entre ordens de serviço e peças
utilizadas.
10. HISTORICO_SENSORES — leituras de temperatura e vibração
associadas às ordens.

Relacionamentos

• Uma unidade pode possuir várias linhas de produção.
• Uma linha de produção pode possuir várias máquinas.
• Um tipo de máquina pode estar associado a várias máquinas.
• Uma máquina pode possuir vários componentes e várias ordens de
serviço.
• Um técnico pode ser responsável por várias ordens de serviço.
• Uma ordem de serviço pode utilizar várias peças, e uma peça pode ser
utilizada em várias ordens. A tabela PECAS_OS representa esse
relacionamento muitos-para-muitos.
• Uma ordem de serviço pode possuir várias leituras de sensores.

Tecnologias e recursos

• MySQL 8.0.16 ou superior.
• SQL: DDL e DML.
• Chaves primárias (PRIMARY KEY) e estrangeiras (FOREIGN KEY).
• Restrições NOT NULL, UNIQUE, CHECK e DEFAULT.
• Relacionamentos 1:N e N:M.

Como executar

1. Abra o MySQL Workbench.
2. Abra o arquivo banco_industrial_senai.sql.
3. Execute o script no MySQL.
4. O script cria o banco banco_industrial_senai, cria as 10 tabelas e
insere os registros iniciais.

Arquivo principal: banco_industrial_senai.sql

────────

Projeto acadêmico — SENAI 2026
Curso Técnico em Desenvolvimento de Sistemas
