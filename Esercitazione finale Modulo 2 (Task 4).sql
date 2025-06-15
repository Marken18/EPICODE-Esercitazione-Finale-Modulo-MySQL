
#punto 1) verificati che i campi delle PK siano univoci controllando che non ci siano duplicati e NULL per ogni tabella
select count(distinct categoryID) as ValoriUnivoci from category where categoryID is not null;
select count(distinct CountryID) as ValoriUnivoci from Country where CountryID is not null;
select count(distinct RegionID) as ValoriUnivoci from Region where RegionID is not null;
select count(distinct ProductID) as ValoriUnivoci from product where ProductID is not null;
select count(distinct CODE_Transaction) as ValoriUnivoci from Sales where CODE_Transaction is not null;


#punto 2) esposto l'elenco delle transazioni in base ai criteri richiesti dalla consegna con più join tra le tabelle del database e utilizzato la funzione CASE 
#per utilizzare operazioni condizionali
select S.CODE_Transaction, S.OrderDate, P.ProductName, P.CategoryName, C.Countryname, R.RegionName,
case when datediff(S.ShippingDate, S.OrderDate) >180 then 'True'else 'false' end as ShippingMore180Days
from sales S
left join product P on P.ProductID = S.ProductID
left join category CAT on P.CategoryID = CAT.CategoryID
left join region R on S.RegionID = R.RegionID
left join country C on R.RegionID = C.RegionID;



#punto 3) Esposto l'elenco dei prodotti che hanno venduto sopra la media nell'ultimo anno di vendita tramite il metodo delle subquery.
#Ho trovato prima i totali per prodotto, poi l'ultimo anno di vendita posto come condizione condizione, poi ho impostato la condizione che il totale sia oltre 
#la media e infine trovata la media delle vendite
SELECT p.productid, p.ProductName,
SUM(s.SalesAmount) AS TotalSales
FROM sales s
JOIN product p ON p.productid = s.productID
WHERE YEAR(s.OrderDate) = (SELECT MAX(YEAR(OrderDate))
FROM sales)
GROUP BY p.productid
HAVING SUM(s.SalesAmount) > 
   (SELECT AVG(TotalSales) 
     FROM (
        SELECT SUM(SalesAmount) AS TotalSales
        FROM sales
        WHERE YEAR(OrderDate) = (SELECT MAX(YEAR(OrderDate)) FROM sales)
        GROUP BY productID) AS perProduct);




#punto 4) esposto l'elenco dei prodotti venduti e il totale fatturato per anno impostando come condizione la quantità venduta maggiore a 0
SELECT p.productName, year(s.orderdate) as Year,
SUM(SalesAmount) AS total_sales
FROM product p
JOIN sales s ON p.productid = s.productid
WHERE s.quantity > 0
GROUP BY p.ProductID, p.productname, s.OrderDate
ORDER BY p.ProductName, s.OrderDate;



#punto 5) esposto il fatturato di ogni stato per anno in modo decrescente utilizzando le join tra le tabelle 
select distinct C.Countryname, year(s.orderdate) as Year,
SUM(SalesAmount) AS total_sales
from sales S
left join product P on P.ProductID = S.ProductID
left join category CAT on P.CategoryID = CAT.CategoryID
left join region R on S.RegionID = R.RegionID
left join country C on R.RegionID = C.RegionID
GROUP BY C.Countryname, s.SalesAmount, year 
ORDER BY total_sales DESC, year DESC;



#punto 6) Qual'è la categoria di articoli maggiormente richiesta dal mercato? La Categoria più richiesta è la "Home & Kitchen"
select distinct CAT.CategoryName,
SUM(quantity) AS total_quantitysold
from sales S
left join product P on P.ProductID = S.ProductID
left join category CAT on P.CategoryID = CAT.CategoryID
group by cat.CategoryName
order by total_quantitysold DESC;



#punto 7) quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti. Non ci sono prodotti invenduti,
#il controllo è stato fatto sulle quantità pari a 0 e con la verifica di presenza di NULL
SELECT p.productName, s.quantity
FROM product p
JOIN sales s ON p.productid = s.productid
WHERE s.quantity = 0;

SELECT p.productName, s.quantity
FROM product p
JOIN sales s ON p.productid = s.productid
WHERE s.quantity is null;


#punto 8) creazione di una vista che espone le informazioni utili dei prodotti
create view productVW as select p.productID, p.productname, cat.categoryname
from product p
join category CAT on P.CategoryID = CAT.CategoryID;


#punto 9) creazione di una vista che espone le informazioni geografiche
create view GeographicData as select r.RegionID, r.regionname, c.countryname
from Region r
join country c on r.regionID = c.RegionID;



