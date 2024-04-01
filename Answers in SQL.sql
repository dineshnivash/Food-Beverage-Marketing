create database F_B;
select Gender, count(respondent_id) as Total_respondent from dim_repondents
group by Gender order by total_respondent desc;

select Age, count(respondent_id) as Total_respondent from dim_repondents
group by Age order by total_respondent desc;

select Ingredients_expected, count(respondent_id) as Total_respondent from fact_survey_responses
group by Ingredients_expected order by total_respondent desc;

select Packaging_preference, count(respondent_id) as Total_respondent from fact_survey_responses
group by Packaging_preference order by total_respondent desc;

select Current_brands, count(respondent_id) as Total_respondent from fact_survey_responses
group by Current_brands order by total_respondent desc;

select current_brands, Reasons_for_choosing_brands, count(respondent_id) as Total_respondent from fact_survey_responses
group by 1,2 order by total_respondent desc;
#or
with cte as
(select current_brands, count(respondent_id) as Total_respondent from fact_survey_responses
group by Current_brands order by total_respondent desc limit 3)
select cte.current_brands, fsr.reason_for_choosing_brands, count(respondent_id) as total_respondent
from fact_survey_responses fsr join cte on fsr.current_brands=cte.current_brands
group by cte.current_brands, fsr.Reasons_for_choosing_brands;

select Marketing_channels, count(respondent_id) as Total_respondent from fact_survey_responses
group by Marketing_channels order by total_respondent desc;

