/* Exercício oficina do Sr José */

CREATE TABLE CLIENTE(

IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(40) NOT NULL,
CPF VARCHAR(15) NOT NULL UNIQUE,
SEXO ENUM('M','F'),
EMAIL VARCHAR(50)
);

CREATE TABLE CARROS(
IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
PLACA VARCHAR(8) NOT NULL,
TIPO VARCHAR(15) NOT NULL,
CHASSI VARCHAR(21) NOT NULL,
ANO CHAR(4) NOT NULL,
PORTAS INT,
COMBUSTIVEL VARCHAR(12),
ID_CLIENTE INT UNIQUE
);

CREATE TABLE MARCA(
IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
MARCA VARCHAR(25) NOT NULL,
MODELO VARCHAR(25) NOT NULL,
ID_CARRO INT
);


CREATE TABLE COR(
IDCOR INT PRIMARY KEY AUTO_INCREMENT,
COR_FABRICA VARCHAR(15) NOT NULL,
TIPO_PINTURA VARCHAR(10),
COR_PINTURA VARCHAR(15) NOT NULL,
ID_CARRO INT
);

CREATE TABLE TELEFONE(
IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
TIPO ENUM('RES','COM','CEL'),
NUMERO VARCHAR(10),
ID_CLIENTE INT
);



/* CHAVES ESTRANGEIRAS */

ALTER TABLE CARROS ADD CONSTRAINT FK_CLIENTE_CARRO FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE MARCA ADD CONSTRAINT FK_CARRO_MARCA FOREIGN KEY (ID_CARRO) REFERENCES CARROS(IDCARRO);

ALTER TABLE COR ADD CONSTRAINT FK_CARRO_COR FOREIGN KEY (ID_CARRO) REFERENCES CARROS(IDCARRO);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

/* INSERINDO DADOS NAS TABELAS */

INSERT INTO CLIENTE VALUES (NULL, 'IGOR BRUNO MILIONE','000.000.000-00','M','MILIONE@GMAIL.COM');
INSERT INTO CLIENTE VALUES (NULL,'IAGO ALVES','111.111.111-11','M','IAGO@BOL.COM.BR');
INSERT INTO CLIENTE VALUES (NULL,'FILIPE BERGMAN','222.222.222-22','M','BELGA@HOTMAIL.COM');
INSERT INTO CLIENTE VALUES (NULL,'FELIPE SANTOS','333.333.333-33','M','FREDERICO@GMAIL.COM');
INSERT INTO CLIENTE VALUES (NULL,'GABRIEL SANTOS PIMENTA','444.444.444-44','M','GABRIEL.SANTOS@UOL.COM.BR');
INSERT INTO CLIENTE VALUES (NULL,'IGOR ALVES','555.555.555-55','M','IGOR@TERRA.COM.BR');
INSERT INTO CLIENTE VALUES (NULL,'CAYO EDUARDO','456.789.190-12','M','CAYO@GMAIL.COM');
INSERT INTO CLIENTE VALUES (NULL,'GUILHERME VALDISSER','777.777.777-77','M','GUI@HOTMAL.COM');


INSERT INTO CARROS VALUES (NULL, 'IBG-1210','SEDAN','RKOBBCF1201112','2018',4,'FLEX',2);
INSERT INTO CARROS VALUES (NULL,'IAP-2034','SUV','KOLACEE1090872','2007',2,'ÁLCOOL',3);
INSERT INTO CARROS VALUES (NULL,'BGF-9010','HATCH','RSQUIAF1239874','2006',4,'GASOLINA',5);
INSERT INTO CARROS VALUES (NULL,'FPF-1821','HATCH','FPSQWSI8790912','2005',2,'ÁLCOOL',1);
INSERT INTO CARROS VALUES (NULL,'GSP-2012','SEDAN','GSPHELS1712400','2013',4,'FLEX',4);
INSERT INTO CARROS VALUES (NULL,'IAA-2020','SUV','FLAOPQU1209907','2009',2,'GASOLINA',6);
INSERT INTO CARROS VALUES (NULL,'CEB-1819','PICKUP','UBAMNAU1776100','2014',2,'ÁLCOOL',8);
INSERT INTO CARROS VALUES (NULL,'GVJ-0818','SUV','UJEMJNK1230986','2015',4,'FLEX',7);

