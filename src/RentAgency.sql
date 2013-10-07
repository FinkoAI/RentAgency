--
-- База данных: `RentAgency`
--

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realty_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `realtys`
--

CREATE TABLE `realtys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `geo_lon` double NOT NULL,
  `geo_lat` double NOT NULL,
  `date_pub` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `phone` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `floors` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `material` varchar(20) NOT NULL,
  `balcony` tinyint(1) NOT NULL,
  `elevator` tinyint(1) NOT NULL,
  `garbage` tinyint(1) NOT NULL,
  `furniture` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `act` varchar(32) NOT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
