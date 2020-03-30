"Exercice 1"

select last_name, first_name
from actor
where actor_id not in
(
select actor.actor_id
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where title in
(
select title
from film 
join film_actor on film.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id
where last_name = "MCCONAUGHEY" and first_name = "CARY"
)
)
order by last_name

"#Exercice 2"

select last_name, first_name
from actor
where actor_id not in
(
select actor.actor_id
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where title in
(
select title
from film 
join film_actor on film.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id
where last_name = "MCCONAUGHEY" and first_name = "CARY"
)
)

"#Exercice 3"
"#1 --"

select title, count(*) nB_actor from actor
    join film_actor on actor.actor_id = film_actor.actor_id
    join film on film_actor.film_id = film.film_id
    group by title

   having nb_actor = (select max(nb_actor) from (
   select title, count(*) nB_actor from actor
    join film_actor on actor.actor_id = film_actor.actor_id
    join film on film_actor.film_id = film.film_id
    group by title
    )
    t1
)
   ;

"#2 --"

select title, count(*) nB_actor
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
group by title
order by nb_actor desc
limit 1

"#3 --"


select title, nB_actor
from
(
select title, count(*) nB_actor,
    row_number() over (order by count(*) desc) rn
    from actor
    join film_actor on actor.actor_id = film_actor.actor_id
    join film on film_actor.film_id = film.film_id
    group by title
)
t1
where rn = 1;


"#Exercice 4"

select actor.actor_id ID, last_name NOM, first_name PRENOM, name CATEGORIE, count(name) NB_FILM from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id 
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where name like "action" 
group by actor.actor_id, name
order by actor.actor_id
;