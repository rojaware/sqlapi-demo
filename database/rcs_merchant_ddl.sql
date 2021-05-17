USE [RcsUsers]
GO

/****** Object:  Table [dbo].[merchants]    Script Date: 5/12/2021 11:25:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[merchants](
	[merchantId] [int] NOT NULL,
	[ordId] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[info] [varchar](1000) NULL,
 CONSTRAINT [PK_merchants] PRIMARY KEY CLUSTERED 
(
	[merchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[merchants]  WITH CHECK ADD  CONSTRAINT [FK_merchants_partners] FOREIGN KEY([ordId])
REFERENCES [dbo].[partners] ([orgId])
GO

ALTER TABLE [dbo].[merchants] CHECK CONSTRAINT [FK_merchants_partners]
GO

