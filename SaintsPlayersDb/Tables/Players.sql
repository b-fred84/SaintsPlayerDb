CREATE TABLE [dbo].[Players]
(	
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [FullName]          NVARCHAR (50)  NULL,
    [FirstName]         NVARCHAR (50)  NULL,
    [LastName]          NVARCHAR (50)  NULL,
    [Position]          NVARCHAR (50)  NULL,
    [PositionFull]      NVARCHAR (50)  NULL,
    [Appearances]       INT  NULL,
    [AppsAsSub]         INT  NULL,
    [Goals]             INT  NULL,
    [YearsAtClub]       NVARCHAR (50)  NULL,
    [Nationality]       NVARCHAR (50)  NULL,
    [Number]            INT  NULL,
    [Link]              NVARCHAR (150) NULL,
    [FirstYearAtClub]   NVARCHAR (50)  NULL,
    [DateOfBirth]       NVARCHAR (50)  NULL,
    [YearOfBirth]       NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
