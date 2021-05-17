USE [RcsUsers]
GO

/****** Object:  Table [dbo].[partners]    Script Date: 5/12/2021 11:26:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[partners](
	[orgId] [int] NOT NULL,
	[logo] [varchar](200) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[roles] [nvarchar](max) NULL,
	[info] [nvarchar](500) NULL,
 CONSTRAINT [PK_partners] PRIMARY KEY CLUSTERED 
(
	[orgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

