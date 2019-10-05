SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
GO
ALTER FUNCTION [dbo].[CurrencyFormat](@CurrSymbo NVARCHAR(10), @ExRate NUMERIC(18,5), @value NUMERIC(18,5))
RETURNS NVARCHAR(100)
AS
    BEGIN
	DECLARE @Amt AS NVARCHAR(255)=''
	DECLARE @FinalAmt AS NUMERIC(18,5) = 0
	BEGIN
	 SET @FinalAmt = CONVERT(NUMERIC(18,5), (@ExRate  * @value))
	 SET @Amt =  @CurrSymbo + FORMAT(@FinalAmt, 'N2')
	END
	 RETURN @Amt
    END
GO

