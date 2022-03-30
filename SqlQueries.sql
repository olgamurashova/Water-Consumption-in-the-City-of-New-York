1. Creating the table to import the dataset:

CREATE TABLE IF NOT EXISTS public."Water Consumption"
(
    "Year" text COLLATE pg_catalog."default",
    "New York City Population" numeric,
    "NYC Consumption(Million gallons per day)" numeric,
    "Per Capita(Gallons per person per day)" numeric
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Water Consumption"
    OWNER to postgres;

2. Importing the dataset:

COPY public."Water Consumption"
FROM 'C:\Users\omdre\OneDrive\Desktop\Codecademy\Water Consumption\Water_Consumption_in_the_City_of_New_York (1).csv' DELIMITER ',' CSV HEADER;

SELECT *
FROM public."Water Consumption";

3. Changing column names for the purpose of the analysis/removing brackets:

SELECT regexp_replace('NYC Consumption(Million gallons per day)', '\(.*\)', '');
SELECT regexp_replace('Per Capita(Gallons per person per day)', '\(.*\)', '');

4. Returning the year with the highest rate of water consumption:

SELECT "Year",
MAX("NYC Consumption(Million gallons per day)")
FROM public."Water Consumption"
GROUP BY 1
ORDER BY 2 DESC;

5. Returning the year with the lowest water consumption:

SELECT "Year",
MIN("NYC Consumption(Million gallons per day)")
FROM public."Water Consumption"
GROUP BY 1
ORDER BY 2 ASC;

6. Calculating the average consumption of water in gallons per person per day:

SELECT ROUND(AVG("Per Capita(Gallons per person per day)"), 1)
FROM public."Water Consumption";

7. Calculating the total water consumed(in million gallons):

SELECT SUM("NYC Consumption(Million gallons per day)")
FROM public."Water Consumption";

8. Returning the highest population rate per year:

SELECT "Year",
MAX("New York City Population")
FROM public."Water Consumption"
GROUP BY 1
ORDER BY 2 DESC;
