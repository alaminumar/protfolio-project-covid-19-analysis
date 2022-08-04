--looking at the total cases globally and getting the death percentage

select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths,
(sum(new_deaths)/sum(new_cases))*100 as deathpercentage
from `my-first-project-354015.portfolio_projects.covid_deaths`
where continent is not null;

--looking at the number of deaths in each country
select  location, sum(new_deaths) as totalDeathCount
from `my-first-project-354015.portfolio_projects.covid_deaths`
where continent is not null
and location not in ('World','European Union', 'International')
group by location
order by totalDeathCount desc ;

--looking at the percentage of population infected in each country
SELECT location, population, max(total_cases) as highestinfectioncount, max((total_cases/population)) *100 as percentPopInfected 
from `my-first-project-354015.portfolio_projects.covid_deaths`
group by location, population
order by percentPopInfected desc;

-- looking at the dates with the highest infection rate by country
SELECT location, population, date, max(total_cases) as highestinfectioncount, max((total_cases/population)) *100 as percentPopInfected 
from `my-first-project-354015.portfolio_projects.covid_deaths`
group by location, population, date
order by percentPopInfected desc;
