CREATE TABLE [dbo].[PlayingPeriod]
(
	[PeriodId] INT IDENTITY (1,1) NOT NULL,
    [PlayerId] INT NOT NULL,
    [YearFrom] INT NULL,
    [YearTo]   INT NULL,
    PRIMARY KEY CLUSTERED ([PeriodId] ASC),
    CONSTRAINT [FK_PlayingPeriod_Player] FOREIGN KEY ([PlayerId]) REFERENCES [dbo].[Players] ([Id])
)
