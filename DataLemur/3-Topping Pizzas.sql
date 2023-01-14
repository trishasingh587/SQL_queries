select
concat(pt1.topping_name, ',', pt2.topping_name, ',', pt3.topping_name) as pizza,
pt1.ingredient_cost + pt2.ingredient_cost + pt3.ingredient_cost as total_cost
from pizza_toppings as pt1, pizza_toppings as pt2, pizza_toppings as pt3
where pt1.topping_name < pt2.topping_name and pt2.topping_name < pt3.topping_name 
order by 2 desc, 1