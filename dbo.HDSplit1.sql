SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[HDSplit](@String nvarchar(max))       
    returns @temptable TABLE (items nvarchar(max))       
    as       
    begin       
        DECLARE @Delimiter VARCHAR(10)
        SET @Delimiter = ','
        declare @idx int       
        declare @slice nvarchar(max)       
          
        select @idx = 1       
            if len(@String)<1 or @String is null  return       
          
        while @idx!= 0       
        begin       
            set @idx = charindex(@Delimiter,@String)       
            if @idx!=0       
                set @slice = left(@String,@idx - 1)       
            else       
                set @slice = @String       
              
            if(len(@slice)>0)  
                insert into @temptable(Items) values(RTRIM(LTRIM(@slice)))
      
            set @String = right(@String,len(@String) - @idx)       
            if len(@String) = 0 break       
        end   
    return       
    end  
GO


