-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 13. 15:48
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `ingatlan`
--
CREATE DATABASE IF NOT EXISTS `ingatlan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `ingatlan`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ingatlanok`
--

CREATE TABLE `ingatlanok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategoria` bigint(20) UNSIGNED NOT NULL,
  `leiras` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hirdetesDatuma` date DEFAULT current_timestamp(),
  `tehermentes` tinyint(1) NOT NULL,
  `ar` int(11) NOT NULL,
  `kepUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `ingatlanok`
--

INSERT INTO `ingatlanok` (`id`, `kategoria`, `leiras`, `hirdetesDatuma`, `tehermentes`, `ar`, `kepUrl`) VALUES
(1, 1, 'Kertvárosi részén, egyszintes házat kínálunk nyugodt környezetben, nagy telken.', '2022-03-09', 1, 26990000, 'https://cdn.jhmrad.com/wp-content/uploads/three-single-storey-houses-elegance-amazing_704000.jpg'),
(2, 1, 'Belvárosi környezetben, árnyékos helyen kis méretú családi ház eladó. Tömegközlekedéssel könnyen megközelíthető.', '2022-03-16', 1, 28990000, 'https://www.westsideseattle.com/sites/default/files/styles/news_teaser/public/images/archive/ballardnewstribune.com/content/articles/2008/11/21/features/columnists/column07.jpg?itok=wMrlOwFU'),
(3, 2, 'Kétszintes berendezett lakás a belvárosban kiadó.', '2022-03-12', 1, 32000000, 'https://images.unsplash.com/photo-1606074280798-2dabb75ce10c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
(4, 4, 'Nagy garázs kertvárosi környezetben kiadó.', '2022-03-14', 1, 5990000, 'https://www.afritechmedia.com/wp-content/uploads/2021/11/How-Can-You-Protect-Your-Garage-Floor-612x340.jpg'),
(5, 5, '10 hektáros mezőhazdasági terület eladó.', '2022-03-18', 1, 79000000, 'https://i2-prod.manchestereveningnews.co.uk/incoming/article18411144.ece/ALTERNATES/s810/0_gettyimages-1151774950-170667a.jpg'),
(6, 6, 'Felújításra szoruló üzemcsarnok zöld környezetben áron alul eladó.', '2022-03-11', 0, 25000000, 'https://cdn.pixabay.com/photo/2019/01/31/09/24/urban-3966306_960_720.jpg'),
(7, 2, 'Eladó ...', '2022-03-19', 1, 45000000, 'https://pictures.com/apartman.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`id`, `nev`) VALUES
(3, 'Építési telek'),
(4, 'Garázs'),
(1, 'Ház'),
(6, 'Ipari ingatlan'),
(2, 'Lakás'),
(5, 'Mezőgazdasági terület');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ingatlanok`
--
ALTER TABLE `ingatlanok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingatlanok_kategoria_foreign` (`kategoria`);

--
-- A tábla indexei `kategoriak`
--
ALTER TABLE `kategoriak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategoriak_nev_unique` (`nev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ingatlanok`
--
ALTER TABLE `ingatlanok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `kategoriak`
--
ALTER TABLE `kategoriak`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `ingatlanok`
--
ALTER TABLE `ingatlanok`
  ADD CONSTRAINT `ingatlanok_kategoria_foreign` FOREIGN KEY (`kategoria`) REFERENCES `kategoriak` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
