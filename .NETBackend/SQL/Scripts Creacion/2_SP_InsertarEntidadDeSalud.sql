USE [Hackaton]
GO
/****** Object:  StoredProcedure [dbo].[spInsertarEntidadDeSalud]    Script Date: 03/08/2015 09:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Montes de Oca Morales - (vicmoca@gmail.com)
-- Create date: 07/Marzo/2015
-- Description:	Inserta una Entidad de Salud
--				Para Hackaton CDMX - 2015
-- =============================================
ALTER PROCEDURE [dbo].[spInsertarEntidadDeSalud]
	@numero as nvarchar(50)
   ,@institucion as nvarchar(300)
   ,@tipo as nvarchar(100)
   ,@subtipo as nvarchar(100)
   ,@nombre_centro as nvarchar(200)
   ,@nombre_localidad as nvarchar(100)
   ,@nombre_municipio as nvarchar(100)
   ,@nombre_estado as nvarchar(100)
   ,@latitud as nvarchar(50)--decimal(12,8)
   ,@longitud as nvarchar(50)--decimal(12,8)
   ,@telefono as nvarchar(200)
   ,@domicilio as nvarchar(500)
   ,@horario as nvarchar(200)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [Hackaton].[dbo].[EntidadDeSalud]
           ([NUMERO]
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
           ,[HORARIO])
     VALUES
           (@numero 
		   ,@institucion
		   ,@tipo
		   ,@subtipo
		   ,@nombre_centro
		   ,@nombre_localidad
		   ,@nombre_municipio
		   ,@nombre_estado
		   ,@latitud
		   ,@longitud
		   ,@telefono
		   ,@domicilio
		   ,@horario)
		           

END

