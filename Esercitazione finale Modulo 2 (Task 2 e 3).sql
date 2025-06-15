

#creazione database ToysGroup
	create database ToysGroup;


#Creazione tabella/entità Category
    create table Category (
	CategoryID INT PRIMARY KEY ,
    CategoryName VARCHAR(100));

#Tabella modificata per permettere una PK autogenerativa
    alter table Category 
	Modify CategoryID INT auto_increment;

#Creazione tabella/entità Region con PK autogenerativa
    create table  Region (
	RegionID INT  auto_increment PRIMARY KEY ,
    RegionName VARCHAR(100));
    

#Creazione tabella/entità Country con PK autogenerativa e FK da Region
    create table Country (
	CountryID INT auto_increment PRIMARY KEY ,
    CountryName VARCHAR(100),
    RegionID INT,
    foreign key (RegionID) references Region (RegionID));
    
   
#Creazione tabella Product con PK autogenerativa e FK derivata da Category
    create table Product (ProductID INT auto_increment PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryName VARCHAR(100),
    CategoryID INT,
    UnitCost DECIMAL (10,2),
    UnitSellingPrice DECIMAL(10,2),
    foreign key (CategoryID) references Category (CategoryID));
    
    
    
  #creata tabella Sales con PK autogenerativa e FK derivate da Region e Product  
    create table Sales (
    CODE_Transaction INT auto_increment PRIMARY KEY,
    OrderDate DATE,
    ShippingDate DATE,
    SalesAmount DECIMAL(10,2),
    TotalCost DECIMAL (10,2),
    Quantity INT,
    RegionID INT,
    ProductID INT,
    foreign key (RegionID) references Region (RegionID),
    foreign key (ProductID) references Product (ProductID));
    
    
    
#inseriti dati nella tabella Category tramite dummy    
INSERT INTO Category (CategoryName) VALUES
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Books'),
('Toys & Games'),
('Sports & Outdoors'),
('Beauty & Personal Care'),
('Automotive'),
('Grocery'),
('Health & Wellness');
    
#inseriti dati nella tabella Region tramite dummy     
INSERT INTO Region (RegionName) VALUES
('North America'),
('Europe'),
('Asia'),
('South America'),
('Africa'),
('Australia'),
('Middle East'),
('Central America'),
('Caribbean'),
('Antarctica');


#inseriti dati nella tabella Country tramite dummy 
INSERT INTO Country (CountryName, RegionID) VALUES
('United States', 1),
('Canada', 1),
('Germany', 2),
('France', 2),
('Japan', 3),
('India', 3),
('Brazil', 4),
('Argentina', 4),
('South Africa', 5),
('Australia', 6);


#inseriti dati nella tabella Product tramite dummy 
INSERT INTO Product (ProductName, CategoryName, CategoryID, UnitCost, UnitSellingPrice) VALUES
('Smartphone XYZ', 'Electronics', 1, 200.00, 350.00),
('Jeans Classic', 'Clothing', 2, 20.00, 50.00),
('Blender 3000', 'Home & Kitchen', 3, 30.00, 80.00),
('Mystery Novel', 'Books', 4, 5.00, 12.00),
('RC Car', 'Toys & Games', 5, 15.00, 35.00),
('Yoga Mat', 'Sports & Outdoors', 6, 10.00, 25.00),
('Lipstick Red', 'Beauty & Personal Care', 7, 3.00, 8.00),
('Car Air Freshener', 'Automotive', 8, 2.00, 6.00),
('Organic Pasta', 'Grocery', 9, 1.50, 3.50),
('Vitamins Pack', 'Health & Wellness', 10, 8.00, 20.00);

 


#inseriti dati nella tabella Sales tramite dummy 
INSERT INTO Sales (OrderDate, ShippingDate, SalesAmount, TotalCost, Quantity, RegionID, ProductID) VALUES
('2023-01-15', '2023-01-17', 350.00, 200.00, 10, 1, 1),
('2023-02-20', '2023-02-22', 50.00, 20.00, 3, 2, 2),
('2023-03-10', '2023-03-12', 80.00, 30.00, 12, 3, 3),
('2023-04-05', '2023-04-07', 12.00, 5.00, 5, 4, 4),
('2023-05-14', '2023-05-16', 35.00, 15.00, 6, 5, 5),
('2023-06-01', '2023-06-03', 25.00, 10.00, 9, 6, 6),
('2023-07-19', '2023-07-21', 8.00, 3.00, 12, 7, 7),
('2023-08-23', '2023-08-25', 6.00, 2.00, 3, 8, 8),
('2023-09-30', '2023-10-02', 3.50, 1.50, 5, 9, 9),
('2023-10-12', '2023-10-14', 20.00, 8.00, 4, 10, 10);

INSERT INTO Sales (OrderDate, ShippingDate, SalesAmount, TotalCost, Quantity, RegionID, ProductID) VALUES
('2022-11-05', '2022-11-07', 100.00, 50.00, 4, 1, 1),
('2023-01-10', '2023-01-12', 150.00, 70.00, 6, 2, 1),
('2022-12-15', '2022-12-17', 60.00, 30.00, 3, 3, 2),
('2023-02-18', '2023-02-20', 70.00, 35.00, 4, 4, 2),
('2022-09-25', '2022-09-27', 90.00, 45.00, 5, 5, 3),
('2023-03-10', '2023-03-12', 80.00, 40.00, 4, 6, 3),
('2022-07-22', '2022-07-24', 40.00, 20.00, 2, 7, 4),
('2023-04-15', '2023-04-17', 45.00, 22.00, 3, 8, 4),
('2022-08-05', '2022-08-07', 55.00, 27.50, 3, 9, 5),
('2023-05-20', '2023-05-22', 65.00, 32.50, 4, 10, 5);


#interrogazioni delle tabelle per vedere il risultato delle query precedenti
select * from country;
select * from region;
select * from Sales;
select * from Product;
Select * from Category;



 
