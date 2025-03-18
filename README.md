# Behavioral Macroeconomics & Financial Instability: A Network Analysis

# Executive Summary

This project explores how behavioral macroeconomics can explain financial instability through network effects and interconnectedness in modern financial systems. By analyzing cases like the 2008 Global Financial Crisis (AIG) and the Iceland banking collapse, we demonstrate how psychological factors, irrationality, and microeconomic decisions can cascade into systemic financial failure. The project applies the Delli Gatti et al. (2010) credit network model to illustrate contagion dynamics and proposes targeted policy interventions to enhance financial stability.

# Problem Statement

Traditional macroeconomic models fail to adequately explain financial crises because they rely on assumptions of perfect rationality and equilibrium. These models cannot account for:
- Psychological factors in decision-making ("animal spirits")
- Contagion effects in interconnected financial networks
- How micro-level irrationality can amplify into macro-level instability
- The role of uncertainty in creating liquidity preference beyond interest rate calculations

There is an urgent need to develop and apply behavioral macroeconomic models that can identify systemic risks before they materialize into full-blown crises and guide effective policy responses.

# Theoretical Framework

## Behavioral Macroeconomics Foundations

Behavioral macroeconomics accounts for cognitive and psychological processes in economic decision-making. Unlike orthodox approaches that assume rationality, behavioral models explicitly incorporate:

- Psychological propensities and "animal spirits" (as identified by Keynes)
- Liquidity preferences influenced by uncertainty factors
- Imperfect application of rational models (APT, CAPM, Markowitz)
- Sticky wages and prices in microeconomic foundations

## Credit Network Model

We apply the Delli Gatti et al. (2010) credit network framework to model financial interconnectedness:

### Network Structure:

- Downstream firms (D) producing consumption goods
- Upstream firms (U) supplying intermediate factors
- Banks providing credit to both types of firms

*Hypothetical Example*

Running a normal guided network model in R, the Financial System can be illustrated below as: 

![image](https://github.com/user-attachments/assets/7da9d064-5966-40f9-9e38-22ed1d3df37f)

If a bank in the system goes through a shock or a turmoil, the system is likely to look like: 

![image](https://github.com/user-attachments/assets/559a6933-75a8-4e98-8b7b-7704ba4d4e1c)

The intensity of the impact might look like: 

![image](https://github.com/user-attachments/assets/a729953f-790b-4814-a528-cd56614e63ba)

### Key Equations

![image](https://github.com/user-attachments/assets/a30b37a8-90e6-44d8-b89e-86c857237a3e)

The first equation shows the production of D where Ait is the net worth. Delli Gatti et al., (2010) suggests to think of it as an optimization problem. The second equation reflects production of inputs by U, r is an indicator of interest rate as shown by equation 3, where the leverage ratio of D is increasing while the net worth of U goes down. If the expenses of the firm are greater compared to net worth, they take credit from banks at the lending rate as shown by equation 5. The matching process occurs when a firms tend to choose the bank that offers a lower interest rate and switch only when another bank offers a better rate. Equation 6 and 7 show profits for firm D and U respectively. Equation 8 represents the net worth for the firm inclusive of the profits. Higher net worth of firms compared to that of banks will make borrowing expensive.
![image](https://github.com/user-attachments/assets/c83e196a-29f5-4b3c-8f38-3ed402b9908e)
If the net worth is negative or bad debt portions are increasing significantly, the lender’s net worth decreases, and due to the interconnected network, the spillover effect comes into play, leading to bankruptcy of other actors inside the network accumulating to disasters like financial crisis or instability. Alternatively, network-based financial accelerator effect can occur whereby falling net worth means expensive borrowing cost for other firms, which further decreases their net worth. The paper includes stochastic elements to depict how shocks or crises impact the overall stability of the financial network. Thus, the role of the government and the central bank is very crucial in policy formulations.

### Contagion Mechanisms

- Network-based financial accelerator effects
- Spillover effects through interconnected credit relationships
- Bankruptcy cascades and negative feedback loops



