/*
Date: 12.5.2022
Author: EverApprentice
Description: A copy for personal answer to assignment 11 CIS80.
*/

/*1. A script that declares a variable and sets it to the count of 
all products in the Product table. If count is greater than or equal
to 7, disply message that says, "The number of products is greater 
than or equal to 7". Otherwise, "The number of products is less than 7."*/
USE MyGuitarShop;

DECLARE @count_product INT;
SET @count_product = (SELECT COUNT(*) FROM Products);

IF @count_product >= 7
    PRINT 'The number of products is greater than or equal to 7.';
ELSE
    PRINT 'The number of products is less than 7.';    


/*2. A script that attempts to insert a new category named "Guitars"
into the Categories table. If the insert is successful, the script should
display this message:
    SUCCESS: Record was inserted.
For unsuccessful insertion,
    FAILTURE: Record was not inserted.
        Error [number]: [Error message]*/
USE MyGuitarShop;

BEGIN TRY
    INSERT INTO Categories(CategoryID, CategoryName)
    VALUES(4,'Guitars')
    PRINT 'SUCCESS: Record was inserted.'
END TRY
BEGIN CATCH
    PRINT 'FALURE: Record was not inserted.';
    PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ": " +
        ERROR_MESSAGE();
END CATCH
