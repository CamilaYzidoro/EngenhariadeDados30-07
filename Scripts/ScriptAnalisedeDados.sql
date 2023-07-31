"1. Escreva uma query que retorna a quantidade de linhas na tabela Sales.SalesOrderDetail pelo campo SalesOrderID, desde que tenham pelo menos três linhas de detalhes."

SELECT SalesOrderID, COUNT(*) AS NumberOfDetails
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) >= 3;


"2.Escreva uma query que ligue as tabelas Sales.SalesOrderDetail, Sales.SpecialOfferProduct e Production.Product e retorne os 3 produtos (Name) mais vendidos (pela soma de OrderQty), agrupados pelo número de dias para manufatura (DaysToManufacture)."

SELECT TOP 3
       p.Name AS ProductName,
       p.DaysToManufacture,
       SUM(sod.OrderQty) AS TotalOrderQuantity
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SpecialOfferProduct AS sop ON sod.SpecialOfferID = sop.SpecialOfferID
JOIN Production.Product AS p ON sop.ProductID = p.ProductID
GROUP BY p.Name, p.DaysToManufacture
ORDER BY SUM(sod.OrderQty) DESC;

"3. Escreva uma query ligando as tabelas Person.Person, Sales.Customer e Sales.SalesOrderHeader de forma a obter uma lista de nomes de clientes e uma contagem de pedidos efetuados."

SELECT 
    p.FirstName + ' ' + p.LastName AS CustomerName,
    COUNT(soh.SalesOrderID) AS OrderCount
FROM Person.Person AS p
JOIN Sales.Customer AS c ON p.BusinessEntityID = c.PersonID
LEFT JOIN Sales.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
GROUP BY p.FirstName, p.LastName;

"4. Escreva uma query usando as tabelas Sales.SalesOrderHeader, Sales.SalesOrderDetail e Production.Product, de forma a obter a soma total de produtos (OrderQty) por ProductID e OrderDate."

SELECT 
    sod.ProductID,
    soh.OrderDate,
    SUM(sod.OrderQty) AS TotalOrderQty
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY sod.ProductID, soh.OrderDate;


"5. Escreva uma query mostrando os campos SalesOrderID, OrderDate e TotalDue da tabela Sales.SalesOrderHeader. Obtenha apenas as linhas onde a ordem tenha sido feita durante o mês de setembro/2011 e o total devido esteja acima de 1.000. Ordene pelo total devido decrescente."

SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE 
    YEAR(OrderDate) = 2011 AND
    MONTH(OrderDate) = 9 AND
    TotalDue > 1000
ORDER BY TotalDue DESC;

