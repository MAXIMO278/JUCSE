DROP DATABASE IF EXISTS organization; 
CREATE DATABASE organization;
USE organization;
DROP TABLE IF EXISTS DEPARTMENT;
create table DEPARTMENT (
	DEPT_CODE char(5) NOT NULL,
    DEPT_NAME char(15),
    PRIMARY KEY(DEPT_CODE)
);

DROP TABLE IF EXISTS EMP;
create table EMP (
	EMP_CODE varchar(5) NOT NULL,
    EMP_NAME varchar(20) CHECK (EMP_NAME = UPPER(EMP_NAME)),
    DEPT_CODE varchar(5),
    DESIG_CODE varchar(5),
    SEX varchar(1),
    ADDRESS varchar(25),
    CITY varchar(20),
    STATE varchar(20),
    PIN varchar(6),
    BASIC numeric CHECK (BASIC>=5000 AND BASIC<=9000),
    JOIN_DATE datetime default current_timestamp,
    
    PRIMARY KEY(EMP_CODE),
    FOREIGN KEY (DEPT_CODE) REFERENCES DEPARTMENT(DEPT_CODE) ON DELETE RESTRICT
);
DELIMITER $$
CREATE TRIGGER BEFORE_EMP_INSERT  
	BEFORE INSERT ON `EMP`
    FOR EACH ROW 
BEGIN
    IF (EMP_NAME = UPPER(EMP_NAME))

    END IF;
END$$
DELIMITER ;

DROP TABLE IF EXISTS LEAVE_REC;
create table LEAVE_REC (
	EMP_CODE varchar(5) NOT NULL,
    LEAVE_TYPE ENUM('CL','EL','ML'),
    FROM_DATE datetime,
    TO_DATE datetime,
    
    PRIMARY KEY(EMP_CODE, FROM_DATE),
    FOREIGN KEY (EMP_CODE) REFERENCES EMP(EMP_CODE) ON DELETE CASCADE
);