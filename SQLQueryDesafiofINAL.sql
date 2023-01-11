create database desafio;
use desafio;
create schema producao;


 

create table producao.produtos(
	cd_produto INT PRIMARY KEY identity (1, 1),
	nm_produto varchar(50) NOT NULL,

);

create table producao.fabricacao(
	cd_linha 		INT  	NOT NULL,
	aa_producao 	DATE 	NOT NULL,
	qt_linha 		INT 	NOT NULL,
	cd_produto 		INT 	NOT NULL,
	PRIMARY KEY (cd_linha, aa_producao, qt_linha),
	FOREIGN KEY (cd_produto) REFERENCES producao.produtos(cd_produto)
);

create table producao.inspetores(
	cd_matricula INT PRIMARY KEY identity(1, 1),
	nm_inspetor varchar(50) NOT NULL
);

create table producao.ficha_qualidade(
	cd_ficha_avaliacao INT PRIMARY KEY identity(1, 1),
	cd_inspetor INT NOT NULL,
	dt_inspecao DATE,
	FOREIGN KEY (cd_inspetor) REFERENCES producao.inspetores (cd_matricula)
);

create table producao.categoria_avaliacao(
	sg_avaliacao varchar(5) PRIMARY KEY,
	nm_avaliacao varchar(30) NOT NULL
);

create table producao.avaliacao_qualidade(
	cd_avaliacao			INT			PRIMARY KEY identity(1, 1),
	cd_linha				INT			NOT NULL, --FK
	aa_producao				DATE	    NOT NULL, --FK
	qt_producao_linha		INT			NOT NULL, --FK
	sg_avaliacao			varchar(5)	NOT NULL, --FK
	hr_avaliacao			TIME, 
	cd_ficha_avaliacao		INT			NOT NULL, --FK
	FOREIGN KEY (cd_linha, aa_producao, qt_producao_linha)  REFERENCES producao.fabricacao			(cd_linha, aa_producao, qt_linha),
	FOREIGN KEY (sg_avaliacao)							    REFERENCES producao.categoria_avaliacao	(sg_avaliacao),
	FOREIGN KEY (cd_ficha_avaliacao)					    REFERENCES producao.ficha_qualidade		(cd_ficha_avaliacao)
);



-- INSERT CATEGORIAS DE AVALIAÇÃO
INSERT producao.categoria_avaliacao (sg_avaliacao, nm_avaliacao)
									VALUES	
									('OK', 'Liberado')
								   ,('EL', 'Problema elétrico')
								   ,('PT', 'Problema de pintura')
								   ,('PE', 'Problema de estrutura')
								   ,('TR', 'Todo Rejeitado');

-- INSERT TIPOS DE PRODUTOS
INSERT producao.produtos (nm_produto)
							 VALUES
							 ('Geladeira')
							,('Máquina de lavar')
							,('Fogão')
							,('Freezer')
							,('Frigobar');

-- INSERT INSPETORES
INSERT producao.inspetores(nm_inspetor)
						   VALUES	
						   ('Trancoso da Silva')
						  ,('André Lopes')
						  ,('Gustavo Pereira')
						  ,('Matheus Balan')
						  ,('Douglas Costa')
						  ,('Mauricio Dantas')
						  ,('Osvaldo Marques')
						  ,('Amarildo Wakin')

