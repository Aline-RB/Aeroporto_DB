CREATE DATABASE aeroporto;

CREATE TABLE Aeroporto(
Cod_Aeroporto VARCHAR(3) NOT NULL PRIMARY KEY,
Cidade VARCHAR(50) NOT NULL,
Estado VARCHAR(20) NOT NULL,
Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Trecho(
Num_Trecho INTEGER NOT NULL,
Cod_Aeroporto_Inicial VARCHAR(3) NOT NULL,
Cod_Aeroporto_Final VARCHAR(3) NOT NULL,
Numero VARCHAR(4) NOT NULL,
Horario_Inicial TIME NOT NULL,
Horaril_Final TIME NOT NULL,
PRIMARY KEY(Num_Trecho,Cod_Aeroporto_Inicial, Cod_Aeroporto_Final, Numero),
FOREIGN KEY(Cod_Aeroporto_Inicial) REFERENCES Aeroporto(Cod_Aeroporto),
FOREIGN KEY(Cod_Aeroporto_Final) REFERENCES Aeroporto(Cod_Aeroporto)
);

ALTER TABLE Trecho
ADD CONSTRAINT FK_NUMERO
FOREIGN KEY (Numero) REFERENCES Voo(Numero);

CREATE TABLE Voo(
Numero VARCHAR(4) NOT NULL PRIMARY KEY,
Companhia_Aerea VARCHAR(30) NOT NULL,
Dia_da_Semana VARCHAR(20) NOT NULL 
);
CREATE TABLE Tarifa(
Codigo VARCHAR(5) NOT NULL,
Numero VARCHAR(4) NOT NULL,
Quantidade FLOAT NOT NULL,
Restricoes VARCHAR(20) NOT NULL,
PRIMARY KEY(Codigo, Numero),
FOREIGN KEY(Numero) REFERENCES Voo(Numero)
);
CREATE TABLE Trecho_Sobrevoado( 
Numero_Assentos_Disponiveis INTEGER NOT NULL,
Num_Trecho INTEGER NOT NULL,
Numero VARCHAR(4) NOT NULL,
Cod_Aeronave VARCHAR(20) NOT NULL,
Codigo_Aeroporto_Inicial VARCHAR(3) NOT NULL,
Codigo_Aeroporto_Final VARCHAR(3) NOT NULL,
Dat_a DATE NOT NULL,
Hora_Partida TIME NOT NULL,
Hora_Chegada TIME NOT NULL,
/*Numero_Assentos_Disponiveis INTEGER NOT NULL,*/
PRIMARY KEY(Numero_Assentos_Disponiveis, Num_Trecho, Numero, Cod_Aeronave, Codigo_Aeroporto_Inicial, Codigo_Aeroporto_Final),
FOREIGN KEY(Num_Trecho) REFERENCES Trecho(Num_Trecho),
FOREIGN KEY(Numero) REFERENCES Trecho(Numero),
FOREIGN KEY(Cod_Aeronave) REFERENCES Aeronave(Cod_Aeronave),
FOREIGN KEY(Codigo_Aeroporto_Inicial) REFERENCES Aeroporto(Cod_Aeroporto),
FOREIGN KEY(Codigo_Aeroporto_Final) REFERENCES Aeroporto(Cod_Aeroporto)
);
CREATE TABLE Aeronave(
Cod_Aeronave VARCHAR(20) NOT NULL PRIMARY KEY,
Nome_Modelo VARCHAR(50) NOT NULL,
Numero_Total_Assentos INTEGER NOT NULL,
FOREIGN KEY(Nome_Modelo) REFERENCES Modelo_Aeronave(Nome_Modelo)
);
CREATE TABLE Modelo_Aeronave(
Nome_Modelo VARCHAR(50) NOT NULL PRIMARY KEY,
Maximo_Assentos INTEGER NOT NULL,
Empresa VARCHAR(50) NOT NULL
);
CREATE TABLE Pode_Pousar(
Cod_Aeroporto VARCHAR(3) NOT NULL,
Nome_Modelo VARCHAR(50) NOT NULL,
FOREIGN KEY(Cod_Aeroporto) REFERENCES Aeroporto(Cod_Aeroporto),
FOREIGN KEY(Nome_Modelo) REFERENCES Modelo_Aeronave(Nome_Modelo)
);
CREATE TABLE Assento(
Numero_Assento INTEGER NOT NULL,
Numero_Assentos_Disponiveis INTEGER NOT NULL,
Num_Trecho INTEGER NOT NULL,
Numero VARCHAR(4) NOT NULL,
Cod_Aeronave VARCHAR(20) NOT NULL,
Codigo_Aeroporto_Inicial VARCHAR(3) NOT NULL,
Codigo_Aeroporto_Final VARCHAR(3) NOT NULL,
Nome_Cliente VARCHAR(50) NOT NULL,
Telefone_Cliente VARCHAR(50) NOT NULL,
PRIMARY KEY(Numero_Assento, Numero_Assentos_Disponiveis, Num_Trecho, Numero, Cod_Aeronave, Codigo_Aeroporto_Inicial, Codigo_Aeroporto_Final),
/*FOREIGN KEY(Num_Trecho) REFERENCES Trecho(Num_Trecho),
FOREIGN KEY(Numero) REFERENCES Trecho(Numero),
FOREIGN KEY(Cod_Aeronave) REFERENCES Aeronave(Cod_Aeronave),
FOREIGN KEY(Codigo_Aeroporto_Inicial) REFERENCES Aeroporto(Cod_Aeroporto),
FOREIGN KEY(Codigo_Aeroporto_Final) REFERENCES Aeroporto(Cod_Aeroporto),*/
FOREIGN KEY(Numero_Assentos_Disponiveis) REFERENCES Trecho_Sobrevoado(Numero_Assentos_Disponiveis)
)