use quan_ly_ban_hang;

select order_id,order_date,order_total_price
from orders;

select c.customer_id, c.customer_name, p.product_name
from customer c
join orders o on c.customer_id = o.order_id 
join order_detail od on o.order_id = od.order_id
join product p on od.product_id = p.product_id;

select c.customer_name
from customer c
where c.customer_id not in (
select c.customer_id
from customer c
join orders o on c.customer_id = o.order_id 
join order_detail od on o.order_id = od.order_id
join product p on od.product_id = p.product_id
);

select o.order_id, order_date as sale_date, sum(od.order_quantity*p.product_price) as total_price
from orders o
join order_detail od on o.order_id = od.order_id
join product p on p.product_id = od.product_id
group by o.order_id;
    