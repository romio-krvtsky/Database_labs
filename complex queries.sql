SELECT *
FROM services
WHERE (SELECT COUNT(price) FROM services)
ORDER BY price;

SELECT AVG(price)
FROM services;

SELECT title
FROM services
WHERE id IN (SELECT service_id FROM orders);

SELECT barber.name, barbershops.address
FROM barber
         JOIN barbershops ON barber.barbershop_id = barbershops.id
WHERE barbershops.address LIKE 'Minsk%'
ORDER BY barber.name;

SELECT admin.name, user.email, barbershops.address, barbershops.phone_number
FROM admin
         RIGHT JOIN barbershops ON admin.barbershop_id = barbershops.id
         JOIN user ON admin.user_id = user.id
ORDER BY barbershops.id;

SELECT clients.name as cln, application.time, barber.name as brb, barbershops.address
FROM application
         LEFT JOIN barber ON application.barber_id = barber.id
         JOIN clients ON application.client_id = clients.id
         JOIN barbershops ON application.barbershop_id = barbershops.id;

SELECT barber.name, timetable.time_start, timetable.time_end
FROM timetable_barbers
         JOIN barber ON timetable_barbers.barber_id = barber.id
         JOIN timetable ON timetable_barbers.timetable_id = timetable.id
         JOIN barbershops ON barber.barbershop_id = barbershops.id
WHERE barbershops.address LIKE 'Minsk%';

SELECT user.email, logging.description
FROM logging
         JOIN user ON logging.user_id = user.id;

SELECT barber.name as workers
FROM barber
UNION
SELECT admin.name
FROM admin;


WITH top_barbers AS (SELECT DISTINCT barber_id
                     FROM application
                     GROUP BY barber_id
                     ORDER BY COUNT(barber_id) DESC
                     LIMIT 2)
SELECT clients.name, clients.phone_number, barber.name, application.barber_id
FROM clients
         JOIN application ON clients.id = application.client_id
         JOIN barber ON application.barber_id = barber.id
WHERE application.barber_id IN (SELECT barber_id FROM top_barbers)
GROUP BY application.barber_id, clients.phone_number, barber.name, clients.name;


SELECT barber.name,  COUNT(clients.name) AS cnt_clients
FROM barber
        JOIN application ON barber.id = application.barber_id
        JOIN clients ON application.client_id = clients.id
GROUP BY barber.name
ORDER BY cnt_clients DESC;
