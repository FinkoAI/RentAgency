-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 14 2013 г., 18:54
-- Версия сервера: 5.1.71-community-log
-- Версия PHP: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `RentAgency`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `realty_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `text` text,
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id_comment`, `realty_id`, `user_id`, `date`, `text`) VALUES
(1, 10, 3, '2020-11-20 13:00:00', 'У меня есть квартира на Иркутском тракте 20, возможен ли обмен?'),
(2, 1, 1, '2020-11-20 13:00:00', 'Ужасная квартира за такие деньги!');

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE IF NOT EXISTS `favorites` (
  `id_favorite` int(11) NOT NULL AUTO_INCREMENT,
  `realty_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_favorite`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id_favorite`, `realty_id`, `user_id`) VALUES
(1, 1, 2),
(2, 5, 2),
(3, 6, 1),
(4, 9, 1),
(5, 3, 3),
(6, 10, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `operationslog`
--

CREATE TABLE IF NOT EXISTS `operationslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `money` double NOT NULL,
  `date` datetime NOT NULL,
  `type` enum('пополнение','списание','продление') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `realtys`
--

CREATE TABLE IF NOT EXISTS `realtys` (
  `id_realty` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('продажа','сдача') NOT NULL,
  `room_count` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `geo_lon` double NOT NULL,
  `geo_lat` double NOT NULL,
  `date_pub` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `phones` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `floor_count` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `material` enum('кирпич','панель','дерево') NOT NULL,
  `balcony` tinyint(1) NOT NULL,
  `elevator` tinyint(1) NOT NULL,
  `garbage` tinyint(1) NOT NULL,
  `furniture` tinyint(1) NOT NULL,
  `photo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_realty`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `realtys`
--

INSERT INTO `realtys` (`id_realty`, `user_id`, `publish`, `type`, `room_count`, `address`, `district`, `geo_lon`, `geo_lat`, `date_pub`, `date_end`, `phones`, `description`, `price`, `floor_count`, `floor`, `material`, `balcony`, `elevator`, `garbage`, `furniture`, `photo`) VALUES
(1, 2, 1, 'продажа', 2, 'Вершинина 37', 'Кировский', 75.123456, 80.349284, '2014-11-20 13:00:00', '2014-12-20 13:00:00', '8-913-223-86-45', 'Уютная квартира в центре города, светлая, с евроремонтом, не мебелированная. Санузел раздельный', 1200000, 9, 5, 'кирпич', 1, 1, 1, 0, 0),
(2, 2, 1, 'продажа', 3, 'Фрунзе 111', 'Советский', 75.124476, 80.419284, '2016-11-20 13:00:00', '2016-12-20 13:00:00', '8-913-223-86-45', 'Новая квартира в центре города. 1 тамбур на 2х соседей. Санузел совместный', 1850000, 5, 1, 'кирпич', 1, 1, 1, 1, 1),
(3, 1, 1, 'сдача', 1, 'Вершинина 14', 'Кировский', 45.632456, 56.784628, '2018-11-20 13:00:00', '2018-12-20 13:00:00', '8-913-223-55-88', 'Гостинка, площадь 20 кв.м, светлая. Санузел совместный', 10000, 5, 5, 'панель', 0, 1, 1, 1, 1),
(4, 1, 1, 'сдача', 2, 'Ленина 113', 'Ленинский', 46.632456, 58.784628, '2018-11-20 13:00:00', '2018-12-20 13:00:00', '8-952-277-57-78', 'Маленькая двухкомнатная квартира, площадь 30 кв.м, мебилированная. Санузел совместный', 13000, 2, 2, 'дерево', 0, 0, 0, 1, 1),
(5, 3, 1, 'сдача', 1, 'Усова 17', 'Кировский', 55.55555, 55.55555, '2012-11-20 13:00:00', '2012-12-20 13:00:00', '8-913-223-86-45', 'Квартира в студенческом городке, рядом остановка. Коммунальные услуги отдельно', 10000, 9, 2, 'кирпич', 1, 1, 1, 1, 1),
(6, 3, 1, 'сдача', 3, 'Учебная 27', 'Кировский', 55.55555, 55.55555, '2017-11-20 13:00:00', '2017-12-20 13:00:00', '8-913-223-86-45', 'Просторная квартира для аккуратной семьи, рядом остановка. Коммунальные услуги отдельно', 15000, 5, 2, 'кирпич', 0, 1, 1, 1, 1),
(7, 3, 1, 'сдача', 1, 'Пирогова 7', 'Кировский', 55.55555, 55.55555, '2019-11-20 13:00:00', '2019-12-20 13:00:00', '8-913-223-86-45', 'Квартира для одинокого человека, соседи пенсионеры', 9000, 5, 1, 'панель', 0, 0, 0, 1, 1),
(8, 3, 1, 'продажа', 1, 'Обруб 10', 'Ленинский', 55.55555, 55.55555, '2013-11-20 13:00:00', '2013-12-20 13:00:00', '8-913-223-86-45', 'Квартира 32 кв.м, просторная, санузел совместный. Коммунальные услуги отдельно', 1100000, 2, 1, 'дерево', 0, 0, 0, 1, 1),
(9, 2, 1, 'продажа', 3, 'Мира 10', 'Ленинский', 55.55555, 55.55555, '2015-11-20 13:00:00', '2015-12-20 13:00:00', '8-913-223-86-45', 'Большая квартира, 68 кв.м, темнушка, санузел совместный. Коммунальные услуги отдельно', 2100000, 9, 3, 'кирпич', 1, 1, 1, 1, 1),
(10, 3, 1, 'продажа', 1, 'Киевская 10', 'Советский', 55.55555, 55.55555, '2013-11-20 13:00:00', '2013-12-20 13:00:00', '8-913-223-86-45', 'Квартира 26 кв.м, санузел совместный. Возможен обмен на квартиру в Октябрьском районе', 1500000, 9, 1, 'панель', 1, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','moder','user') NOT NULL DEFAULT 'user',
  `act` varchar(32) NOT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `name`, `login`, `pass`, `email`, `role`, `act`, `ban`) VALUES
(1, 'Иванов Олег', 'usr1', '123', 'usr1@mail.ru', 'user', 'bla', 0),
(2, 'Петренко Антон', 'usr2', '456', 'toxa@mail.ru', 'user', 'bla', 0),
(3, 'Рыжова Анна', 'usr3', '111', 'anna@mail.ru', 'user', 'bla', 0),
(4, 'Сушкина Елена', 'mod', 'mod', 'mod@mail.ru', 'moder', 'bla', 0),
(5, 'Admin', 'admin', '123456', 'adm@mail.ru', 'admin', 'bla', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
