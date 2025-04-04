CREATE DATABASE ProyectoAhorcado;
USE ProyectoAhorcado;

CREATE TABLE USUARIO (
    idUsuario INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE ADMINISTRADOR (
    idUsuario INT PRIMARY KEY,
    nivel INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario)
);
CREATE TABLE CUOTA (
    idCuota INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    importe FLOAT NOT NULL
);

CREATE TABLE JUGADOR (
    idUsuario INT PRIMARY KEY,
    apellidos VARCHAR(255),
    idCuota INT,
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario),
    FOREIGN KEY (idCuota) REFERENCES CUOTA(idCuota)
);

CREATE TABLE JUEGO (
    idJuego INT PRIMARY KEY,
    fechaSistema DATE NOT NULL,
    horaSistema TIME NOT NULL,
    idioma VARCHAR(50) NOT NULL
);

CREATE TABLE PARTIDA (
    idPartida INT PRIMARY KEY,
    duracionPartida INT NOT NULL,
    idJuego INT,
    FOREIGN KEY (idJuego) REFERENCES JUEGO(idJuego)
);

CREATE TABLE IDIOMA (
    idIdioma INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    numeroTotalPalabras INT NOT NULL
);

CREATE TABLE PALABRA_FRASE (
    idPalabraFrase INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    idioma VARCHAR(50) NOT NULL,
    tipo VARCHAR(50),
    significado TEXT,
    nivelDificultad INT,
    idIdioma INT,
    FOREIGN KEY (idIdioma) REFERENCES IDIOMA(idIdioma)
);

CREATE TABLE PALABRA_FRASE_RELACION (
    idPalabraFrase1 INT,
    idPalabraFrase2 INT,
    PRIMARY KEY (idPalabraFrase1, idPalabraFrase2),
    FOREIGN KEY (idPalabraFrase1) REFERENCES PALABRA_FRASE(idPalabraFrase),
    FOREIGN KEY (idPalabraFrase2) REFERENCES PALABRA_FRASE(idPalabraFrase)
);

CREATE TABLE HISTORICO_PALABRAS (
    idPalabraFrase INT,
    nombre VARCHAR(255) NOT NULL,
    idioma VARCHAR(50) NOT NULL,
    tipo VARCHAR(50),
    significado TEXT,
    nivelDificultad INT,
    PRIMARY KEY (idPalabraFrase),
    FOREIGN KEY (idPalabraFrase) REFERENCES PALABRA_FRASE(idPalabraFrase)
);

CREATE TABLE REGISTRO_PARTIDAS (
    idRegistro INT PRIMARY KEY,
    idUsuario INT,
    idJuego INT,
    idPartida INT,
    fechaHora DATETIME NOT NULL,
    puntosObtenidos INT NOT NULL,
    partesMuñecoMostradas VARCHAR(255),
    idPalabraFrase INT,
    FOREIGN KEY (idUsuario) REFERENCES JUGADOR(idUsuario),
    FOREIGN KEY (idJuego) REFERENCES JUEGO(idJuego),
    FOREIGN KEY (idPartida) REFERENCES PARTIDA(idPartida),
    FOREIGN KEY (idPalabraFrase) REFERENCES PALABRA_FRASE(idPalabraFrase)
);