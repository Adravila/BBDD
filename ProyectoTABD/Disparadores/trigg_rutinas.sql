/**
Rutinas:
- Duración: no debe ser superior a 1 año.

CREATE TABLE Rutinas (
	Nombre VARCHAR(30),
	Duracion INTEGER,
	CONSTRAINT PK_Nombre PRIMARY KEY (Nombre)
);

INSERT INTO Rutinas(Nombre, Duracion) VALUES ('Rutina 1',35);

**/

CREATE OR REPLACE TRIGGER TriggerRutinas
BEFORE INSERT OR UPDATE ON Rutinas 
FOR EACH ROW
BEGIN
	IF(:NEW.duracion > 365) THEN
		RAISE_APPLICATION_ERROR (-20600,'La duracion no debe ser superior a 1 anno');
	END IF;
END;
/
