USE [Hackaton]
GO
/****** Object:  StoredProcedure [dbo].[spConsultaEntidadesDeSalud]    Script Date: 03/08/2015 09:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Montes de Oca Morales - (vicmoca@gmail.com)
-- Create date: 08/Marzo/2015
-- Description:	Selecciona TODAS las Entidades de Salud
--				Para Hackaton CDMX - 2015
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaEntidadesDeSalud]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [NUMERO]
		  ,[INSTITUCION]
		  ,[TIPO]
		  ,[SUBTIPO]
		  ,[NOMBRE_CENTRO]
		  ,[NOMBRE_LOCALIDAD]
		  ,[NOMBRE_MUNICIPIO]
		  ,[NOMBRE_ESTADO]
		  ,[LATITUD]
		  ,[LONGITUD]
		  ,[TELEFONO]
		  ,[DOMICILIO]
		  ,[HORARIO]
	  FROM [Hackaton].[dbo].[EntidadDeSalud]
		           

END

