select distinct 
	ord.order_id,
	cus.first_name+ ' ' + cus.last_name as 'customer_name',
	cus.city,
	cus.state,
	ord.order_date,
	sum	(ite.quantity) as 'total_units',
	sum (ite.quantity * ite.list_price) as 'revenue',
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	sta.first_name+ ' ' + sta.last_name as 'Sales_rep'
	
	
from sales.orders ord

join sales.customers cus
on ord.customer_id = cus.customer_id

join sales.order_items ite
on ord.order_id = ite.order_id

join production.products pro
on ite.product_id = pro.product_id

join production.categories cat
on pro.category_id = cat.category_id

join sales.stores sto
on ord.store_id = sto.store_id

join sales.staffs sta
on sto.store_id = sta.store_id

join production.brands bra
on pro.brand_id = bra.brand_id

group by 
ord.order_id,
	cus.first_name+ ' ' + cus.last_name,
	cus.city,
	cus.state,
	ord.order_date,
	(ite.quantity),
	(ite.quantity * ite.list_price),
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	sta.first_name+ ' ' + sta.last_name;


	--select * from sales.stores;
	--select * from sales.orders;
	--select * from sales.staffs;