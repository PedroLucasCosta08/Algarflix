CREATE TABLE LOGIN (
  email VARCHAR(45) NOT NULL,
  senha VARCHAR(45),
  PRIMARY KEY (email)
);

CREATE TABLE COBRANCA (
  idcobranca SERIAL PRIMARY KEY,
  endereco VARCHAR(45),
  valor REAL,
  data TIMESTAMP,
  ultimo_pag TIMESTAMP
);

CREATE TABLE PREFERENCIAS (
  idpreferencias SERIAL PRIMARY KEY
);

CREATE TABLE EPISODIO (
  idepisodio SERIAL PRIMARY KEY,
  num_ep INTEGER,
  prox_ep INTEGER
);

CREATE TABLE SERIES (
  idseries SERIAL PRIMARY KEY,
  titulo VARCHAR(45),
  ano_prod INTEGER,
  categoria VARCHAR(45),
  duracao VARCHAR(10),
  temporada INTEGER,
  img_capa BLOB,
  episodio_idepisodio INTEGER NOT NULL,
  FOREIGN KEY (episodio_idepisodio) REFERENCES EPISODIO (idepisodio)
);

CREATE TABLE FILMES (
  idfilmes SERIAL PRIMARY KEY,
  titulo VARCHAR(45),
  ano_prod INTEGER,
  categoria VARCHAR(45),
  duracao VARCHAR(10),
  img_capa BLOB
);

CREATE TABLE DOCUMENTARIO (
  iddocumentario SERIAL PRIMARY KEY,
  titulo VARCHAR(45),
  ano_prod INTEGER,
  duracao VARCHAR(10),
  img_capa BLOB,
  nome_produtora VARCHAR(45)
);

CREATE TABLE ATOR (
  nome_ator VARCHAR(45) PRIMARY KEY,
  data_nasc DATE,
  local_nasc VARCHAR(45)
);

CREATE TABLE LOG_UPD_DEL (
  idlog_ins_del SERIAL PRIMARY KEY,
  data_hora TIMESTAMP,
  comando VARCHAR(45),
  series_idseries INTEGER NOT NULL,
  series_episodio_idepisodio INTEGER NOT NULL,
  filmes_idfilmes INTEGER NOT NULL,
  documentario_iddocumentario INTEGER NOT NULL,
  ator_nome_ator VARCHAR(45) NOT NULL,
  USUARIO_CPF VARCHAR(15) NOT NULL,
  USUARIO_LOGIN_EMAIL VARCHAR(45) NOT NULL,
  USUARIO_COBRANCA_IDCOBRANCA INTEGER NOT NULL,
  USUARIO_PREFERENCIAS_IDPREFERENCIAS INTEGER NOT NULL,
  EPISODIO_IDEPISODIO INTEGER NOT NULL,
  FOREIGN KEY (series_idseries) REFERENCES SERIES (idseries),
  FOREIGN KEY (series_episodio_idepisodio) REFERENCES EPISODIO (idepisodio),
  FOREIGN KEY (filmes_idfilmes) REFERENCES FILMES (idfilmes),
  FOREIGN KEY (documentario_iddocumentario) REFERENCES DOCUMENTARIO (iddocumentario),
  FOREIGN KEY (ator_nome_ator) REFERENCES ATOR (nome_ator),
  FOREIGN KEY (USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS) REFERENCES USUARIO (cpf, login_email, cobranca_idcobranca, preferencias_idpreferencias),
  FOREIGN KEY (EPISODIO_IDEPISODIO) REFERENCES EPISODIO (idepisodio)
);

CREATE TABLE USUARIO (
  cpf VARCHAR(15) NOT NULL,
  nome VARCHAR(45),
  telefone VARCHAR(15),
  numcartao VARCHAR(45),
  avatar BLOB,
  login_email VARCHAR(45) NOT NULL,
  cobranca_idcobranca INTEGER NOT NULL,
  preferencias_idpreferencias INTEGER NOT NULL,
  PRIMARY KEY (cpf, login_email, cobranca_idcobranca, preferencias_idpreferencias),
  FOREIGN KEY (login_email) REFERENCES LOGIN (email),
  FOREIGN KEY (cobranca_idcobranca) REFERENCES COBRANCA (idcobranca),
  FOREIGN KEY (preferencias_idpreferencias) REFERENCES PREFERENCIAS (idpreferencias),
);

