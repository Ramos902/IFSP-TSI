-- 1. Estrutura do exercício:
CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE IF NOT EXISTS Alunos(
    id INTEGER NOT NULL PRIMARY KEY ,
    nome VARCHAR(100) NOT NULL,
    turma VARCHAR(100) NOT NULL
    
);

CREATE TABLE IF NOT EXISTS Notas(

    id INTEGER NOT NULL PRIMARY KEY,
    aluno_id INTEGER NOT NULL,
    disciplina VARCHAR(100) NOT NULL,
    nota FLOAT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id)
);

-- 2. Criação de Usuários e ROLES
CREATE USER 'professor'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'secretaria'@'%' IDENTIFIED BY '1234';
CREATE USER 'monitor'@'localhost' IDENTIFIED BY '1234';
CREATE ROLE 'acesso_leitura';
GRANT SELECT ON escola.* TO 'acesso_leitura';
CREATE ROLE 'acesso_gravacao';
GRANT SELECT, INSERT, UPDATE ON escola.* TO 'acesso_gravacao';

-- 3. Atribuição Simples de ROLES 
GRANT 'acesso_gravacao' TO 'professor'@'localhost';
GRANT 'acesso_gravacao' TO 'secretaria'@'%';
GRANT 'acesso_leitura' TO 'monitor'@'localhost' ;
SHOW GRANTS FOR 'professor'@'localhost';
SHOW GRANTS FOR 'secretaria'@'%';
SHOW GRANTS FOR 'monitor'@'localhost';

--4. Permissões Granulares
REVOKE SELECT ON escola.* FROM 'acesso_leitura';
GRANT SELECT ON escola.alunos TO 'acesso_leitura';
REVOKE SELECT, INSERT, UPDATE ON escola.* FROM 'acesso_gravacao';
GRANT SELECT, INSERT ON escola.alunos TO 'acesso_gravacao';
GRANT SELECT ON escola.notas TO 'acesso_gravacao';

SELECT * FROM mysql.role_edges
WHERE FROM_USER='acesso_leitura';

SELECT * FROM mysql.role_edges
WHERE FROM_USER='acesso_gravacao';

SHOW GRANTS FOR 'acesso_leitura';
SHOW GRANTS FOR 'acesso_gravacao';

--5. Herança de ROLES
CREATE ROLE 'admin_escola';
GRANT 'acesso_gravacao' TO 'admin_escola';
GRANT DELETE ON escola.alunos TO 'admin_escola';

SELECT * FROM mysql.role_edges
WHERE FROM_USER='admin_escola';

SHOW GRANTS FOR 'admin_escola';

/*
6. Problema de Segurança
    1. O usuário 'monitor' está conseguindo inserir dados (não deveria). 
    2. Corrija as permissões e explique o erro.
    R: Um possivel caso seria que ao alterar as permissões de 'monitor' não foi
        realizado antes o REVOKE, mantendo assim o INSERT anteriormente aplicado
        de forma indevida. Outro cenário possivel seria o usuario 'monitor' ter
        herdado as permissões de outra Role mas sem que tenha sido alterado depois
*/
REVOKE INSERT ON escola.* FROM 'acesso_leitura';


/* Testes
SELECT * FROM mysql.role_edges;

DROP DATABASE escola;

DROP ROLE 'acesso_leitura';
DROP ROLE 'acesso_gravacao';
DROP ROLE 'admin_escola';

DROP USER 'professor'@'localhost';
DROP USER 'monitor'@'localhost';
DROP USER 'secretaria'@'%';
*/