USE [Hackaton]

-- exec spInsertarEntidadDeSalud 1, 'SEDESA', 'Hospital', 'General', 'Dr. Enrique Cabrera', '�lvaro Obreg�n', '�lvaro Obreg�n', 'Distrito Federal', -99.22412222, 19.36168611, '55 12 85 71 00 Ext. 5043', 'Av. Centenario, esquina prolongaci�n 5 de mayo,\nCol. Exhacienda de Tarango,\nDel. �lvaro Obreg�n,\nC.P. 01618, M�xico, D.F.\n', 'Permanente'

-- drop table EntidadDeSalud
-- truncate table EntidadDeSalud

select * from EntidadDeSalud

exec spConsultaEntidadesDeSalud
