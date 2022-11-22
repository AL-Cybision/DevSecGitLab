IF OBJECT_ID('tblEmployee', 'U') IS NOT NULL
DROP TABLE tblEmployee
GO
-- Create the table in the specified schema
CREATE TABLE tblEmployee
(
    id INTEGER NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    salary INTEGER NOT NULL,
    departID INTEGER NULL
);