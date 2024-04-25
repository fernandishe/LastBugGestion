USE [LastBug_Gestion]
GO
/****** Object:  Table [dbo].[ayudasSociales]    Script Date: 25-04-2024 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ayudasSociales](
	[id] [int] IDENTITY(100,1) NOT NULL,
	[titulo] [varchar](30) NOT NULL,
	[detalle] [varchar](100) NOT NULL,
	[vigente] [char](1) NOT NULL,
	[usuarioCreacion] [varchar](10) NOT NULL,
	[usuarioModificacion] [varchar](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ayudasSocialesAsignadas]    Script Date: 25-04-2024 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ayudasSocialesAsignadas](
	[id] [int] IDENTITY(100,1) NOT NULL,
	[codigoRegion] [int] NOT NULL,
	[codigoComuna] [int] NOT NULL,
	[idAyudaSocial] [int] NOT NULL,
	[usuarioCreacion] [varchar](10) NOT NULL,
	[usuarioModificacion] [varchar](10) NOT NULL,
	[fechaAsignacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comuna]    Script Date: 25-04-2024 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comuna](
	[codigo] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[codigoRegion] [int] NOT NULL,
	[usuarioCreacion] [varchar](10) NOT NULL,
	[usuarioModificacion] [varchar](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 25-04-2024 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[codigo] [char](3) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[usuarioCreacion] [varchar](10) NOT NULL,
	[usuarioModificacion] [varchar](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 25-04-2024 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[codigo] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[codigoPais] [char](3) NOT NULL,
	[usuarioCreacion] [varchar](10) NOT NULL,
	[usuarioModificacion] [varchar](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 25-04-2024 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[codigo] [char](3) NOT NULL,
	[nombreRol] [varchar](30) NOT NULL,
	[usuarioCreacion] [varchar](10) NOT NULL,
	[usuarioModificacion] [varchar](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25-04-2024 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[rut] [varchar](12) NOT NULL,
	[correo] [varchar](40) NOT NULL,
	[nombres] [varchar](60) NOT NULL,
	[apellidos] [varchar](60) NOT NULL,
	[codigoRol] [char](3) NOT NULL,
	[usuarioCreacion] [varchar](10) NOT NULL,
	[usuarioModificacion] [varchar](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ayudasSociales] ADD  DEFAULT ('S') FOR [vigente]
GO
ALTER TABLE [dbo].[ayudasSociales] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ayudasSociales] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[ayudasSocialesAsignadas] ADD  DEFAULT (getdate()) FOR [fechaAsignacion]
GO
ALTER TABLE [dbo].[ayudasSocialesAsignadas] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[Comuna] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[Comuna] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[Pais] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[Pais] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[ayudasSocialesAsignadas]  WITH CHECK ADD  CONSTRAINT [FK_asaRegion] FOREIGN KEY([codigoRegion])
REFERENCES [dbo].[Region] ([codigo])
GO
ALTER TABLE [dbo].[ayudasSocialesAsignadas] CHECK CONSTRAINT [FK_asaRegion]
GO
ALTER TABLE [dbo].[ayudasSocialesAsignadas]  WITH CHECK ADD  CONSTRAINT [FK_ayudaSocial] FOREIGN KEY([idAyudaSocial])
REFERENCES [dbo].[ayudasSociales] ([id])
GO
ALTER TABLE [dbo].[ayudasSocialesAsignadas] CHECK CONSTRAINT [FK_ayudaSocial]
GO
ALTER TABLE [dbo].[Comuna]  WITH CHECK ADD  CONSTRAINT [FK_codigoRegion] FOREIGN KEY([codigoRegion])
REFERENCES [dbo].[Region] ([codigo])
GO
ALTER TABLE [dbo].[Comuna] CHECK CONSTRAINT [FK_codigoRegion]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_codigoPais] FOREIGN KEY([codigoPais])
REFERENCES [dbo].[Pais] ([codigo])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_codigoPais]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_codigoRol] FOREIGN KEY([codigoRol])
REFERENCES [dbo].[roles] ([codigo])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_codigoRol]
GO
ALTER TABLE [dbo].[ayudasSociales]  WITH CHECK ADD  CONSTRAINT [CK_vigenciaAyuda] CHECK  (([vigente]='N' OR [vigente]='S'))
GO
ALTER TABLE [dbo].[ayudasSociales] CHECK CONSTRAINT [CK_vigenciaAyuda]
GO
/****** Object:  StoredProcedure [dbo].[asignaAyudaRegionComuna]    Script Date: 25-04-2024 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asignaAyudaRegionComuna] 
@codigoRegion int,
@codigoComuna int,
@titulo varchar(30),
@detalle varchar(100),
@usuarioCreacion varchar(10)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE 
	@err_message nvarchar(255),
	@mensaje varchar(max),
	@idAyuda int
BEGIN TRY
	BEGIN TRANSACTION

	insert into ayudasSociales(titulo, detalle, usuarioCreacion, usuarioModificacion)
	values(@titulo, @detalle, @usuarioCreacion, @usuarioCreacion)
	set @idAyuda = SCOPE_IDENTITY()
	commit
	IF @codigoComuna = 0 
	BEGIN
		   insert into ayudasSocialesAsignadas(codigoRegion, codigoComuna, idAyudaSocial, usuarioCreacion, usuarioModificacion)
	   select @codigoRegion, codigo, @idAyuda, @usuarioCreacion, 'pepito' 
	   from Comuna where codigoRegion = @codigoRegion
	   
    END
	ELSE
	 BEGIN
	 	   insert into ayudasSocialesAsignadas(codigoRegion, codigoComuna, idAyudaSocial, usuarioCreacion, usuarioModificacion)
	   values(@codigoRegion, @codigoComuna, @idAyuda, @usuarioCreacion, 'arielito')
	   
   END

END TRY
BEGIN CATCH
    SET @mensaje = 'ERROR EN LINEA :' + cast(ERROR_LINE() as varchar) + ' NUMERO DE ERROR ' + cast(ERROR_NUMBER() as varchar) + ' DETALLE: ' + ERROR_MESSAGE()
	RAISERROR (@mensaje,10, 1) 

END CATCH
END
GO
