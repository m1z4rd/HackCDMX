USE [Hackaton]

-- exec spInsertarEntidadDeSalud 1, 'SEDESA', 'Hospital', 'General', 'Dr. Enrique Cabrera', 'Álvaro Obregón', 'Álvaro Obregón', 'Distrito Federal', -99.22412222, 19.36168611, '55 12 85 71 00 Ext. 5043', 'Av. Centenario, esquina prolongación 5 de mayo,\nCol. Exhacienda de Tarango,\nDel. Álvaro Obregón,\nC.P. 01618, México, D.F.\n', 'Permanente'

-- drop table EntidadDeSalud
-- truncate table EntidadDeSalud

select * from EntidadDeSalud

exec spConsultaEntidadesDeSalud
