CREATE SCHEMA Person;
 GO

CREATE TABLE [Person].Person (
							BusinessEntityID Int IDENTITY(1,1) PRIMARY KEY,
							PersonType Varchar(2),
							NameStyle Int,
							Title Varchar(3),
							FirstName Varchar(50) NOT NULL,
							MiddleName Varchar(50),
							LastName Varchar(50) NOT NULL,
							Suffix Varchar(50),
							EmailPromotion Int,
							AdditionalContactInfo Varchar(Max),
							Demographics Varchar(Max),
							rowguid Varchar(Max) NOT NULL,
							ModifiedDate Datetime NOT NULL
 							);

-------------------------------------------------------------------------------------------------------
 
 CREATE SCHEMA Sales
 GO;
 
 CREATE TABLE [Sales].Customer (
 								CustomerID Int IDENTITY(1,1) PRIMARY KEY,
 								CONSTRAINT FK_Sales_Customer FOREIGN KEY (PersonID) REFERENCES Person.Person (BusinessEntityID),
 								StoreID Int,
 								TerritoryID Int NOT NULL,
 								AccountNumber Varchar(10) NOT NULL,
 								rowguid Varchar(MAX) NOT NULL,
 								ModifiedDate Datetime NOT NULL
 								);

 							
CREATE TABLE [Sales].SalesOrderHeader(
									SalesOrderID Int IDENTITY(1,1) PRIMARY KEY,
									RevisionNumber Int,
									OrderDate Datetime NOT NULL,
									DueDate Datetime NOT NULL,
									ShipDate Datetime,
									Status Int,
									OnlineOrderFlag Int,
									SalesOrderNumber Varchar(5),
									PurchaseOrderNumber	Varchar(13),
									AccountNumber Varchar(20)
									CONSTRAINT FK_Order_Header FOREIGN KEY (CustomerID) REFERENCES Sales.Customer (CustomerID),
									SalesPersonID Int,	
									TerritoryID	Int,
									BillToAddressID	Int,
									ShipToAddressID	Int,
									ShipMethodID Int,
									CreditCardID Int,
									CreditCardApprovalCode Varchar(50),
									CurrencyRateID	Int,
									SubTotal Decimal(10,2),
									TaxAmt Decimal(10,2),
									Freight	Decimal(10,2),
									TotalDue Decimal(10,2),
									Comment	Varchar(MAX),
									rowguid	Varchar(MAX) NOT NULL,
									ModifiedDate Datetime NOT NULL
									);
 							

CREATE TABLE [Sales].SalesOrderDetail(
									CONSTRAINT FK_Order_Detail FOREIGN KEY (SalesOrderID) REFERENCES Sales.SalesOrderHeader (SalesOrderID),
									SalesOrderDetailID Int IDENTITY(1,1) PRIMARY KEY,
									CarrierTrackingNumber Varchar(12),
									OrderQty Int,
									ProductID Int,
									SpecialOfferID Int(10),
									UnitPrice DECIMAL(10,2),
									UnitPriceDiscount DECIMAL(10,2),
									LineTotal DECIMAL(10,2),
									rowguid Varchar(MAX) NOT NULL,
									ModifiedDate Datetime NOT NULL
									);


CREATE TABLE [Sales].SpecialOfferProduct (
										  SpecialOfferID Int IDENTITY(1,1) PRIMARY KEY,
										  CONSTRAINT FK_Sales_Customer FOREIGN KEY (ProductID) REFERENCES Production.Product (ProductID),
										  rowguid Varchar(50) NOT NULL,
 										  ModifiedDate Datetime NOT NULL
										  );
										  
-------------------------------------------------------------------------------------------------------
 
 CREATE SCHEMA Production
 GO;

CREATE TABLE [Production].Product(
								ProductID Int IDENTITY(1,1) PRIMARY KEY,
								Name Varchar(Max) NOT NULL,
								ProductNumber Varchar(5) NOT NULL,
								MakeFlag Varchar(10) NOT NULL,
								FinishedGoodsFlag Int NOT NULL,
								Color varchar(50),
								SafetyStockLevel Int,
								ReorderPoint Int,
								StandardCost Int,
								Size Int,
								SizeUnitMeasureCode Int,
								WeightUnitMeasureCode Int,
								Weight Int,
								DaysToManufacture Int,
								ProductLine Int,
								Class Varchar(1),
								Style Varchar(1),
								ProductSubcategoryID Int,
								ProductModelID Int,
								SellStartDate Datetime NOT NULL,
								SellEndDate Datetime,
								DiscontinuedDate Datetime,
								rowguid Varchar(MAX)
								ModifiedDate Datetime NOT NULL
								);	