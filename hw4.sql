CREATE TABLE `cinema`.`films` (
  `id_film` INT NOT NULL AUTO_INCREMENT,
  `title` TEXT(50) NOT NULL,
  `duration` INT NOT NULL,
  PRIMARY KEY (`id_film`));


CREATE TABLE `cinema`.`sessions` (
  `id_session` INT NOT NULL AUTO_INCREMENT,
  `start_session` DATETIME NOT NULL,
  `id_film` INT NOT NULL,
  PRIMARY KEY (`id_session`),
  INDEX `id_film_idx` (`id_film` ASC) VISIBLE,
  CONSTRAINT `id_film`
    FOREIGN KEY (`id_film`)
    REFERENCES `cinema`.`film` (`id_film`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `cinema`.`tickets` (
  `id_ticket` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(5,2) NOT NULL,
  `id_session` INT NOT NULL,
  PRIMARY KEY (`id_ticket`),
  INDEX `id_session_idx` (`id_session` ASC) VISIBLE,
  CONSTRAINT `id_session`
    FOREIGN KEY (`id_session`)
    REFERENCES `cinema`.`sessions` (`id_session`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `cinema`.`films` (`title`, `duration`) VALUES ('Terminator', '120');
INSERT INTO `cinema`.`films` (`title`, `duration`) VALUES ('Bumer', '90');
INSERT INTO `cinema`.`films` (`title`, `duration`) VALUES ('Rembo', '60');

INSERT INTO `cinema`.`sessions` (`start_session`, `id_film`) VALUES ('2022-01-01 12:00:00', '1');
INSERT INTO `cinema`.`sessions` (`start_session`, `id_film`) VALUES ('2022-01-01 15:00:00', '2');
INSERT INTO `cinema`.`sessions` (`start_session`, `id_film`) VALUES ('2022-01-01 16:00:00', '3');

INSERT INTO `cinema`.`tickets` (`price`, `id_session`) VALUES ('350', '1');
INSERT INTO `cinema`.`tickets` (`price`, `id_session`) VALUES ('350', '2');
INSERT INTO `cinema`.`tickets` (`price`, `id_session`) VALUES ('500', '3');

-- Селект демонстрирующий всю нужную информацию
select s.start_session 'Время начала', f.title 'Название', f.duration 'Длительность', t.price 'Цена' from sessions s 
left join films f on s.id_film = f.id_film
left join tickets t on t.id_session = s.id_session