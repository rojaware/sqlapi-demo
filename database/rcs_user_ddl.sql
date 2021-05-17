USE [RcsUsers]
GO

/****** Object:  Table [dbo].[users]    Script Date: 5/12/2021 11:27:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
	[orgId] [int] NULL,
	[username] [nchar](20) NOT NULL,
	[storeId] [int] NULL,
	[role] [varchar](20) NOT NULL,
	[password] [varchar](20) NULL,
	[info] [varchar](1000) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_partners] FOREIGN KEY([orgId])
REFERENCES [dbo].[partners] ([orgId])
GO

ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_partners]
GO

ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_stores] FOREIGN KEY([storeId])
REFERENCES [dbo].[stores] ([storeId])
GO

ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_stores]
GO

