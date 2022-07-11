/*Ejercicios Select*/


Select CustomerID,FirstName,MiddleName,LastName, CompanyName from SalesLT.Customer;

Select Name,ProductID,Color from SalesLT.Product;

Select CustomerID, SalesOrderID from SalesLT.SalesOrderHeader;

/*Filtrado de datos*/



Select BusinessEntityID,LoginID,JobTitle from HumanResources.Employee where JobTitle = 'Research and Development Engineer';

Select BusinessEntityID, FirstName, MiddleName,LastName  from Person.Person WHERE MiddleName = 'J';


select [ProductID],[StartDate],[EndDate],[StandardCost],[ModifiedDate] from Production.ProductCostHistory
WHERE cast( [ModifiedDate] as date) = '2007-06-17';


Select BusinessEntityID,LoginID,JobTitle from HumanResources.Employee where JobTitle not in ('Research and Development Engineer');


Select [BusinessEntityID],[FirstName],[MiddleName],[ModifiedDate] from [Person].[Person] WHERE CAST([ModifiedDate] AS DATE) > '29-12-2000';


Select [BusinessEntityID],[FirstName],[MiddleName],[ModifiedDate] from [Person].[Person] WHERE CAST([ModifiedDate] AS DATE) not in ('29-12-2000');

Select [BusinessEntityID],[FirstName],[MiddleName],[ModifiedDate] from [Person].[Person] WHERE YEAR(ModifiedDate) = '2000';

Select [ProductID], [Name] from Production.Product WHERE Lower(Name) Like 'chain%' ;

Select [ProductID], [Name] from Production.Product WHERE Lower(Name) Like '%helmet%' ;

Select [BusinessEntityID],[FirstName],[MiddleName],[LastName] from Person.Person WHERE lOWER(MiddleName) in ('e','j') ;

/* Filtrado con m�ltiples predicados*/


Select [SalesOrderID],[OrderDate],[DueDate], TotalDue from [Sales].[SalesOrderHeader] WHERE year([OrderDate]) = '2007'
AND month([OrderDate]) ='09' AND TotalDue > 1000;

Select [SalesOrderID],[OrderDate],[DueDate], TotalDue from [Sales].[SalesOrderHeader] WHERE cast(OrderDate as date)
BETWEEN '01-09-2001' AND '03-09-2005' AND TotalDue > 1000;

Select [SalesOrderID],[OrderDate],[DueDate], TotalDue from [Sales].[SalesOrderHeader] WHERE cast(OrderDate as date) >
 '01-09-2001' AND cast(OrderDate as date) <  '03-09-2005' AND TotalDue > 1000;

 Select * from Sales.SalesOrderHeader WHERE
 SalesPersonID = '279' OR TerritoryID = '6';

  Select * from Sales.SalesOrderHeader WHERE
 SalesPersonID = '279' OR TerritoryID IN ('6','4');

 /*Trabajando con nulos */

 Select ProductID,  Name   ,Color from Production.Product WHERE Color is NULL;

 Select ProductID , Name, Style, Size, Color from Production.Product WHERE Style is NOT NULL OR Size is not null or Color is not null ;

 /* Ordenando los datos */

 Select * from Person.Person ORDER BY FirstName, LastName, MiddleName ASC;

 /* Uso de funciones y expresiones*/

 Select CONCAT([AddressLine1],[City],[PostalCode]) AS 'Complete Address' FROM Person.Address;


Select ProductID,  Name ,ISNULL(Color, 'Sin color')	FROM Production.Product;

Select ProductID,  Name , Name + ':' + ISNULL(Color, 'Sin color') AS 'description' FROM Production.Product;

Select CAST(ProductID AS NVARCHAR) + ' ' + Name AS ProductID , Name + ':' + ISNULL(Color, 'Sin color')
AS 'description' , ISNULL(Color, 'Sin color') AS Color FROM Production.Product;

/* Uso de operadores matematicos */

Select MaxQty -MinQty AS Difference, SpecialOfferID, Description from Sales.SpecialOffer ;

Select MaxQty*DiscountPct AS Multiplication ,  SpecialOfferID, Description from Sales.SpecialOffer;


Select ISNULL(MaxQty,10)*DiscountPct AS Multiplication ,  SpecialOfferID, Description from Sales.SpecialOffer;

Select SUBSTRING(AddressLine1,1,10) from Person.Address ;


Select SUBSTRING(AddressLine1,10,15) from Person.Address ;

Select UPPER(Firstname) , UPPER(Lastname) From Person.Person;

Select SUBSTRING(ProductNumber, CHARINDEX('-',ProductNumber) + 1 , len(ProductNumber) - CHARINDEX('-',ProductNumber)) from Production.Product;

/* Consultas con fechas */

Select * from Sales.SalesOrderHeader;

Select datediff(day , OrderDate, ShipDate) AS 'difference', SalesOrderID, OrderDate, ShipDate FROM Sales.SalesOrderHeader;

Select CAST(OrderDate as date) as OrderDate, Cast(ShipDate as Date) as ShipDate FROM Sales.SalesOrderHeader;

Select Dateadd(month,6, cast(OrderDate as date)) as Addedmonths, SalesOrderID, OrderDate, ShipDate FROM Sales.SalesOrderHeader;

Select YEAR(OrderDate) as year, Month(OrderDate) as month, OrderDate from Sales.SalesOrderHeader;

Select YEAR(OrderDate) as year,DATENAME(month,	OrderDate) as month ,OrderDate from Sales.SalesOrderHeader;

/*Funciones matematicas*/

Select round(SubTotal,2) as subtotal_redondeado from Sales.SalesOrderHeader;

Select round(SubTotal,0) + 0 as subtotal_redondeado from Sales.SalesOrderHeader;

Select sqrt(SalesOrderID) as raiz from Sales.SalesOrderHeader;

Select 1 + RAND()*10;

/* Uso de WHERE y ORDER BY */

Select SalesOrderID, OrderDate from Sales.SalesOrderHeader WHERE YEAR(OrderDate) in ('2007');

Select OrderDate FROM Sales.SalesOrderHeader ORDER BY month(OrderDate) , year(OrderDate);

Select PersonType, FirstName, MiddleName, LastName
			from Person.Person
			Order by
(Case
	WHEN PersonType = 'IN' OR PersonType = 'SP' OR PersonType = 'SC' Then  Lastname
	ELSE  Firstname
END );


/* Queries sobre multiples tablas */

/*Inner Join*/



Select JobTitle	, BirthDate, FirstName, MiddleName, LastName from Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID;

Select * from Person.Person;

Select s.CustomerID from Sales.Customer AS s
INNER JOIN Person.Person AS p
ON s.PersonID = p.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader as o
ON s.CustomerID = o.CustomerID	;


select * from Sales.SalesOrderHeader;