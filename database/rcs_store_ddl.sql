USE [RcsUsers]
GO

/****** Object:  Table [dbo].[stores]    Script Date: 5/12/2021 11:26:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stores](
	[storeId] [int] NOT NULL,
	[merchantId] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[info] [varchar](1000) NULL,
 CONSTRAINT [PK_stores] PRIMARY KEY CLUSTERED 
(
	[storeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[stores]  WITH CHECK ADD  CONSTRAINT [FK_stores_merchants] FOREIGN KEY([merchantId])
REFERENCES [dbo].[merchants] ([merchantId])
GO

ALTER TABLE [dbo].[stores] CHECK CONSTRAINT [FK_stores_merchants]
GO