INSERT INTO MARCA VALUES (NULL,'CHEVROLET','SPIN',2);
INSERT INTO MARCA VALUES (NULL,'FORD','FOCUS',1);
INSERT INTO MARCA VALUES (NULL,'VOLKSWAGEN','GOL',3);
INSERT INTO MARCA VALUES (NULL,'RENAULT','SANDERO',4);
INSERT INTO MARCA VALUES (NULL,'PEGEOUT','408',5);
INSERT INTO MARCA VALUES (NULL,'HYUNDAI','SANTA FÉ',6);
INSERT INTO MARCA VALUES (NULL,'TOYOTA','TACOMA',7);
INSERT INTO MARCA VALUES (NULL,'FIAT','FREEMONT',8);

INSERT INTO COR VALUES (NULL,'VERMELHO','METÁLICA','AZUL',2);
INSERT INTO COR VALUES (NULL,'AZUL','FOSCO','PRETO',3);
INSERT INTO COR VALUES (NULL,'VERDE','SÓLIDO','BRANCO',1);
INSERT INTO COR VALUES (NULL,'BRANCO','METÁLICO','AZUL',4);
INSERT INTO COR VALUES (NULL,'PRETO','FOSCO','PRETO',5);
INSERT INTO COR VALUES (NULL,'PRETO','FOSCO','BRANCO',5);
INSERT INTO COR VALUES (NULL,'AZUL','METÁLICO','VERMELHO',6);
INSERT INTO COR VALUES (NULL,'AMARELO','SÓLIDA','VERDE',7);
INSERT INTO COR VALUES (NULL,'PRETO','FOSCO','PRETO',8);

INSERT INTO TELEFONE VALUES (NULL,'RES','3363-1020',2);
INSERT INTO TELEFONE VALUES (NULL,'CEL','99801-1010',1);
INSERT INTO TELEFONE VALUES (NULL,'RES','3289-0919',4);
INSERT INTO TELEFONE VALUES (NULL,'COM','3232-1230',7);
INSERT INTO TELEFONE VALUES (NULL,'CEL','99800-6555'3);


/* SELECT PARA USAR JOINS E SUBQUERIES */

SELECT C.IDCLIENTE,C.NOME,CAR.IDCARRO,CAR.PLACA FROM CLIENTE C 
INNER JOIN CARROS CAR ON C.IDCLIENTE = CAR.ID_CLIENTE ORDER BY NOME ASC;

+-----------+------------------------+---------+----------+
| IDCLIENTE | NOME                   | IDCARRO | PLACA    |
+-----------+------------------------+---------+----------+
|         7 | CAYO EDUARDO           |       8 | GVJ-0818 |
|         4 | FELIPE SANTOS          |       5 | GSP-2012 |
|         3 | FILIPE BERGMAN         |       2 | IAP-2034 |
|         5 | GABRIEL SANTOS PIMENTA |       3 | BGF-9010 |
|         8 | GUILHERME VALDISSER    |       7 | CEB-1819 |
|         2 | IAGO ALVES             |       1 | IBG-1210 |
|         6 | IGOR ALVES             |       6 | IAA-2020 |
|         1 | IGOR BRUNO MILIONE     |       4 | FPF-1821 |
+-----------+------------------------+---------+----------+

SELECT C.IDCLIENTE,C.NOME,M.MARCA,M.MODELO,CAR.PLACA FROM CLIENTE C 
INNER JOIN CARROS CAR ON C.IDCLIENTE = CAR.ID_CLIENTE 
INNER JOIN MARCA M ON CAR.IDCARRO = M.ID_CARRO;

+-----------+------------------------+------------+-----------+----------+
| IDCLIENTE | NOME                   | MARCA      | MODELO    | PLACA    |
+-----------+------------------------+------------+-----------+----------+
|         1 | IGOR BRUNO MILIONE     | RENAULT    | SANDERO   | FPF-1821 |
|         2 | IAGO ALVES             | FORD       | FOCUS     | IBG-1210 |
|         3 | FILIPE BERGMAN         | CHEVROLET  | SPIN      | IAP-2034 |
|         4 | FELIPE SANTOS          | PEGEOUT    | 408       | GSP-2012 |
|         5 | GABRIEL SANTOS PIMENTA | VOLKSWAGEN | GOL       | BGF-9010 |
|         6 | IGOR ALVES             | HYUNDAI    | SANTA FÉ  | IAA-2020 |
|         7 | CAYO EDUARDO           | FIAT       | FREEMONT  | GVJ-0818 |
|         8 | GUILHERME VALDISSER    | TOYOTA     | TACOMA    | CEB-1819 |
+-----------+------------------------+------------+-----------+----------+

