use PortfolioProject
go

SELECT *
FROM PortfolioProject..covidDeaths
ORDER BY 3,4


SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject.dbo.covidDeaths
ORDER BY 1,2


--looking at total cases vs total deaths
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Deaths_Percentage
FROM PortfolioProject.dbo.covidDeaths
ORDER BY 1,2

--With respect to India looking total cases vs total deaths
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Deaths_Percentage
FROM PortfolioProject.dbo.covidDeaths
WHERE location like '%India'
ORDER BY 1,2

--Looking at total Cases vs population.

SELECT location, date, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM PortfolioProject.dbo.covidDeaths
ORDER BY 1,2


--India tatal cases vs population
SELECT location, date, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM PortfolioProject.dbo.covidDeaths
WHERE location like '%India'
ORDER BY 1,2

-- Looking at country with highest infection rate compared to population.

SELECT location, population, MAX(total_cases) as HigestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject.dbo.covidDeaths
WHERE continent is not null
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC

--With respect to India what is the highest infection rate compared to population.

SELECT location, population, MAX(total_cases) as HigestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject.dbo.covidDeaths
WHERE continent is not null and location like '%India'
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC


-- Showing countries with highest deaths count per population.

SELECT location, population, MAX(CAST(total_deaths as int)) as Higest_Deaths
FROM PortfolioProject.dbo.covidDeaths
WHERE continent is not null
GROUP BY location,population
ORDER BY Higest_Deaths DESC

-- Let's break things down by Continent.

SELECT continent, MAX(CAST(total_deaths as int)) as Higest_Deaths
FROM PortfolioProject.dbo.covidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY Higest_Deaths DESC


--Finding total new_cases over total new_deaths percentage

SELECT SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) as total_deaths, (SUM(CAST(new_deaths as int))/SUM(new_cases))*100 as DeathPercentage
FROM PortfolioProject.dbo.covidDeaths
WHERE continent is not null
