SELECT *
FROM user;

SELECT title, price
FROM services
ORDER BY price
        DESC;

SELECT user_id, description
FROM logging;

SELECT address, phone_number
FROM barbershops
WHERE address LIKE 'Minsk%';

SELECT name, phone_number
FROM clients
ORDER BY name;

SELECT name
FROM barber
WHERE barbershop_id = 4
ORDER BY name;

SELECT DISTINCT description
FROM logging;