SELECT C.PLACA,C.TIPO,C.ANO,C.PORTAS,C.COMBUSTIVEL,M.MARCA,M.MODELO,CO.COR_FABRICA FROM CARROS C
INNER JOIN COR CO ON C.IDCARRO = CO.ID_CARRO
INNER JOIN MARCA M ON C.IDCARRO = M.ID_CARRO; 

+----------+--------+------+--------+-------------+------------+-----------+-------------+
| PLACA    | TIPO   | ANO  | PORTAS | COMBUSTIVEL | MARCA      | MODELO    | COR_FABRICA |
+----------+--------+------+--------+-------------+------------+-----------+-------------+
| IBG-1210 | SEDAN  | 2018 |      4 | FLEX        | FORD       | FOCUS     | VERDE       |
| IAP-2034 | SUV    | 2007 |      2 | FLEX        | CHEVROLET  | SPIN      | VERMELHO    |
| BGF-9010 | HATCH  | 2006 |      4 | GASOLINA    | VOLKSWAGEN | GOL       | AZUL        |
| FPF-1821 | HATCH  | 2005 |      2 | FLEX        | RENAULT    | SANDERO   | BRANCO      |
| GSP-2012 | SEDAN  | 2013 |      4 | FLEX        | PEGEOUT    | 408       | PRETO       |
| GSP-2012 | SEDAN  | 2013 |      4 | FLEX        | PEGEOUT    | 408       | PRETO       |
| IAA-2020 | SUV    | 2009 |      2 | GASOLINA    | HYUNDAI    | SANTA FÉ  | AZUL        |
| CEB-1819 | PICKUP | 2014 |      2 | ÁLCOOL      | TOYOTA     | TACOMA    | AMARELO     |
| GVJ-0818 | SUV    | 2015 |      4 | FLEX        | FIAT       | FREEMONT  | PRETO       |
+----------+--------+------+--------+-------------+------------+-----------+-------------+


SELECT M.MARCA,M.MODELO, C.PLACA,C.TIPO,C.ANO,C.PORTAS,C.COMBUSTIVEL,CO.COR_FABRICA FROM CARROS C
INNER JOIN COR CO ON C.IDCARRO = CO.ID_CARRO
INNER JOIN MARCA M ON C.IDCARRO = M.ID_CARRO; 

+------------+-----------+----------+--------+------+--------+-------------+-------------+
| MARCA      | MODELO    | PLACA    | TIPO   | ANO  | PORTAS | COMBUSTIVEL | COR_FABRICA |
+------------+-----------+----------+--------+------+--------+-------------+-------------+
| FORD       | FOCUS     | IBG-1210 | SEDAN  | 2018 |      4 | FLEX        | VERDE       |
| CHEVROLET  | SPIN      | IAP-2034 | SUV    | 2007 |      2 | ÁLCOOL      | VERMELHO    |
| VOLKSWAGEN | GOL       | BGF-9010 | HATCH  | 2006 |      4 | GASOLINA    | AZUL        |
| RENAULT    | SANDERO   | FPF-1821 | HATCH  | 2005 |      2 | ÁLCOOL      | BRANCO      |
| PEGEOUT    | 408       | GSP-2012 | SEDAN  | 2013 |      4 | FLEX        | PRETO       |
| PEGEOUT    | 408       | GSP-2012 | SEDAN  | 2013 |      4 | FLEX        | PRETO       |
| HYUNDAI    | SANTA FÉ  | IAA-2020 | SUV    | 2009 |      2 | GASOLINA    | AZUL        |
| TOYOTA     | TACOMA    | CEB-1819 | PICKUP | 2014 |      2 | ÁLCOOL      | AMARELO     |
| FIAT       | FREEMONT  | GVJ-0818 | SUV    | 2015 |      4 | FLEX        | PRETO       |
+------------+-----------+----------+--------+------+--------+-------------+-------------+

SELECT C.NOME,CA.PLACA,T.NUMERO FROM CLIENTE C 
INNER JOIN CARROS CA ON C.IDCLIENTE = CA.ID_CLIENTE 
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE; 

+--------------------+----------+------------+
| NOME               | PLACA    | NUMERO     |
+--------------------+----------+------------+
| IAGO ALVES         | IBG-1210 | 3363-1020  |
| IGOR BRUNO MILIONE | FPF-1821 | 99801-1010 |
| FELIPE SANTOS      | GSP-2012 | 3289-0919  |
| CAYO EDUARDO       | GVJ-0818 | 3232-1230  |
| FILIPE BERGMAN     | IAP-2034 | 99800-6555 |
+--------------------+----------+------------+

	
