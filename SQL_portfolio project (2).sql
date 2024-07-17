
--  SQL Data Analysis Project: Titanic Passenger Survival Analysis

--  Project Overview:
-- Objective: Analyze the Titanic dataset to uncover insights about passenger demographics and survival rates.
-- Tools Used: MySQL
-- Dataset: Titanic passenger data containing information on passengers’ survival status, age, sex, class, fare, and other relevant attributes.

-- Key Responsibilities:
-- Data Extraction and Cleaning:
-- Imported the Titanic dataset into the SQL database.
-- Used SQL queries to standardize and preprocess the data for analysis.

-- Data Analysis and Querying:

-- 1. Show the first 10 rows of the dataset.
SELECT 
    *
FROM
    titanic
LIMIT 10;


-- 2. Find the number of passengers who survived.
SELECT 
    COUNT(*) AS 'Passengers_survived'
FROM
    titanic
WHERE
    Survived = 1;
    

-- 3. Find the average age of all passengers.
SELECT 
    AVG(age)
FROM
    titanic;
    

-- 4. Find the number of passengers in each class.
SELECT 
    Pclass, COUNT(*) AS 'No.of. passengers'
FROM
    titanic
GROUP BY Pclass;


-- 5. Find the first 10 rows of the dataset sorted by passenger class in descending order.
SELECT 
    *
FROM
    titanic
ORDER BY Pclass DESC
LIMIT 10;


-- 6. Find the number of passengers in each class sorted by class in ascending order.
SELECT 
    Pclass, COUNT(*)
FROM
    titanic
GROUP BY Pclass
ORDER BY Pclass ASC;


-- 7. Find the average fare paid by passengers in each class.
SELECT 
    Pclass, AVG(Fare) AS 'avg_fare'
FROM
    titanic
GROUP BY Pclass;


-- 8. Find the name of the passenger with the highest fare.
SELECT 
    name, Fare
FROM
    titanic
WHERE
    fare = (SELECT 
            MAX(Fare)
        FROM
            titanic);


-- 9. Find the name of the passenger who had the highest age among the survivors.
SELECT 
    name, age
FROM
    titanic
WHERE
    age = (SELECT 
            MAX(age)
        FROM
            titanic
        WHERE
            Survived = 1)
        AND Survived = 1;


-- 10. Find the number of passengers who paid more than the average fare.

SELECT 
    COUNT(*) AS num_passengers
FROM
    titanic
WHERE
    Fare > (SELECT 
            AVG(Fare)
        FROM
            titanic);


-- 11. Find the name of the passenger who had the most parents or children on board.
SELECT 
    name
FROM
    titanic
WHERE
    Parch = (SELECT 
            MAX(Parch)
        FROM
            titanic);


-- 12. Find the number of male and female passengers who survived, 
-- and order the results by sex in ascending order:
SELECT 
    Sex, COUNT(*) AS num_survived
FROM
    titanic
WHERE
    Survived = 1
GROUP BY Sex
ORDER BY Sex ASC;


-- 13. Find the name, age, and fare of the oldest passenger who survived.

SELECT 
    name, age, Fare
FROM
    titanic
WHERE
    age = (SELECT 
            MAX(Age)
        FROM
            titanic
        WHERE
            Survived = 1)
        AND Survived = 1;


-- 14. Find the name and age of the youngest female passenger who survived in third class.
SELECT 
    name, age
FROM
    titanic
WHERE
    Sex = 'female' AND Pclass = 3
        AND Survived = 1
        AND age = (SELECT 
            MIN(Age)
        FROM
            titanic
        WHERE
            Sex = 'female' AND Pclass = 3
                AND Survived = 1);


-- 15. Find Number of male and female passengers.
SELECT 
    SUM(CASE
        WHEN Sex = 'male' THEN 1
        ELSE 0
    END) AS num_male,
    SUM(CASE
        WHEN Sex = 'female' THEN 1
        ELSE 0
    END) AS num_female
FROM
    titanic;


-- 16. Survival Rates Analysis: Queried the dataset to determine survival rates based on 
-- different attributes (e.g., gender, age, class).

SELECT 
    pclass AS Class,
    sex AS Gender,
    COUNT(*) AS Total_Passengers,
    SUM(CASE
        WHEN survived = 1 THEN 1
        ELSE 0
    END) AS Survivors,
    ROUND(AVG(survived) * 100, 2) AS Survival_Rate
FROM
    titanic
GROUP BY pclass , sex
ORDER BY pclass , sex;
        
    
-- 17. Age Distribution Analysis:** Used SQL functions to compute the average, minimum, and maximum ages of passengers.
SELECT 
    MIN(age) AS Min_Age,
    MAX(age) AS Max_Age,
    AVG(age) AS Avg_Age
FROM
    titanic;

  -- 18. Class and Fare Analysis:** Analyzed the correlation between passenger class, fare, and survival rate.

SELECT 
    pclass AS Class,
    ROUND(AVG(fare), 2) AS Avg_Fare,
    SUM(CASE
        WHEN survived = 1 THEN 1
        ELSE 0
    END) AS Survivors,
    ROUND(AVG(survived) * 100, 2) AS Survival_Rate
FROM
    titanic
GROUP BY pclass
ORDER BY pclass;
   
-- Results and Insights:
-- Survival Rates: Identified higher survival rates among females and first-class passengers.
-- Age Analysis: Revealed that younger passengers had a slightly higher chance of survival.
-- Class and Fare: Confirmed a strong correlation between higher fare prices 
-- (indicative of first-class tickets) and higher survival rates.



