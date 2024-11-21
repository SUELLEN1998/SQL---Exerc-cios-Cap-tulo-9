
-- **** Laboratório 2 **** 

---A – Trabalhando com colunas computadas

--1.Coloque o banco PEDIDOS em uso;
 USE PEDIDOS 
 
 
/*2.Crie a tabela TB_FUNC_IDADE  com os campos:- Id_funcionario  inteiro, auto numerável e chave 
primária- Nome do funcionário alfanumérico com 50 caracteres- Data de Nascimento Campo data- Idade     Campo calculado
 */
 GO
 CREATE TABLE TB_FUNC_IDADE 
(
 Id_funcionario INT IDENTITY(1,1) PRIMARY KEY
 ,FUNCIONARIO VARCHAR(50) 
,Data_Nascimento DATETIME
 ,Idade AS CAST(FLOOR(CAST(GETDATE()- data_nascimento AS 
FLOAT)/365.25) AS INT )
 )

--3. Insira os dados da tabela de empregados para a tabela TB_FUNC_IDADE;
 INSERT INTO TB_FUNC_IDADE
 SELECT NOME, DATA_NASCIMENTO FROM TB_EMPREGADO

 
--4. Consulte as informações e verifique o campo calculado.
 SELECT * FROM TB_FUNC_IDADE

 
--5. Adicione o campo VLR_ITEM na tabela TB_ITENSPEDIDO, com o cálculo abaixo:
 /*
 PR_UNITARIO * QUANTIDADE * (1 - DESCONTO /100)*/
 ALTER TABLE TB_ITENSPEDIDO ADD
 VLR_ITEM AS PR_UNITARIO * QUANTIDADE * (1 - DESCONTO /100)

 
--6. Faça uma consulta na tabela e verifique o resultado.
 SELECT * FROM TB_ITENSPEDIDO