CREATE TABLE FILMES_has_ATOR (
  filmes_idfilmes INTEGER NOT NULL,
  ator_nome_ator VARCHAR(45) NOT NULL,
  PRIMARY KEY (filmes_idfilmes, ator_nome_ator),
  FOREIGN KEY (filmes_idfilmes) REFERENCES FILMES (idfilmes),
  FOREIGN KEY (ator_nome_ator) REFERENCES ATOR (nome_ator)
);

CREATE TABLE DOCUMENTARIO_has_ATOR (
  documentario_iddocumentario INTEGER NOT NULL,
  ator_nome_ator VARCHAR(45) NOT NULL,
  PRIMARY KEY (documentario_iddocumentario, ator_nome_ator),
  FOREIGN KEY (documentario_iddocumentario) REFERENCES DOCUMENTARIO (iddocumentario),
  FOREIGN KEY (ator_nome_ator) REFERENCES ATOR (nome_ator)
);

CREATE TABLE SERIES_has_ATOR (
  series_idseries INTEGER NOT NULL,
  series_episodio_idepisodio INTEGER NOT NULL,
  ator_nome_ator VARCHAR(45) NOT NULL,
  PRIMARY KEY (series_idseries, series_episodio_idepisodio, ator_nome_ator),
  FOREIGN KEY (series_idseries) REFERENCES SERIES (idseries),
  FOREIGN KEY (series_episodio_idepisodio) REFERENCES EPISODIO (idepisodio),
  FOREIGN KEY (ator_nome_ator) REFERENCES ATOR (nome_ator)
);

CREATE TABLE SERIES_has_PREFERENCIAS (
  series_idseries INTEGER NOT NULL,
  series_episodio_idepisodio INTEGER NOT NULL,
  preferencias_idpreferencias INTEGER NOT NULL,
  PRIMARY KEY (series_idseries, series_episodio_idepisodio, preferencias_idpreferencias),
  FOREIGN KEY (series_idseries) REFERENCES SERIES (idseries),
  FOREIGN KEY (series_episodio_idepisodio) REFERENCES EPISODIO (idepisodio),
  FOREIGN KEY (preferencias_idpreferencias) REFERENCES PREFERENCIAS (idpreferencias)
);

CREATE TABLE FILMES_has_PREFERENCIAS (
  filmes_idfilmes INTEGER NOT NULL,
  preferencias_idpreferencias INTEGER NOT NULL,
  PRIMARY KEY (filmes_idfilmes, preferencias_idpreferencias),
  FOREIGN KEY (filmes_idfilmes) REFERENCES FILMES (idfilmes),
  FOREIGN KEY (preferencias_idpreferencias) REFERENCES PREFERENCIAS (idpreferencias)
);

CREATE TABLE DOCUMENTARIO_has_PREFERENCIAS (
  documentario_iddocumentario INTEGER NOT NULL,
  preferencias_idpreferencias INTEGER NOT NULL,
  PRIMARY KEY (documentario_iddocumentario, preferencias_idpreferencias),
  FOREIGN KEY (documentario_iddocumentario) REFERENCES DOCUMENTARIO (iddocumentario),
  FOREIGN KEY (preferencias_idpreferencias) REFERENCES PREFERENCIAS (idpreferencias)
);

--------------------- PARTE DE INSERÇÃO --------------------------

INSERT INTO LOGIN (email, senha) VALUES 
('alice.smith@example.com', 'alice2024'),
('bob.johnson@example.com', 'bob2024'),
('carol.davis@example.com', 'carol2024');

INSERT INTO COBRANCA (endereco, valor, data, ultimo_pag) VALUES 
('Av. Paulista, 100', 250.00, '2024-04-10 12:00:00', '2024-04-20 12:00:00'),
('Rua dos Três Irmãos, 456', 300.00, '2024-05-15 14:00:00', '2024-05-25 14:00:00'),
('Praça da Sé, 789', 150.00, '2024-06-20 16:00:00', '2024-06-30 16:00:00');

INSERT INTO PREFERENCIAS DEFAULT VALUES;
INSERT INTO PREFERENCIAS DEFAULT VALUES;
INSERT INTO PREFERENCIAS DEFAULT VALUES;

INSERT INTO EPISODIO (num_ep, prox_ep) VALUES 
(10, 2),
(20, 3),
(3, NULL);

INSERT INTO SERIES (titulo, ano_prod, categoria, duracao, temporada, img_capa, episodio_idepisodio) VALUES 
('Breaking Bad', 2008, 'Crime', '50:00:00', 5, NULL, 1),
('Stranger Things', 2016, 'Sci-Fi', '55:00:00', 4, NULL, 2),
('The Crown', 2016, 'Drama', '60:00:00', 6, NULL, 3);

