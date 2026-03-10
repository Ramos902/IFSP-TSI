-- 1. Estrutura do exercício
DROP DATABASE IF EXISTS escola;
CREATE DATABASE escola;

USE escola;

CREATE TABLE Alunos (
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    turma VARCHAR(100) NOT NULL
);

CREATE TABLE Notas (
    id INTEGER NOT NULL PRIMARY KEY,
    aluno_id INTEGER NOT NULL,
    disciplina VARCHAR(100) NOT NULL,
    nota FLOAT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id)
);


-- 2. Criação de Usuários e ROLES
CREATE USER IF NOT EXISTS 'professor'@'localhost'
    IDENTIFIED BY '1234';

CREATE USER IF NOT EXISTS 'secretaria'@'%'
    IDENTIFIED BY '1234';

CREATE USER IF NOT EXISTS 'monitor'@'localhost'
    IDENTIFIED BY '1234';

CREATE ROLE IF NOT EXISTS 'acesso_leitura';
CREATE ROLE IF NOT EXISTS 'acesso_gravacao';

GRANT SELECT ON escola.* TO 'acesso_leitura';
GRANT SELECT, INSERT, UPDATE ON escola.* TO 'acesso_gravacao';


-- 3. Atribuição Simples de ROLES
GRANT 'acesso_gravacao' TO 'professor'@'localhost';
SET DEFAULT ROLE 'acesso_gravacao' TO 'professor'@'localhost';

GRANT 'acesso_gravacao' TO 'secretaria'@'%';
SET DEFAULT ROLE 'acesso_gravacao' TO 'secretaria'@'%';

GRANT 'acesso_leitura' TO 'monitor'@'localhost';
SET DEFAULT ROLE 'acesso_leitura' TO 'monitor'@'localhost';

SHOW GRANTS FOR 'professor'@'localhost';
SHOW GRANTS FOR 'secretaria'@'%';
SHOW GRANTS FOR 'monitor'@'localhost';


-- 4. Permissões Granulares
DROP ROLE 'acesso_leitura';
DROP ROLE 'acesso_gravacao';

CREATE ROLE 'acesso_leitura';
CREATE ROLE 'acesso_gravacao';

GRANT SELECT ON escola.Alunos TO 'acesso_leitura';

GRANT SELECT, INSERT ON escola.Alunos TO 'acesso_gravacao';
GRANT SELECT ON escola.Notas TO 'acesso_gravacao';

GRANT 'acesso_gravacao' TO 'professor'@'localhost';
SET DEFAULT ROLE 'acesso_gravacao' TO 'professor'@'localhost';

GRANT 'acesso_gravacao' TO 'secretaria'@'%';
SET DEFAULT ROLE 'acesso_gravacao' TO 'secretaria'@'%';

GRANT 'acesso_leitura' TO 'monitor'@'localhost';
SET DEFAULT ROLE 'acesso_leitura' TO 'monitor'@'localhost';

SELECT * FROM mysql.role_edges WHERE FROM_USER = 'acesso_leitura';
SELECT * FROM mysql.role_edges WHERE FROM_USER = 'acesso_gravacao';

SHOW GRANTS FOR 'acesso_leitura';
SHOW GRANTS FOR 'acesso_gravacao';


-- 5. Herança de ROLES
CREATE ROLE IF NOT EXISTS 'admin_escola';
GRANT 'acesso_gravacao' TO 'admin_escola';
GRANT DELETE ON escola.Alunos TO 'admin_escola';

SELECT * FROM mysql.role_edges WHERE FROM_USER = 'admin_escola';
SHOW GRANTS FOR 'admin_escola';


-- 6. Problema de Segurança
/*
    R: Um possível motivo para esse problema é que as permissões anteriores não foram removidas 
    corretamente antes de recriar ou modificar as roles. Se o comando DROP ou REVOKE não for 
    executado ou for executado apenas parcialmente, a role acesso_leitura pode acabar mantendo 
    permissões antigas, como INSERT, que não deveriam existir.

    Outra possibilidade é que a role padrão tenha sido configurada incorretamente 
    com SET DEFAULT ROLE. Nesse caso, se a role acesso_gravacao tiver sido definida por engano para 
    o usuário monitor, ele passará a ter permissões de inserção quando fizer login, mesmo 
    que a intenção fosse permitir apenas leitura.
*/
SHOW GRANTS FOR 'monitor'@'localhost';

REVOKE 'acesso_gravacao' FROM 'monitor'@'localhost';
REVOKE INSERT ON escola.Alunos FROM 'acesso_leitura';
SET DEFAULT ROLE 'acesso_leitura' TO 'monitor'@'localhost';

SHOW GRANTS FOR 'monitor'@'localhost';
SHOW GRANTS FOR 'acesso_leitura';


/* Testes
DROP DATABASE IF EXISTS escola;
DROP ROLE IF EXISTS 'acesso_leitura', 'acesso_gravacao', 'admin_escola';
DROP USER IF EXISTS 'professor'@'localhost';
DROP USER IF EXISTS 'monitor'@'localhost';
DROP USER IF EXISTS 'secretaria'@'%';
*/