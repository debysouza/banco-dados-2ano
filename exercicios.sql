--w3schools
--1. Quantos filmes há em Português?
select
	count(*) as "Qtd. de Filmes"
from
	film f 
inner join "language" l on
	l.language_id = f.language_id
where 
	l."name" = :escolha;

--2. Quantos clientes alugaram o filme
--de id = 7?	
select
	count(*) as "Qtd. de Clientes"
from
	customer c
inner join rental r on
	c.customer_id = r.customer_id
inner join inventory i on
	r.inventory_id = i.inventory_id
inner join film f on
	i.film_id = f.film_id
where
	i.film_id = :id;

--3. Quantos aluguéis foram feitos no total?
select
	count(*) as "Qtd aluguéis"
from
	rental r; 

--4. Qual foi o custo de reposição do 
--filme de id = 600?
select
	f.title as "Título do Filme",
	f.replacement_cost as "custo de reposição"
from
	film f
where
	f.film_id = :id;

--5. Qual funcionário alugou mais 
--filmes?
select
	s.first_name,
	s.last_name,
	count(r.rental_id) as "Qtd. filmes"
from
	staff s 
inner join rental r on
	s.staff_id = r.staff_id
group by
	s.first_name,
	s.last_name
order by 
	count(r.rental_id) desc
limit 1;

--6. Quantos funcionários tem em cada 
--loja?
select 
	sta.store_id,
	count(sta.staff_id)
from 
	staff sta
group by
	sta.store_id;

select * from store s;

select
	a.address,
	count(*)
from
	staff sta
inner join store sto on
	sta.store_id = sto.store_id 
inner join address a on
	a.address_id = sto.address_id 
group by
	a.address;

--7. Liste as seguintes colunas:
--título do filme, idioma, custo de reposição,
--data do último aluguel, nome do cliente
--do último aluguel, funcionário que alugou,
--loja do aluguel e preço do aluguel.
select
	f.title as "Título do Filme",
	l."name" as "Idioma",
	f.replacement_cost as "Custo de reposição",
	r.rental_date as "Data do aluguel",
	c.first_name as "Nome do cliente",
	s.first_name as "Nome do funcionário",
	s2.store_id as "Id da Loja",
	f.rental_rate as "Valor do aluguel"
from
	film f
inner join "language" l on
	l.language_id = f.language_id
inner join inventory i on
	i.film_id = f.film_id
inner join rental r on
	r.inventory_id = i.inventory_id
inner join customer c on
	c.customer_id = r.customer_id
inner join staff s on
	s.staff_id = r.staff_id
inner join store s2 on
	s2.store_id = s.store_id
order by 
	r.rental_date desc
limit 1;

--8. Quantos atores que participaram do
--filme de id = 1?
select
	count(*) as "Qtd. de atores"
from
	film_actor fa
where 
	fa.film_id = :id;

--9. Qual loja possui mais inventários?
select
	s.store_id as "Id da Loja",
	count(i.inventory_id)
from
	store s
inner join staff s2 on
	s2.store_id = s.store_id
inner join rental r on
	r.staff_id = s2.staff_id 
inner join inventory i on
	i.inventory_id = r.inventory_id
group by
	s.store_id
order by 
	count(i.inventory_id) desc
limit 1;
