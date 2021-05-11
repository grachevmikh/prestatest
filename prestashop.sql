-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 11 2021 г., 19:02
-- Версия сервера: 5.7.24
-- Версия PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `prestashop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ps_students`
--

CREATE TABLE `ps_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `average_score` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ps_students`
--

INSERT INTO `ps_students` (`id`, `date`, `status`, `average_score`) VALUES
(1, '2021-05-11 18:44:41', 1, 3.4),
(2, '2021-05-11 18:44:41', 1, 4),
(3, '2021-05-11 18:44:41', 0, 2.9),
(4, '2021-05-11 18:44:41', 1, 4.5);

-- --------------------------------------------------------

--
-- Структура таблицы `ps_students_lang`
--

CREATE TABLE `ps_students_lang` (
  `id_student` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ps_students_lang`
--

INSERT INTO `ps_students_lang` (`id_student`, `id_lang`, `name`) VALUES
(1, 1, 'Антон'),
(1, 2, 'Anton'),
(2, 1, 'Денис'),
(2, 2, 'Den'),
(3, 1, 'Олег'),
(3, 2, 'Oleg'),
(4, 1, 'Александр'),
(4, 2, 'Alex');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ps_students`
--
ALTER TABLE `ps_students`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ps_students_lang`
--
ALTER TABLE `ps_students_lang`
  ADD PRIMARY KEY (`id_student`,`id_lang`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ps_students`
--
ALTER TABLE `ps_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