INSERT INTO FILMES (titulo, ano_prod, categoria, duracao, img_capa) VALUES 
('Inception', 2010, 'Sci-Fi', '02:28:00', NULL),
('The Godfather', 1972, 'Crime', '02:55:00', NULL),
('Parasite', 2019, 'Thriller', '02:12:00', NULL);

INSERT INTO DOCUMENTARIO (titulo, ano_prod, duracao, img_capa, nome_produtora) VALUES 
('Planet Earth', 2006, '08:00:00', NULL, 'BBC'),
('The Social Dilemma', 2020, '01:34:00', NULL, 'Netflix'),
('13th', 2016, '01:40:00', NULL, 'Netflix');

INSERT INTO ATOR (nome_ator, data_nasc, local_nasc) VALUES 
('Bryan Cranston', '1956-03-07', 'Los Angeles, CA'),
('Millie Bobby Brown', '2004-02-19', 'Madrid, Spain'),
('Olivia Colman', '1974-01-30', 'Norwich, England');

INSERT INTO USUARIO (cpf, nome, telefone, numcartao, avatar, login_email, cobranca_idcobranca, preferencias_idpreferencias) VALUES 
('11122233344', 'Alice Smith', '555-1234', '1234 5678 9876 5432', NULL, 'alice.smith@example.com', 1, 1),
('22233344455', 'Bob Johnson', '555-5678', '2345 6789 8765 4321', NULL, 'bob.johnson@example.com', 2, 2),
('33344455566', 'Carol Davis', '555-8765', '3456 7890 7654 3210', NULL, 'carol.davis@example.com', 3, 3);

INSERT INTO FILMES_has_ATOR (filmes_idfilmes, ator_nome_ator) VALUES 
(1, 'Leonardo DiCaprio'),
(2, 'Marlon Brando'),
(3, 'Song Kang-ho');

INSERT INTO DOCUMENTARIO_has_ATOR (documentario_iddocumentario, ator_nome_ator) VALUES 
(1, 'David Attenborough'),
(2, 'Tristan Harris'),
(3, 'Ava DuVernay');

INSERT INTO SERIES_has_ATOR (series_idseries, series_episodio_idepisodio, ator_nome_ator) VALUES 
(1, 1, 'Bryan Cranston'),
(2, 1, 'Millie Bobby Brown'),
(3, 1, 'Olivia Colman');

INSERT INTO SERIES_has_PREFERENCIAS (series_idseries, series_episodio_idepisodio, preferencias_idpreferencias) VALUES 
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

INSERT INTO FILMES_has_PREFERENCIAS (filmes_idfilmes, preferencias_idpreferencias) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO DOCUMENTARIO_has_PREFERENCIAS (documentario_iddocumentario, preferencias_idpreferencias) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO USUARIO(cpf, avatar) 
VALUES(11122233344, lo_import('E:foto_alice.JPG'))

INSERT INTO USUARIO(cpf, avatar) 
VALUES(22233344455, lo_import('E:foto_bob.JPG'))

INSERT INTO USUARIO(cpf, avatar) 
VALUES(33344455566, lo_import('E:foto_carol.JPG'))


--------------------- PARTE DE CRIAÇÃO DAS RULES --------------------------

----------------1
CREATE RULE delete_avatar_rule AS
ON DELETE TO USUARIO
DO ALSO
UPDATE USUARIO SET avatar = NULL WHERE cpf = OLD.cpf;


---------------- 2
CREATE RULE delete_filme_img_capa_rule AS
ON DELETE TO FILMES
DO ALSO
UPDATE FILMES SET img_capa = NULL WHERE idfilmes = OLD.idfilmes;

CREATE RULE delete_documentario_img_capa_rule AS
ON DELETE TO DOCUMENTARIO
DO ALSO
UPDATE DOCUMENTARIO SET img_capa = NULL WHERE iddocumentario = OLD.iddocumentario;

CREATE RULE delete_series_img_capa_rule AS
ON DELETE TO SERIES
DO ALSO
UPDATE SERIES SET img_capa = NULL WHERE idseries = OLD.idseries;

-----------------3

ALTER TABLE FILMES 
ADD COLUMN avaliacao REAL;

ALTER TABLE SERIES 
ADD COLUMN avaliacao REAL;

ALTER TABLE SERIES
ADD COLUMN avaliacao REAL;

ALTER TABLE DOCUMENTARIO 
ADD COLUMN avaliacao REAL;

