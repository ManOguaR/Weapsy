/****** Object:  Table [dbo].[App]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[Folder] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_App] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [uniqueidentifier] NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CultureName] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[Id] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[SortOrder] [int] NOT NULL,
	[MenuItemType] [int] NOT NULL,
	[PageId] [uniqueidentifier] NULL,
	[Link] [nvarchar](250) NULL,
	[Status] [int] NOT NULL,
	[Text] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuItemLocalisation]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItemLocalisation](
	[MenuItemId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Text] [nvarchar](100) NULL,
	[Title] [nvarchar](100) NULL,
 CONSTRAINT [PK_MenuItemLocalisation] PRIMARY KEY CLUSTERED 
(
	[MenuItemId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Module]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [uniqueidentifier] NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[ModuleTypeId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ModuleType]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleType](
	[Id] [uniqueidentifier] NOT NULL,
	[AppId] [uniqueidentifier] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[ViewType] [int] NOT NULL,
	[ViewName] [nvarchar](100) NOT NULL,
	[EditType] [int] NOT NULL,
	[EditUrl] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ModuleType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[SiteId] [uniqueidentifier] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[Url] [nvarchar](200) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](500) NULL,
	[MetaKeywords] [nvarchar](500) NULL,
	[PageTemplateId] [uniqueidentifier] NULL,
	[ModuleTemplateId] [uniqueidentifier] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageLocalisation]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageLocalisation](
	[PageId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Url] [nvarchar](200) NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](500) NULL,
	[MetaKeywords] [nvarchar](500) NULL,
 CONSTRAINT [PK_PageLocalisation] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageModule]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageModule](
	[Id] [uniqueidentifier] NOT NULL,
	[PageId] [uniqueidentifier] NOT NULL,
	[ModuleId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Zone] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_PageModule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageModuleLocalisation]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageModuleLocalisation](
	[PageModuleId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](100) NULL,
 CONSTRAINT [PK_PageModuleLocalisation] PRIMARY KEY CLUSTERED 
(
	[PageModuleId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Site]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[Url] [nvarchar](50) NULL,
	[Copyright] [nvarchar](50) NULL,
	[Logo] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](500) NULL,
	[MetaKeywords] [nvarchar](500) NULL,
	[HomePageId] [uniqueidentifier] NULL,
	[ThemeId] [uniqueidentifier] NULL,
	[PageTemplateId] [uniqueidentifier] NULL,
	[ModuleTemplateId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Site_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteLocalisation]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteLocalisation](
	[SiteId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](500) NULL,
	[MetaKeywords] [nvarchar](500) NULL,
 CONSTRAINT [PK_SiteLocalisation] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TextLocalisation]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextLocalisation](
	[TextVersionId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_TextLocalisation] PRIMARY KEY CLUSTERED 
(
	[TextVersionId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TextModule]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextModule](
	[Id] [uniqueidentifier] NOT NULL,
	[ModuleId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Text] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TextVersion]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextVersion](
	[Id] [uniqueidentifier] NOT NULL,
	[TextModuleId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_TextVersion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Theme]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Folder] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Theme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 29/06/2016 18:16:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_Menu]
GO
ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_Page] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([Id])
GO
ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_Page]
GO
ALTER TABLE [dbo].[MenuItemLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemLocalisation_MenuItemLocalisation] FOREIGN KEY([MenuItemId], [LanguageId])
REFERENCES [dbo].[MenuItemLocalisation] ([MenuItemId], [LanguageId])
GO
ALTER TABLE [dbo].[MenuItemLocalisation] CHECK CONSTRAINT [FK_MenuItemLocalisation_MenuItemLocalisation]
GO
ALTER TABLE [dbo].[MenuItemLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemLocalisation_MenuItemLocalisation1] FOREIGN KEY([MenuItemId], [LanguageId])
REFERENCES [dbo].[MenuItemLocalisation] ([MenuItemId], [LanguageId])
GO
ALTER TABLE [dbo].[MenuItemLocalisation] CHECK CONSTRAINT [FK_MenuItemLocalisation_MenuItemLocalisation1]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_Module_Module] FOREIGN KEY([Id])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_Module_Module]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_Module_ModuleType] FOREIGN KEY([ModuleTypeId])
REFERENCES [dbo].[ModuleType] ([Id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_Module_ModuleType]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_Module_Site] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Site] ([Id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_Module_Site]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_Site] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Site] ([Id])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_Site]
GO
ALTER TABLE [dbo].[PageLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_PageLocalisation_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[PageLocalisation] CHECK CONSTRAINT [FK_PageLocalisation_Language]
GO
ALTER TABLE [dbo].[PageLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_PageLocalisation_Page] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([Id])
GO
ALTER TABLE [dbo].[PageLocalisation] CHECK CONSTRAINT [FK_PageLocalisation_Page]
GO
ALTER TABLE [dbo].[PageModule]  WITH CHECK ADD  CONSTRAINT [FK_PageModule_Module] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[PageModule] CHECK CONSTRAINT [FK_PageModule_Module]
GO
ALTER TABLE [dbo].[PageModule]  WITH CHECK ADD  CONSTRAINT [FK_PageModule_Page] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([Id])
GO
ALTER TABLE [dbo].[PageModule] CHECK CONSTRAINT [FK_PageModule_Page]
GO
ALTER TABLE [dbo].[PageModuleLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_PageModuleLocalisation_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[PageModuleLocalisation] CHECK CONSTRAINT [FK_PageModuleLocalisation_Language]
GO
ALTER TABLE [dbo].[PageModuleLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_PageModuleLocalisation_PageModule] FOREIGN KEY([PageModuleId])
REFERENCES [dbo].[PageModule] ([Id])
GO
ALTER TABLE [dbo].[PageModuleLocalisation] CHECK CONSTRAINT [FK_PageModuleLocalisation_PageModule]
GO
ALTER TABLE [dbo].[SiteLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_SiteLocalisation_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[SiteLocalisation] CHECK CONSTRAINT [FK_SiteLocalisation_Language]
GO
ALTER TABLE [dbo].[SiteLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_SiteLocalisation_Site] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Site] ([Id])
GO
ALTER TABLE [dbo].[SiteLocalisation] CHECK CONSTRAINT [FK_SiteLocalisation_Site]
GO
ALTER TABLE [dbo].[TextLocalisation]  WITH CHECK ADD  CONSTRAINT [FK_TextLocalisation_TextVersion] FOREIGN KEY([TextVersionId])
REFERENCES [dbo].[TextVersion] ([Id])
GO
ALTER TABLE [dbo].[TextLocalisation] CHECK CONSTRAINT [FK_TextLocalisation_TextVersion]
GO
ALTER TABLE [dbo].[TextVersion]  WITH CHECK ADD  CONSTRAINT [FK_TextVersion_TextModule] FOREIGN KEY([TextModuleId])
REFERENCES [dbo].[TextModule] ([Id])
GO
ALTER TABLE [dbo].[TextVersion] CHECK CONSTRAINT [FK_TextVersion_TextModule]
GO
