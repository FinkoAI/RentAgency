
--
-- База данных: 'RentAgency'
--

-- --------------------------------------------------------

--
-- Структура таблицы 'comments'
--

CREATE TABLE comments (
  id_comment int(11) NOT NULL AUTO_INCREMENT,
  realty_id int(11) DEFAULT NULL,
  user_id int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `text` text,
  PRIMARY KEY (id_comment)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы 'favorites'
--

CREATE TABLE favorites (
  id_favorite int(11) NOT NULL AUTO_INCREMENT,
  realty_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  PRIMARY KEY (id_favorite)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы 'operationslog'
--

CREATE TABLE operationslog (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  money double NOT NULL,
  `date` datetime NOT NULL,
  `type` enum('пополнение','списание','продление') NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы 'realtys'
--

CREATE TABLE realtys (
  id_realty int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  publish tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('продажа','сдача') NOT NULL,
  room_count int(11) NOT NULL,
  address varchar(255) NOT NULL,
  district varchar(255) NOT NULL,
  geo_lon double NOT NULL,
  geo_lat double NOT NULL,
  date_pub datetime NOT NULL,
  date_end datetime NOT NULL,
  phones varchar(255) NOT NULL,
  description text NOT NULL,
  floor_count int(11) NOT NULL,
  floor int(11) NOT NULL,
  material enum('кирпич','панель','дерево') NOT NULL,
  balcony tinyint(1) NOT NULL,
  elevator tinyint(1) NOT NULL,
  garbage tinyint(1) NOT NULL,
  furniture tinyint(1) NOT NULL,
  PRIMARY KEY (id_realty)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы 'users'
--

CREATE TABLE users (
  id_user int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  login varchar(255) NOT NULL,
  pass varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  role enum('admin','moder','user') NOT NULL DEFAULT 'user',
  act varchar(32) NOT NULL,
  ban tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (id_user)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