----------------LOG

CREATE OR REPLACE RULE log_update_series AS
ON UPDATE TO SERIES
DO ALSO INSERT INTO LOG_UPD_DEL (data_hora, comando, series_idseries, series_episodio_idepisodio, USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS, EPISODIO_IDEPISODIO)
VALUES (CURRENT_TIMESTAMP, 'UPDATE', OLD.idseries, OLD.episodio_idepisodio, NULL, NULL, NULL, NULL, NULL);

CREATE OR REPLACE RULE log_delete_series AS
ON DELETE TO SERIES
DO ALSO INSERT INTO LOG_UPD_DEL (data_hora, comando, series_idseries, series_episodio_idepisodio, USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS, EPISODIO_IDEPISODIO)
VALUES (CURRENT_TIMESTAMP, 'DELETE', OLD.idseries, OLD.episodio_idepisodio, NULL, NULL, NULL, NULL, NULL);

------

CREATE OR REPLACE RULE log_update_filmes AS
ON UPDATE TO FILMES
DO ALSO INSERT INTO LOG_UPD_DEL (data_hora, comando, filmes_idfilmes, series_idseries, series_episodio_idepisodio, documentario_iddocumentario, ator_nome_ator, USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS, EPISODIO_IDEPISODIO)
VALUES (CURRENT_TIMESTAMP, 'UPDATE', OLD.idfilmes, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

CREATE OR REPLACE RULE log_delete_filmes AS
ON DELETE TO FILMES
DO ALSO INSERT INTO LOG_UPD_DEL (data_hora, comando, filmes_idfilmes, series_idseries, series_episodio_idepisodio, documentario_iddocumentario, ator_nome_ator, USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS, EPISODIO_IDEPISODIO)
VALUES (CURRENT_TIMESTAMP, 'DELETE', OLD.idfilmes, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


------

CREATE OR REPLACE RULE log_update_documentario AS
ON UPDATE TO DOCUMENTARIO
DO ALSO INSERT INTO LOG_UPD_DEL (data_hora, comando, documentario_iddocumentario, series_idseries, series_episodio_idepisodio, filmes_idfilmes, ator_nome_ator, USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS, EPISODIO_IDEPISODIO)
VALUES (CURRENT_TIMESTAMP, 'UPDATE', OLD.iddocumentario, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

CREATE OR REPLACE RULE log_delete_documentario AS
ON DELETE TO DOCUMENTARIO
DO ALSO INSERT INTO LOG_UPD_DEL (data_hora, comando, documentario_iddocumentario, series_idseries, series_episodio_idepisodio, filmes_idfilmes, ator_nome_ator, USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS, EPISODIO_IDEPISODIO)
VALUES (CURRENT_TIMESTAMP, 'DELETE', OLD.iddocumentario, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-------

CREATE OR REPLACE RULE log_update_ator AS
ON UPDATE TO ATOR
DO ALSO INSERT INTO LOG_UPD_DEL (data_hora, comando, ator_nome_ator, series_idseries, series_episodio_idepisodio, filmes_idfilmes, documentario_iddocumentario, USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS, EPISODIO_IDEPISODIO)
VALUES (CURRENT_TIMESTAMP, 'UPDATE', OLD.nome_ator, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

CREATE OR REPLACE RULE log_delete_ator AS
ON DELETE TO ATOR
DO ALSO INSERT INTO LOG_UPD_DEL (data_hora, comando, ator_nome_ator, series_idseries, series_episodio_idepisodio, filmes_idfilmes, documentario_iddocumentario, USUARIO_CPF, USUARIO_LOGIN_EMAIL, USUARIO_COBRANCA_IDCOBRANCA, USUARIO_PREFERENCIAS_IDPREFERENCIAS, EPISODIO_IDEPISODIO)
VALUES (CURRENT_TIMESTAMP, 'DELETE', OLD.nome_ator, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



-----------------4
CREATE OR REPLACE FUNCTION avaliar_video(
    p_cpf VARCHAR(15),
    p_tipo_video VARCHAR(20),
    p_id_video INTEGER,
    p_avaliacao REAL
) RETURNS VOID AS $$
BEGIN
    IF p_avaliacao < 0 OR p_avaliacao > 10 THEN
        RAISE EXCEPTION 'A nota de avaliação deve estar entre 0 e 10';
    END IF;

    IF p_tipo_video = 'FILME' THEN
        UPDATE FILMES
        SET avaliacao = p_avaliacao
        WHERE idfilmes = p_id_video;

    ELSIF p_tipo_video = 'SERIE' THEN
        UPDATE SERIES
        SET avaliacao = p_avaliacao
        WHERE idseries = p_id_video;

    ELSIF p_tipo_video = 'DOCUMENTARIO' THEN
        UPDATE DOCUMENTARIO
        SET avaliacao = p_avaliacao
        WHERE iddocumentario = p_id_video;

    ELSE
        RAISE EXCEPTION 'Tipo de vídeo desconhecido: %', p_tipo_video;
    END IF;

    RAISE NOTICE 'Avaliação atribuída com sucesso.';
END;

-----------------5

CREATE OR REPLACE FUNCTION buscar_videos_por_ator(p_nome_ator VARCHAR)
RETURNS TABLE(tipo_video VARCHAR, titulo VARCHAR, ano_prod INTEGER, categoria VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT 'Filme' AS tipo_video, f.titulo, f.ano_prod, f.categoria
    FROM FILMES f
    INNER JOIN FILMES_has_ATOR fa ON f.idfilmes = fa.filmes_idfilmes
    WHERE fa.ator_nome_ator = p_nome_ator
    
    UNION
    
    SELECT 'Serie' AS tipo_video, s.titulo, s.ano_prod, s.categoria
    FROM SERIES s
    INNER JOIN SERIES_has_ATOR sa ON s.idseries = sa.series_idseries
    WHERE sa.ator_nome_ator = p_nome_ator
    
    UNION
    
    SELECT 'Documentario' AS tipo_video, d.titulo, d.ano_prod, NULL AS categoria
    FROM DOCUMENTARIO d
    INNER JOIN DOCUMENTARIO_has_ATOR da ON d.iddocumentario = da.documentario_iddocumentario
    WHERE da.ator_nome_ator = p_nome_ator;
END;


-----------------6

CREATE OR REPLACE FUNCTION buscar_videos_por_titulo_inicial(p_titulo_inicial VARCHAR)
RETURNS TABLE(tipo_video VARCHAR, titulo VARCHAR, ano_prod INTEGER, categoria VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT 'Filme' AS tipo_video, titulo, ano_prod, categoria
    FROM FILMES
    WHERE titulo ILIKE p_titulo_inicial || '%'
    
    UNION
    
    SELECT 'Serie' AS tipo_video, titulo, ano_prod, categoria
    FROM SERIES
    WHERE titulo ILIKE p_titulo_inicial || '%'
    
    UNION
    
    SELECT 'Documentario' AS tipo_video, titulo, ano_prod, NULL AS categoria
    FROM DOCUMENTARIO
    WHERE titulo ILIKE p_titulo_inicial || '%';
END;

-----------------7
CREATE OR REPLACE FUNCTION get_videos_by_type(
    p_tipo_video VARCHAR(15)
)
RETURNS TABLE (
    tipo_video VARCHAR(15),
    titulo VARCHAR(45),
    ano_prod INTEGER,
    categoria VARCHAR(45)
) AS $$
BEGIN
    IF p_tipo_video = 'Filme' THEN
        RETURN QUERY
        SELECT 'Filme' AS tipo_video, f.titulo, f.ano_prod, f.categoria
        FROM FILMES f;

    ELSIF p_tipo_video = 'Serie' THEN
        RETURN QUERY
        SELECT 'Serie' AS tipo_video, s.titulo, s.ano_prod, s.categoria
        FROM SERIES s;

    ELSIF p_tipo_video = 'Documentario' THEN
        RETURN QUERY
        SELECT 'Documentario' AS tipo_video, d.titulo, d.ano_prod, d.categoria
        FROM DOCUMENTARIO d;

    ELSE
        RAISE EXCEPTION 'Tipo de vídeo inválido: %. Use "Filme", "Serie" ou "Documentario".', p_tipo_video;
    END IF;
END;

------------------8

CREATE OR REPLACE FUNCTION buscar_filmes_series_por_categoria(p_categoria VARCHAR)
RETURNS TABLE(tipo_video VARCHAR, titulo VARCHAR, ano_prod INTEGER, avaliacao REAL) AS $$
BEGIN
    RETURN QUERY
    SELECT 'Filme' AS tipo_video, titulo, ano_prod, avaliacao
    FROM FILMES
    WHERE categoria = p_categoria
    ORDER BY avaliacao DESC
    
    UNION

    SELECT 'Serie' AS tipo_video, titulo, ano_prod, avaliacao
    FROM SERIES
    WHERE categoria = p_categoria
    ORDER BY avaliacao DESC;
END;