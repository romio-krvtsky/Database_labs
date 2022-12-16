DELIMITER //
CREATE TRIGGER price_verify
    BEFORE INSERT
    ON services
    FOR EACH ROW
    IF NEW.price < 0 THEN
        SET NEW.price = 1;
    END IF;
//


DELIMITER //
CREATE TRIGGER check_null_barber
    AFTER INSERT
    ON application
    FOR EACH ROW
    IF NEW.barber_id IS NULL THEN
        INSERT INTO logging(user_id, description)
        VALUES (NEW.client_id, 'didn\'t choose any barber');
    END IF;
//

INSERT INTO application(barbershop_id, status_seen, status_confirmed, client_id, barber_id, time)
VALUES (1, 1, 1, 1, NULL, '23:00');


DELIMITER //
CREATE TRIGGER check_barbershop_time
    BEFORE INSERT
    ON application
    FOR EACH ROW
    IF NEW.time < '9:00' OR NEW.time > '21:00' THEN
        SIGNAL SQLSTATE '10001'
            SET MESSAGE_TEXT = 'Barbershop is closed!';
    end if //


DELIMITER //
CREATE TRIGGER check_log_length
    BEFORE INSERT
    ON logging
    FOR EACH ROW
    IF (length(NEW.description) <= 5) THEN
        SIGNAL SQLSTATE '40004'
            SET MESSAGE_TEXT = 'Too short log, it should be more informative!';
    END IF;
//

INSERT INTO logging(user_id, description)
VALUES (1, 'hello');

CREATE PROCEDURE get_amount_clients_of_barber(IN brb_nm VARCHAR(15))
BEGIN
    SELECT barber.name, COUNT(clients.name) AS clients_amount
    FROM barber
             JOIN application ON barber.id = application.barber_id
             JOIN clients ON application.client_id = clients.id
    WHERE barber.name=brb_nm
    GROUP BY barber.name;
end //

CALL get_amount_clients_of_barber('Alina R.');