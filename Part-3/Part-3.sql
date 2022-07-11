Select BusinessEntityID,NationalIDNumber,  BirthDate, HireDate  from HumanResources.Employee
Where JobTitle = 'Marketing Specialist'
Order by HireDate asc;

Select p.BusinessEntityID, FirstName, LastName, e.EmailAddress  from  Person.Person as p
inner join Person.EmailAddress as e on p.BusinessEntityID = e.BusinessEntityID
Where FirstName Like 'M%' or FirstName Like 'S%'
Order by FirstName DESC;

Select count(SalesPersonID) , TerritoryID
From Sales.SalesOrderHeader
WHERE TotalDue < 1000
group by TerritoryID

Select ProductID as IDProducto, Name as Nombre, Style as Estilo, Size as Tama�o, Color, Weight as Peso from Production.Product
Where Style is not NULL AND Size is not null and Color is not Null AND Weight IS NOT null;

Select count(*) from Person.Person Where LastName Like 'D%' AND lower(LastName) Like '%a%';

Select * from Sales.SalesOrderHeader as o
inner join Sales.Store as s
on o.BusinessEntityID = s.BusinessEntityID

select Max(UnitPrice) from Sales.SalesOrderDetail ;
