CREATE PROCEDURE [dbo].[PlayerSearch]
    @Search nvarchar(50) = null,
    @Offset int = 0,
    @Limit int = 10,
    @SortBy nvarchar(50) = 'LastName',
	@SortOrder nvarchar(4) = 'asc'

AS
BEGIN
    DECLARE @Year int;
    SET @Year = NULL;

    IF ISNUMERIC(@Search) = 1
    BEGIN
        SET @Year = CAST(@Search AS int);
    END

	SELECT p.*, SUM(y.YearTo - y.YearFrom) as Years	 
    FROM dbo.Players p
    LEFT JOIN PlayingPeriod y ON p.Id = y.PlayerId
	where 
	(@Search is null or 
		(
			p.FirstName like '%' + @Search + '%'
			OR p.LastName like '%' + @Search + '%'
			OR p.Position like '%' + @Search + '%'
			OR p.Nationality like '%' + @Search + '%')
			OR (@Year IS NOT NULL AND y.YearFrom <= @Year AND y.YearTo >= @Year
		)
	)
	 GROUP BY p.Id, 
	 p.Appearances, 
	 p.AppsAsSub, 
	 p.FirstName, 
	 p.LastName, 
	 p.Goals, 
	 p.YearsAtClub, 
	 p.YearOfBirth, 
	 p.PositionFull, 
	 p.Position, 
	 p.Nationality, 
	 p.Number, 
	 p.Link, 
	 p.FullName,
	 p.FirstYearAtClub, 
	 p.DateOfBirth
	 ORDER BY
         CASE WHEN @SortBy = 'FirstName' AND @SortOrder = 'asc' THEN p.FirstName END ASC,
         CASE WHEN @SortBy = 'FirstName' AND @SortOrder = 'desc' THEN p.FirstName END DESC,
         CASE WHEN @SortBy = 'LastName' AND @SortOrder = 'asc' THEN p.LastName END ASC,
         CASE WHEN @SortBy = 'LastName' AND @SortOrder = 'desc' THEN p.LastName END DESC,
         CASE WHEN @SortBy = 'Position' AND @SortOrder = 'asc' THEN p.Position END ASC,
         CASE WHEN @SortBy = 'Position' AND @SortOrder = 'desc' THEN p.Position END DESC,
         CASE WHEN @SortBy = 'Appearances' AND @SortOrder = 'asc' THEN p.Appearances END ASC,
         CASE WHEN @SortBy = 'Appearances' AND @SortOrder = 'desc' THEN p.Appearances END DESC,
         CASE WHEN @SortBy = 'AppsAsSub' AND @SortOrder = 'asc' THEN p.AppsAsSub END ASC,
         CASE WHEN @SortBy = 'AppsAsSub' AND @SortOrder = 'desc' THEN p.AppsAsSub END DESC,
         CASE WHEN @SortBy = 'Goals' AND @SortOrder = 'asc' THEN p.Goals END ASC,
         CASE WHEN @SortBy = 'Goals' AND @SortOrder = 'desc' THEN p.Goals END DESC,
         CASE WHEN @SortBy = 'YearsAtClub' AND @SortOrder = 'asc' THEN p.YearsAtClub END ASC,
         CASE WHEN @SortBy = 'YearsAtClub' AND @SortOrder = 'desc' THEN p.YearsAtClub END DESC,
         CASE WHEN @SortBy = 'Nationality' AND @SortOrder = 'asc' THEN p.Nationality END ASC,
         CASE WHEN @SortBy = 'Nationality' AND @SortOrder = 'desc' THEN p.Nationality END DESC
		
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END
