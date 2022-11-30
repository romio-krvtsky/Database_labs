CREATE
    DATABASE BarbershopDB;

USE
    BarbershopDB;

CREATE TABLE user
(
    id       SERIAL PRIMARY KEY,
    email    VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(256) NOT NULL
);

CREATE TABLE logging
(
    id          SERIAL PRIMARY KEY,
    user_id     INT  NOT NULL REFERENCES user (id),
    description TEXT NOT NULL
);

CREATE TABLE clients
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(100)       NOT NULL,
    phone_number VARCHAR(50) UNIQUE NOT NULL,
    user_id      INT UNIQUE         NOT NULL REFERENCES user (id)
);

CREATE TABLE barbershops
(
    id           SERIAL PRIMARY KEY,
    address      TEXT               NOT NULL,
    phone_number VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE admin
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(150) NOT NULL,
    barbershop_id INT          NOT NULL REFERENCES barbershops (id),
    user_id       INT UNIQUE   NOT NULL REFERENCES user (id)
);


CREATE TABLE barber
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(150) NOT NULL,
    barbershop_id INT          NOT NULL REFERENCES barbershops (id),
    user_id       INT UNIQUE   NOT NULL REFERENCES user (id)
);

CREATE TABLE timetable
(
    id         SERIAL PRIMARY KEY,
    time_start TIME NOT NULL,
    time_end   TIME NOT NULL
);

CREATE TABLE timetable_barbers
(
    id           SERIAL PRIMARY KEY,
    barber_id    INT NOT NULL REFERENCES barber (id),
    timetable_id INT NOT NULL REFERENCES timetable (id)
);

CREATE TABLE services
(
    id       SERIAL PRIMARY KEY,
    title    VARCHAR(150) NOT NULL,
    price    INT          NOT NULL,
    duration INT          NOT NULL,
    CONSTRAINT CHK_service CHECK (price >= 0 AND duration > 0)
);

CREATE TABLE services_in_barbershops
(
    id             SERIAL PRIMARY KEY,
    barbershops_id INT NOT NULL REFERENCES barbershops (id),
    service_id     INT NOT NULL REFERENCES services (id)
);

CREATE TABLE application
(
    id               SERIAL PRIMARY KEY,
    barbershop_id    INT NOT NULL REFERENCES barbershops (id),
    status_seen      BOOLEAN DEFAULT FALSE,
    status_confirmed BOOLEAN DEFAULT FALSE,
    client_id        INT NOT NULL REFERENCES clients (id),
    barber_id        INT NULL REFERENCES barber (id),
    time           TIME       NOT NULL
);

CREATE TABLE orders
(
    id             SERIAL PRIMARY KEY,
    application_id INT UNIQUE NOT NULL REFERENCES application (id),
    service_id     INT        NOT NULL REFERENCES services (id)
);

