INSERT INTO user(email, password)
VALUES ('user4ik@gmail.com', 'hello2world'),
       ('al1nka@gmail.com', 'brbgirl'),
       ('bald_guy@gmail.com', 'skinhead22'),
       ('sancho@gmail.com', 'moyaadminka'),
       ('romain@gmail.com', 'krvtsky'),
       ('clientik1@gmail.com', 'clntk1'),
       ('clientik2@gmail.com', 'clntk2'),
       ('clientik3@gmail.com', 'clntk3'),
       ('clientik4@gmail.com', 'clntk4'),
       ('clientik5@gmail.com', 'clntk5'),
       ('clientik6@gmail.com', 'clntk6'),
       ('clientik7@gmail.com', 'clntk7'),
       ('clientik8@gmail.com', 'clntk8'),
       ('clientik9@gmail.com', 'clntk9'),
       ('barberNo1@gmail.com', 'brbchk1'),
       ('barberNo2@gmail.com', 'brbchk2'),
       ('barberNo3@gmail.com', 'brbchk3'),
       ('barberNo4@gmail.com', 'brbchk4'),
       ('barberNo5@gmail.com', 'brbchk5'),
       ('barberNo6@gmail.com', 'brbchk6'),
       ('barberNo7@gmail.com', 'brbchk7'),
       ('barberNo8@gmail.com', 'brbchk8'),
       ('barberNo9@gmail.com', 'brbchk9'),
       ('iamadmin1@gmail.com', 'admin4ik1'),
       ('iamadmin2@gmail.com', 'admin4ik2'),
       ('iamadmin3@gmail.com', 'admin4ik3'),
       ('iamadmin4@gmail.com', 'admin4ik4'),
       ('iamadmin5@gmail.com', 'admin4ik5');

INSERT INTO barbershops(address, phone_number)
VALUES ('Brest, Pushkinskaya 22', '+375332022423'),
       ('Gomel, Mayakovskogo 7', '+375332022424'),
       ('Hrodno, Brestskaya 1', '+375332022425'),
       ('Minsk, Vostochnaya 48', '+375332022426'),
       ('Kobrin, Gastello 77', '+375332022427'),
       ('Novolukoml, Energetikov 33', '+375332022428');

INSERT INTO admin(name, barbershop_id, user_id)
VALUES ('Nikolay B.', 1, 24),
       ('Igor G.', 2, 25),
       ('Evgenii K.', 3, 26),
       ('Alex S.', 4, 4),
       ('Roman K.', 5, 27),
       ('Nikita N.', 6, 28);

INSERT INTO barber(name, barbershop_id, user_id)
VALUES ('Alina R.', 4, 2),
       ('Artyom L.', 4, 3),
       ('Karina S.', 4, 15),
       ('Sasha B.', 4, 17),
       ('Vitya B.', 1, 18),
       ('Max S.', 1, 19),
       ('Dmitry A.', 2, 20),
       ('Miho G.', 3, 21),
       ('Artemiy D.', 5, 22),
       ('Artsyom B.', 6, 23);


INSERT INTO services(title, price, duration)
VALUES ('Haircut', 20, 45),
       ('Beard Correction', 15, 20),
       ('Complex', 30, 60),
       ('Kid\'s Haircut', 17, 40),
       ('Hair Styling', 3, 5),
       ('Dad + Son', 30, 90);

INSERT INTO clients(name, phone_number, user_id)
VALUES ('Roman', '+375333046906', 5),
       ('Bogdan', '+375293425465', 6),
       ('Vladimir', '+375293425434', 7),
       ('Gerald', '+3752934235465', 8),
       ('Michael', '+375293425477', 9),
       ('Nick', '+375293425499', 10),
       ('Naruto', '+375293425400', 11),
       ('Sergey', '+375293425065', 12),
       ('Alex', '+375293425489', 13),
       ('Oleg', '+375293425111', 14);

INSERT INTO timetable(time_start, time_end)
VALUES ('9:00', '15:00'),
       ('12:00', '18:00'),
       ('15:00', '20:00'),
       ('9:00', '17:30');

INSERT INTO timetable_barbers(barber_id, timetable_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 1),
       (5, 1),
       (6, 3),
       (7, 4),
       (8, 4),
       (9, 4),
       (10, 4);

INSERT INTO services_in_barbershops(barbershops_id, service_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 5),
       (2, 1),
       (2, 2),
       (2, 3),
       (2, 6),
       (3, 1),
       (3, 2),
       (3, 3),
       (3, 4),
       (4, 1),
       (4, 2),
       (4, 3),
       (4, 4),
       (4, 5),
       (4, 6),
       (5, 1),
       (5, 2),
       (5, 3),
       (6, 1),
       (6, 2),
       (6, 3);

INSERT INTO application(barbershop_id, status_seen, status_confirmed, client_id, barber_id, time)
VALUES (1, TRUE, TRUE, 1, 5, '10:00'),
       (2, TRUE, TRUE, 2, NULL, '12:30'),
       (3, TRUE, TRUE, 3, NULL, '14:00'),
       (4, TRUE, TRUE, 4, 1, '9:00'),
       (4, TRUE, TRUE, 5, 2, '15:00'),
       (4, TRUE, TRUE, 6, 3, '13:00'),
       (4, TRUE, TRUE, 7, 4, '17:00'),
       (5, TRUE, TRUE, 8, NULL, '10:00'),
       (6, TRUE, TRUE, 9, NULL, '11:00'),
       (1, TRUE, TRUE, 10, 6, '18:00');

INSERT INTO orders(application_id, service_id)
VALUES (1, 2),
       (2, 1),
       (3, 4),
       (4, 3),
       (5, 2),
       (6, 4),
       (7, 1),
       (8, 3),
       (9, 2),
       (10, 6);

INSERT INTO logging(user_id, description)
VALUES (1, 'logged in as client'),
       (2, 'logged in as barber'),
       (3, 'logged in as barber'),
       (4, 'logged in as admin'),
       (5, 'logged in as client');
