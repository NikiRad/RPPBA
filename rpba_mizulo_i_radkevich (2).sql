-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 18 2017 г., 18:25
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rpba_mizulo_i_radkevich`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `firm_id` int(11) NOT NULL,
  `type_id` varchar(55) NOT NULL,
  `name` varchar(65) NOT NULL,
  `cost` double NOT NULL,
  `short_description` varchar(160) NOT NULL,
  `description` text NOT NULL,
  `characteristics` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `firm_id`, `type_id`, `name`, `cost`, `short_description`, `description`, `characteristics`, `image`) VALUES
(1, 1, '1', 'якая-то', 10000, 'тут могла быть ваша реклама.', 'описание 1 авто', 'характеристики 1 авто', 'img/2.png'),
(2, 1, '2', 'другая', 25000, 'букавы, тысячи их.', 'описание 2 авто', 'характеристики 2 авто', 'img/2.png'),
(3, 1, '3', 'третья мазда', 35000, 'топ тачка ин зе ворлд.', 'описание 3 авто', 'характеристики 3 авто', 'img/2.png'),
(4, 2, '4', 'бэха', 75000, 'ну такая, зато недорого и бмв.', 'описание 4 авто', 'характеристики 4 авто', 'img/1.png'),
(5, 2, '1', 'х-5', 25000, 'каеф просто, вах-вах-вах.', 'описание 5 авто', 'характеристики 5 авто', 'img/1.png'),
(6, 2, '2', 'последняя', 46000, 'ыыыыы, букавы, описание тип.', 'описание 6 авто', 'характеристики 6 авто', 'img/1.png');

-- --------------------------------------------------------

--
-- Структура таблицы `information`
--

CREATE TABLE `information` (
  `id` int(20) NOT NULL,
  `section_id` varchar(155) DEFAULT NULL,
  `text` text NOT NULL,
  `image` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `information`
--

INSERT INTO `information` (`id`, `section_id`, `text`, `image`) VALUES
(1, '2', 'BMW AG (аббревиатура от Bayerische Motoren Werke AG, с нем.«Баварские моторные заводы») — немецкий производитель автомобилей, мотоциклов, двигателей, а также велосипедов. Председателем компании на сегодняшний день является Норберт Райтхофер, а главным дизайнером — Карим Хабиб. Девиз компании — «Freude am Fahren», с нем.«С удовольствием за рулем». Для англоязычных стран был придуман также «The Ultimate Driving Machine».', 'img/bmw.png'),
(2, '1', 'Mazda Motor Corporation (яп. マツダ株式会社 мацуда кабусики-гайся), кратко: Mazda (рус. «Ма́зда») — японская автомобилестроительная компания, выпускающая автомобили «Мазда». Штаб-квартира — в Хиросиме. Входит в кэйрэцу Sumitomo.', 'img/mazda.png');

-- --------------------------------------------------------

--
-- Структура таблицы `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `section_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`id`, `section_name`) VALUES
(1, 'MAZDA'),
(2, 'BMW');

-- --------------------------------------------------------

--
-- Структура таблицы `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sections_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subscribers`
--

INSERT INTO `subscribers` (`id`, `name`, `surname`, `email`, `sections_id`, `password`) VALUES
(0, 'админ', 'админ', 'admin@email.com', NULL, 'admin'),
(1, 'Костя', 'Мизуло', 'mizulo@mail.ru', '1', 'mizulo123'),
(2, 'Никита', 'Радкевич', 'radkevich@mail.ru', '2', 'radikgradik');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'Внедорожник'),
(2, 'Кроссовер'),
(3, 'Седан'),
(4, 'Кабриолет');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `название` (`name`),
  ADD KEY `цена` (`cost`);

--
-- Индексы таблицы `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `information`
--
ALTER TABLE `information`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
