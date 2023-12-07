# Multiobjective-Life-decisions-optimization

## Introduction

Our path through life is shaped by a multiplicity of choices, each of which has an individual impact on it. People struggle to balance competing goals in the complex web of decision-making, looking for ways to optimize their own happiness while striking a balance between their aspirations and their propensity for taking risks. Considering the complexity of life's decisions, this work presents a unique optimization strategy based on the Teaching-Learning-Based Optimization (TLBO) algorithm. 
 We break down decision-making into three essential components in the search for a happy life: greed, carelessness, and satisfaction. Contentment from decisions made in life, which is a reflection of behavior that complies with social and personal standards, is what is meant by satisfaction. While carelessness represents caution free behavior and greediness represents ambition and desire for money and professional success.
Inspired by the pedagogical process, Teaching-Learning-Based Optimization (TLBO) develops as a novel method to handle the complexities of multiobjective life decision optimization. The population-based paradigm of TLBO allows for the investigation of complex solutions that accommodate individual preferences by reflecting the heterogeneous character of decision spaces. Our goal in this investigation is to optimize the Life Fitness Index, a composite metric that encompasses harmony in decision-making, personal fulfillment, and general well-being.

## Problem Statement

Taking 3 important factors into consideration satisfaction, greediness and carelessness at a particular age we want to optimize our Objective function which is life index. We make equal contributions from all 3 continuous decision variables and in total 6 ages.

## Objective function

The objective function is designed to capture the interplay between satisfaction, greediness, and carelessness, reflecting the dynamic nature of life decisions. The primary objective is to maximize life index, while satisfaction is considered as secondary objectives subject to trade-offs. ‘‘ represents greediness, ‘’ represents satisfaction, ‘’ represents ‘carelessness’ and ‘’ represents Life index value.

## Execution Process 

Ages taken into consideration – 12, 18, 25, 35, 60 and 70 years. 
Lower and upper bounds for all 3 levels (greediness, satisfaction and carelessness) are provided at different ages.
A total of 18 decision variables are used, 3 for each age. First represents carelessness, Second represents greediness and Third satisfaction.
TLBO generates a number of solutions from which the best solution is taken as per our needs.
We assume different contributions of ages in total life index.
We have taken contribution of ‘carelessness’ as negation as it kind of hinders our goals.
At the Middle Ages if a person is too much greedy it leads to health problems and hinders life index, so a penalty is provided accordingly. Another penalty is applied if a person is too careless at a young age as it is life deciding time for most of the people.
For maximizing satisfaction, a margin of 5 is taken into consideration in maximum life index and accordingly solution is generated.

## Result

Greediness levels at age 12,18,25,35,60,75
   16.0000   34.4828   35.7143   35.7143   26.0870   19.2308
 
Carelessness levels at age 12,18,25,35,60,75
   16.0000   13.7931   10.7143    7.1429    4.3478    3.8462
 
Satisfaction levels at age 12,18,25,35,60,75
   68.0000   51.7241   53.5714   57.1428   69.5652   76.9231
 
Life index levels at age 12,18,25,35,60,75
   68.0000   72.4138   78.5714   85.7143   91.3043   92.3077
 
Maximizing satisfaction levels while maximizing life index in range of 5
Greediness levels at age 12,18,25,35,60,75
    1.0082   14.3954   10.0364   10.0512    5.5779    5.9056
 
Carelessness levels at age 12,18,25,35,60,75
   18.8589   18.0245   14.9952    9.9977    5.5560    4.7226
 
Satisfaction levels at age 12,18,25,35,60,75
   80.1330   67.5801   74.9684   79.9511   88.8661   89.3719
 
Life index levels at age 12,18,25,35,60,75
   62.2823   63.9510   70.0095   80.0046   88.8881   90.5549


## Conclusion & Future work

An interesting thing to note is that when we are trying to maximize satisfaction it leads to depletion of greediness.
Carelessness depletes and life index betters over time.
If we take account of a greater number of ages and some accurate data we can predict a person’s lifestyle, physical and mental health at a particular age watching its life index, greediness, satisfaction and carelessness.

## References

1.) B. M. Baird, R. E. Lucas, and M. B. Donnellan, "Life Satisfaction Across the Lifespan: Findings from Two Nationally Representative Panel Studies," Soc. Indic. Res., vol. 99, no. 2, pp. 183–203, Nov. 2010. doi: 10.1007/s11205-010-9584-9.
2.) S. Schneider, M. May, and A. A. Stone, "Careless responding in internet-based quality of life assessments," Quality of Life Research, vol. 27, no. 4, pp. 1-12, Apr. 2018. doi: 10.1007/s11136-017-1767-2.