-- Quantidade de linhas de produção (1 - 4) -- Quantidade de tipos de produtos (1- 5)
-- INSERT PRODUTOS FABRICADOS	
INSERT producao.fabricacao(cd_linha, aa_producao, qt_linha, cd_produto)
						  VALUES
						  (1, '2022-3-1', 1, 1)	
						 ,(1, '2022-3-1', 2, 1)	
						 ,(1, '2022-3-1', 3, 1)	
						 ,(1, '2022-3-1', 4, 1)	
						 ,(1, '2022-5-1', 5, 2)	
						 ,(1, '2022-5-1', 6, 2)	
						 ,(1, '2022-5-1', 7, 2)	
						 ,(1, '2022-5-1', 8, 2)	
						 ,(1, '2022-9-1', 9, 3)	
						 ,(1, '2022-9-1', 10, 3)	
						 ,(1, '2022-9-1', 11, 3)	
						 ,(1, '2022-9-1', 12, 3) 
						 ,(1, '2022-12-1', 13, 4)	
						 ,(1, '2022-12-1', 14, 4)	
						 ,(1, '2022-12-1', 15, 4)	
						 ,(1, '2022-12-1', 16, 4)
						 ,(1, '2022-1-1', 17, 5) --TRANCOSO	1
						 ,(1, '2022-1-1', 18, 5) --TRANCOSO	5
						 ,(1, '2022-1-1', 19, 5)	
						 ,(1, '2022-1-1', 20, 5)	
						 ,(1, '2022-1-1', 21, 5)-- checkpoint 		
						 ,(1, '2022-1-1', 22, 5) --TRANCOSO 6 

						 ,(2, '2021-2-1', 1, 1)	
						 ,(2, '2021-2-1', 2, 1)	
						 ,(2, '2021-2-1', 3, 1)	
						 ,(2, '2021-2-1', 4, 1)	
						 ,(2, '2021-4-1', 5, 2)	
						 ,(2, '2021-4-1', 6, 2)	
						 ,(2, '2021-4-1', 7, 2)	
						 ,(2, '2021-4-1', 8, 2)	
						 ,(2, '2021-6-1', 9, 3)	
						 ,(2, '2021-6-1', 10, 3)	
						 ,(2, '2021-6-1', 11, 3) 
						 ,(2, '2021-6-1', 12, 3) -- CHECKPOINT		
						 ,(2, '2021-8-1', 13, 4)	
						 ,(2, '2021-8-1', 14, 4)	
						 ,(2, '2021-8-1', 15, 4)	
						 ,(2, '2021-8-1', 16, 4)	
						 ,(2, '2021-10-1', 17, 5)	
						 ,(2, '2021-10-1', 18, 5)	
						 ,(2, '2021-10-1', 19, 5)	
						 ,(2, '2021-10-1', 20, 5)	
						 ,(2, '2021-10-1', 21, 5)	
						 ,(2, '2021-10-1', 22, 5)

						 ,(3, '2020-1-1', 1, 1)	
						 ,(3, '2020-1-1', 2, 1)	-- CHECKPOINT
						 ,(3, '2020-1-1', 3, 1)	
						 ,(3, '2020-1-1', 4, 1)	
						 ,(3, '2020-3-1', 5, 2)	
						 ,(3, '2020-3-1', 6, 2)	
						 ,(3, '2020-3-1', 7, 2)	
						 ,(3, '2020-3-1', 8, 2)	
						 ,(3, '2020-5-1', 9, 3)	
						 ,(3, '2020-5-1', 10, 3)	
						 ,(3, '2020-5-1', 11, 3)	
						 ,(3, '2020-5-1', 12, 3)	
						 ,(3, '2020-7-1', 13, 4)	
						 ,(3, '2020-7-1', 14, 4)	
						 ,(3, '2020-7-1', 15, 4)	
						 ,(3, '2022-12-16', 16, 4) --TRANCOSO	4
						 ,(3, '2020-9-1', 17, 5)	
						 ,(3, '2020-9-1', 18, 5)	
						 ,(3, '2022-9-1', 19, 5) --TRANCOSO	3
						 ,(3, '2020-9-1', 20, 5)	
						 ,(3, '2020-9-1', 21, 5)	
						 ,(3, '2020-9-1', 22, 5)

						 ,(4, '2019-12-1', 1, 1)	
						 ,(4, '2019-12-1', 2, 1)	
						 ,(4, '2019-12-1', 3, 1)	
						 ,(4, '2019-12-1', 4, 1)	
						 ,(4, '2019-2-1', 5, 2)	
						 ,(4, '2019-2-1', 6, 2)	
						 ,(4, '2019-2-1', 7, 2)	
						 ,(4, '2019-2-1', 8, 2)	
						 ,(4, '2019-4-1', 9, 3)	
						 ,(4, '2019-4-1', 10, 3)	
						 ,(4, '2019-4-1', 11, 3)	
						 ,(4, '2019-4-1', 12, 3)	
						 ,(4, '2019-6-1', 13, 4)	
						 ,(4, '2019-6-1', 14, 4)	
						 ,(4, '2019-6-1', 15, 4)	
						 ,(4, '2019-6-1', 16, 4)	
						 ,(4, '2019-8-1', 17, 5)	
						 ,(4, '2019-8-1', 18, 5)	
						 ,(4, '2019-8-1', 19, 5)	
						 ,(4, '2022-8-1', 20, 5) --TRANCOSO	2
						 ,(4, '2019-8-1', 21, 5)	
						 ,(4, '2019-8-1', 22, 5)
						 ,(4, '2019-8-1', 23, 5)	
						 ,(4, '2019-8-1', 24, 5)

