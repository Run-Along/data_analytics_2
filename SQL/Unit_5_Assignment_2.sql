select * from film inner join film_actor on film.film_id = film_actor.film_id;

select * from actor inner join film_actor on actor.actor_id = film_actor.actor_id;

select * from film inner join film_actor on film.film_id = film_actor.film_id 
inner join actor on actor.actor_id = film_actor.actor_id; 