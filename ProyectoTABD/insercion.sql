SET SERVEROUTPUT;

INSERT INTO Tabla_ClasesColectivas VALUES (Tipo_ClaseColectiva(Tipo_Fecha(5,'19:37'),40,NULL));
INSERT INTO Tabla_Equipo VALUES (Tipo_Equipo(1,25,NULL));
INSERT INTO Tabla_Clientes VALUES (Tipo_Cliente('12345678P','Ana','Gutierrez',80,Tipo_Telfs('555444333','222111000'),Tipo_Direccion('REAL','Cadiz'),80));
INSERT INTO Tabla_Ejercicios VALUES (Tipo_Ejercicio('Flex rod','Flexion de rodilla'));
INSERT INTO Tabla_Mantenimiento VALUES (Tipo_Mantenimiento(1,900,'Pepe','Lopez',Tipo_JornadaLaboral(5,7),Tipo_Direccion('REAL','Cadiz'),Tipo_Telfs('111202333','444550999'),'mantenimiento',NULL));
INSERT INTO Tabla_Monitor VALUES (Tipo_Monitor(3,900,'Pepe','Lopez',Tipo_JornadaLaboral(5,7),Tipo_Direccion('REAL','Cadiz'),Tipo_Telfs('111222533','444556999'),'monitor',NULL,NULL));
INSERT INTO Tabla_Jefe VALUES(Tipo_Jefe(2,900,'Pepe','Lopez',Tipo_JornadaLaboral(5,7),Tipo_Direccion('REAL','Cadiz'),Tipo_Telfs('111222333','444555999'),'jefe',NULL,NULL));
INSERT INTO Tabla_Rutinas VALUES (Tipo_Rutina(788455,'Adelgazar',90,NULL,NULL,(SELECT REF(oc) FROM Tabla.Monitor oc WHERE oc.cod_emp = 3)));