INSERT producao.ficha_qualidade(cd_inspetor, dt_inspecao)
								VALUES
							   (8, '2022-7-25')

							   ,(2, '2022-7-1')
							   ,(3, '2022-9-10')
							   ,(4, '2022-11-14')
							   ,(5, '2022-1-4')
							   ,(6, '2022-3-7')
							   ,(7, '2022-5-22')
							   ,(8, '2022-7-16')

							   ,(2, '2022-7-12')
							   ,(3, '2022-9-6')
							   ,(4, '2022-11-18')
							   ,(5, '2022-1-20')
							   ,(6, '2022-3-29')
							   ,(7, '2022-5-1')
							   ,(1, '2022-12-16')

INSERT producao.avaliacao_qualidade(cd_linha, aa_producao, qt_producao_linha, sg_avaliacao, hr_avaliacao, cd_ficha_avaliacao)
								   VALUES
								   (1, '2022-1-1', 17, 'EL', '9:50:00', 15)
								  ,(4, '2022-8-1', 20, 'OK', '9:20:00', 15) 
								  ,(3, '2022-9-1', 19, 'PT', '9:35:00', 15) 
								  ,(3, '2022-12-16', 16, 'OK', '9:50:00', 15) 
								  ,(1, '2022-1-1', 18, 'OK', '10:00:00', 15) 
								  ,(1, '2022-1-1', 22, 'OK', '10:15:00', 15)
								  ,(1, '2022-3-1', 1, 'OK', '13:00:00', 1)
								  ,(1, '2022-3-1', 2, 'OK', '13:05:00', 1)
								  ,(1, '2022-3-1', 3, 'OK', '13:10:00', 1)
								  ,(1, '2022-3-1', 4, 'OK', '13:15:00', 1)
								  ,(1, '2022-5-1', 5, 'OK', '13:20:00', 1)
								  ,(1, '2022-5-1', 6, 'OK', '13:25:00', 1)

								  ,(1, '2022-5-1', 7, 'PT', '15:20:00', 2)
								  ,(1, '2022-5-1', 8, 'PT', '15:25:00', 2)
								  ,(1, '2022-9-1', 9, 'PT', '15:30:00', 2)
								  ,(1, '2022-9-1', 10, 'PT', '15:35:00', 2)
								  ,(1, '2022-9-1', 11, 'PT', '15:40:00', 2)
								  ,(1, '2022-9-1', 12, 'PT', '15:45:00', 2)
								  ,(1, '2022-12-1', 13, 'EL', '16:00:00', 3)
								  ,(1, '2022-12-1', 14, 'EL', '16:05:00', 3)
								  ,(1, '2022-12-1', 15, 'EL', '16:10:00', 3)
								  ,(1, '2022-12-1', 16, 'EL', '16:15:00', 3)
								  ,(1, '2022-1-1', 19, 'EL', '16:20:00', 3)
								  ,(1, '2022-1-1', 20, 'EL', '16:25:00', 3)

								  ,(1, '2022-1-1', 21, 'TR', '11:00:00', 4)
								  ,(2, '2021-2-1', 1, 'PE', '11:05:00', 4)
								  ,(2, '2021-2-1', 2, 'PE', '11:10:00', 4)
								  ,(2, '2021-2-1', 3, 'TR', '11:15:00', 4)
								  ,(2, '2021-2-1', 4, 'PE', '11:20:00', 4)
								  ,(2, '2021-4-1', 5, 'PE', '11:25:00', 4)
								  ,(2, '2021-4-1', 6, 'PT', '9:00:00', 5)
								  ,(2, '2021-4-1', 7, 'TR', '9:05:00', 5)
								  ,(2, '2021-4-1', 8, 'PT', '9:10:00', 5)
								  ,(2, '2021-6-1', 9, 'PT', '9:15:00', 5)
								  ,(2, '2021-6-1', 10, 'PT', '9:20:00', 5)
								  ,(2, '2021-6-1', 11, 'PT', '9:25:00', 5)

								  ,(2, '2021-6-1', 12, 'PT', '9:30:00', 5)	
								  ,(2, '2021-8-1', 13, 'PT', '9:35:00', 6) 
								  ,(2, '2021-8-1', 14, 'PT', '9:40:00', 6) 
								  ,(2, '2021-8-1', 15, 'TR', '9:45:00', 6) 
								  ,(2, '2021-8-1', 16, 'PT', '9:50:00', 6) 
								  ,(2, '2021-10-1', 17, 'PT', '9:55:00', 6) 

								  ,(2, '2021-10-1', 18, 'OK', '11:00:00', 7) 
								  ,(2, '2021-10-1', 19, 'OK', '11:05:00', 7) 
								  ,(2, '2021-10-1', 20, 'OK', '11:10:00', 7) 
								  ,(2, '2021-10-1', 21, 'OK', '11:15:00', 7) 
								  ,(2, '2021-10-1', 22, 'OK', '11:20:00', 7)
								  ,(3, '2020-1-1', 1, 'OK', '11:25:00', 7)  

								  ,(3, '2020-1-1', 2, 'OK', '12:00:00', 8)
								  ,(3, '2020-1-1', 3, 'TR', '12:05:00', 8)
								  ,(3, '2020-1-1', 4, 'TR', '12:10:00', 8)
								  ,(3, '2020-3-1', 5, 'OK', '12:15:00', 8)
								  ,(3, '2020-3-1', 6, 'OK', '12:20:00', 8)
								  ,(3, '2020-3-1', 7, 'OK', '12:25:00', 8)
								  ,(3, '2020-3-1', 8, 'OK', '12:30:00', 9)
								  ,(3, '2020-5-1', 9, 'OK', '12:35:00', 9)
								  ,(3, '2020-5-1', 10, 'OK', '12:40:00', 9)
								  ,(3, '2020-5-1', 11, 'OK', '12:45:00', 9)
								  ,(3, '2020-5-1', 12, 'OK', '12:50:00', 9)
								  ,(3, '2020-7-1', 13, 'OK', '12:55:00', 9) 

								  ,(3, '2020-7-1', 13, 'EL', '13:00:00', 10)
								  ,(3, '2020-7-1', 14, 'EL', '13:05:00', 10)	
								  ,(3, '2020-7-1', 15, 'EL', '13:10:00', 10)	
								  ,(3, '2020-9-1', 17, 'EL', '13:15:00', 10)	
								  ,(3, '2020-9-1', 18, 'EL', '13:20:00', 10)		
                                  ,(3, '2020-9-1', 20, 'EL', '13:25:00', 10)	
								  ,(3, '2020-9-1', 21, 'OK', '14:00:00', 11)
								  ,(3, '2020-9-1', 22, 'OK', '14:05:00', 11)
								  ,(4, '2019-12-1', 1, 'OK', '14:10:00', 11)
								  ,(4, '2019-12-1', 2, 'OK', '14:15:00', 11)
								  ,(4, '2019-12-1', 3, 'OK', '14:20:00', 11)
								  ,(4, '2019-12-1', 4, 'OK', '14:25:00', 11)

								  ,(4, '2019-2-1', 5, 'PE', '15:00:00', 12)
								  ,(4, '2019-2-1', 6, 'PE', '15:05:00', 12)
								  ,(4, '2019-2-1', 7, 'PE', '15:10:00', 12)
								  ,(4, '2019-2-1', 8, 'PE', '15:15:00', 12)
								  ,(4, '2019-4-1', 9, 'PE', '15:20:00', 12)
								  ,(4, '2019-4-1', 10, 'PE', '15:25:00', 12)
								  ,(4, '2019-4-1', 11, 'PE', '15:30:00', 13)
								  ,(4, '2019-4-1', 12, 'PE', '15:35:00', 13)
								  ,(4, '2019-6-1', 13, 'PE', '15:40:00', 13)
								  ,(4, '2019-6-1', 14, 'PE', '15:45:00', 13)
								  ,(4, '2019-6-1', 15, 'PE', '15:50:00', 13)
								  ,(4, '2019-6-1', 16, 'PE', '15:55:00', 13)

								 ,(4, '2019-8-1', 17, 'TR', '11:30:00', 14)
								 ,(4, '2019-8-1', 18, 'TR', '11:35:00', 14)
								 ,(4, '2019-8-1', 19, 'TR', '11:40:00', 14)
								 ,(4, '2019-8-1', 21, 'TR', '11:45:00', 14)
								 ,(4, '2019-8-1', 22, 'TR', '11:50:00', 14)
								 ,(4, '2019-8-1', 23, 'TR', '11:55:00', 14)
								 ,(4, '2019-8-1', 24, 'TR', '12:00:00', 14)
