-- Welcome!! to my mini project.
-- Here i want to demostrate the use of aggregate functions and a case statement. 
-- The dataset below is a Mall customer segmentation data.

-- Q1 Group customers according to their income.
  
  select Annual_Income_k, count(Annual_Income_k) as Count_of_grouped_income
  from Mall_Customers
  group by Annual_Income_k
  order by count(Annual_Income_k) desc , Annual_Income_k


-- Q2 Group customers according to age groups 14 - 19(Teenagers), 20 - 30(Young Adults), 30 - 60(Adults), >60(Retired). 

    select *, 
     case 
     when Age between 14 and 19 then 'Teenager'
     when Age between 20 and 30 then 'Young Adult'
     when Age between 30 and 60 then 'Adult'
     else 'Retired'
     end as New_category
    from Mall_Customers

-- Q3 Check the age groups and their total spending scores.
-- here i want to use a cte

    with cte_customers as (

        select *,
        case 
        when Age between 14 and 19 then 'Teenager'
        when Age between 20 and 30 then 'Young Adult'
        when Age between 30 and 60 then 'Adult'
        else 'Retired'
        end as Age_Category

        from Mall_Customers

    )

    select Age_Category, sum(Annual_Income_k) as Annual_income_per_age_group
    from cte_customers
    group by Age_Category
    order by sum(Annual_Income_k) desc

-- Q4 Check which gender has the highest spending score, which means they spend more at that mall.

    select Gender, sum(Annual_Income_k) as Annual_income_per_age_group
    from Mall_Customers
    group by 
    order by sum(Annual_Income_k) desc

-- Q5 Check which gender has the highest total income.

    select Gender , sum(Annual_Income_k) as Total_Income_Per_Gender
    from Mall_Customers
    group by Gender 
    order by sum(Annual_Income_k) desc

-- one thing to take from this data is the women in the area or that shopped at this mall , earned more than the men and they shpped more than
-- the males too. their total annual incomes is more than that of the men and they also have a spending score greater than that of the males.

--the data also shows that the adults ages between 30 and 60 have the highest spending scores,than any other group.
-- the data also shows the adults earn way more than any other age group in the data set.

-- thanks 