-- END INSERT

-- QUESTÃO 1 --------------------------------------------
	SELECT INSP.nm_inspetor, DATEDIFF(MINUTE, MIN(AQ.hr_avaliacao), max(AQ.hr_avaliacao)) AS 'MinutesWorked'
	  FROM producao.avaliacao_qualidade AS AQ
	  JOIN  producao.ficha_qualidade    AS FQ   ON FQ.cd_ficha_avaliacao = AQ.cd_ficha_avaliacao
	  JOIN producao.inspetores          AS INSP ON     INSP.cd_matricula = FQ.cd_inspetor 
	 WHERE dt_inspecao = '2022-12-16' AND nm_inspetor = 'Trancoso da Silva'
  GROUP BY(INSP.nm_inspetor);

-- QUESTÃO 2 -------------------------------------------
	SELECT INSP.nm_inspetor, DATEDIFF(MINUTE, MIN(AQ.hr_avaliacao), max(AQ.hr_avaliacao)) AS 'MinutesWorked'
	  FROM producao.avaliacao_qualidade AS AQ
	  JOIN  producao.ficha_qualidade    AS FQ   ON FQ.cd_ficha_avaliacao = AQ.cd_ficha_avaliacao
	  JOIN producao.inspetores          AS INSP ON     INSP.cd_matricula = FQ.cd_inspetor 
	 WHERE dt_inspecao BETWEEN '2022-12-1' AND '2022-12-22'  AND nm_inspetor = 'Trancoso da Silva'
  GROUP BY(INSP.nm_inspetor);

-- QUESTÃO 3 --------------------------------------------
		SELECT AQ.sg_avaliacao, COUNT(*) as 'Total Erros' 
		  FROM producao.avaliacao_qualidade AS AQ 
		 WHERE AQ.aa_producao BETWEEN '2022-12-01' AND '2022-12-22' AND AQ.sg_avaliacao != 'OK' 
	  GROUP BY AQ.sg_avaliacao;

-- QUESTÃO 4 --------------------------------------------
SELECT INSP.nm_inspetor, count(1) AS 'Total TRs by inspetor'
	  FROM producao.avaliacao_qualidade AS AQ
	  JOIN  producao.ficha_qualidade    AS FQ   ON FQ.cd_ficha_avaliacao = AQ.cd_ficha_avaliacao
	  JOIN producao.inspetores          AS INSP ON     INSP.cd_matricula = FQ.cd_inspetor 
	 WHERE AQ.sg_avaliacao = 'TR'
  GROUP BY(INSP.nm_inspetor);


-- QUESTAO 5 --------------------------------------------------
-- NÃO CONSEGUI FAZER

