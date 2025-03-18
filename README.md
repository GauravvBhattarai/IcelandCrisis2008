# Behavioral Macroeconomics & Financial Instability: A Network Analysis

# A. Executive Summary

This project explores how behavioral macroeconomics can explain financial instability through network effects and interconnectedness in modern financial systems. By analyzing cases like the 2008 Global Financial Crisis (AIG) and the Iceland banking collapse, we demonstrate how psychological factors, irrationality, and microeconomic decisions can cascade into systemic financial failure. The project applies the Delli Gatti et al. (2010) credit network model to illustrate contagion dynamics and proposes targeted policy interventions to enhance financial stability.

# B. Problem Statement

Traditional macroeconomic models fail to adequately explain financial crises because they rely on assumptions of perfect rationality and equilibrium. These models cannot account for:
- Psychological factors in decision-making ("animal spirits")
- Contagion effects in interconnected financial networks
- How micro-level irrationality can amplify into macro-level instability
- The role of uncertainty in creating liquidity preference beyond interest rate calculations

There is an urgent need to develop and apply behavioral macroeconomic models that can identify systemic risks before they materialize into full-blown crises and guide effective policy responses.

# C. Theoretical Framework

## 1. Behavioral Macroeconomics Foundations

Behavioral macroeconomics accounts for cognitive and psychological processes in economic decision-making. Unlike orthodox approaches that assume rationality, behavioral models explicitly incorporate:

- Psychological propensities and "animal spirits" (as identified by Keynes)
- Liquidity preferences influenced by uncertainty factors
- Imperfect application of rational models (APT, CAPM, Markowitz)
- Sticky wages and prices in microeconomic foundations

## 2. Credit Network Model

We apply the Delli Gatti et al. (2010) credit network framework to model financial interconnectedness:

### I. Network Structure:

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

### II. Key Equations

![image](https://github.com/user-attachments/assets/a30b37a8-90e6-44d8-b89e-86c857237a3e)

The first equation shows the production of D where Ait is the net worth. Delli Gatti et al., (2010) suggests to think of it as an optimization problem. The second equation reflects production of inputs by U, r is an indicator of interest rate as shown by equation 3, where the leverage ratio of D is increasing while the net worth of U goes down. If the expenses of the firm are greater compared to net worth, they take credit from banks at the lending rate as shown by equation 5. The matching process occurs when a firms tend to choose the bank that offers a lower interest rate and switch only when another bank offers a better rate. Equation 6 and 7 show profits for firm D and U respectively. Equation 8 represents the net worth for the firm inclusive of the profits. Higher net worth of firms compared to that of banks will make borrowing expensive.

![image](https://github.com/user-attachments/assets/c83e196a-29f5-4b3c-8f38-3ed402b9908e)

If the net worth is negative or bad debt portions are increasing significantly, the lender’s net worth decreases, and due to the interconnected network, the spillover effect comes into play, leading to bankruptcy of other actors inside the network accumulating to disasters like financial crisis or instability. Alternatively, network-based financial accelerator effect can occur whereby falling net worth means expensive borrowing cost for other firms, which further decreases their net worth. The paper includes stochastic elements to depict how shocks or crises impact the overall stability of the financial network. Thus, the role of the government and the central bank is very crucial in policy formulations.

### III. Contagion Mechanisms

- Network-based financial accelerator effects
- Spillover effects through interconnected credit relationships
- Bankruptcy cascades and negative feedback loops

In the interconnected network with one bankruptcy leading to another, and so on, it will reduce the economic output, which can result in a financial crisis. Complexity, concentration and contagion lead to systematic collapse and require static micro-prudential regulation and dynamic macro-prudential intervention. The economy goes through cycles of expansion and contractions, an impact on a large firm might lead to a spill-over effect, and small micro level shocks accumulated can create a multiplied effect on a macro level. Regulation policies are thus needed to prevent such events happening. Example can be a deposit insurance and discount window access that combats micro level market failures, but can also result in the rise of shadow banking making the whole system more unstable. Frameworks like the BASEL III accord to impose discipline, capital adequacy requirements and supervision, SIBs to control the spillover of large firms’ slowdown, etc., are some of the regulation policies the behavioural model suggests. Some differences between the macroprudential and micro-prudential policy implications overview and stresses strengthening the earlier one to reduce systematic risk, control instability, and its consequences. Policy makers need to use policy rates focused both on the objective of price stability as well as financial stability.

# D. Case Studies 

## Case Study 1: American International Group (AIG) During the Global Financial Crisis

Background:

- Late 1990s: Significant inflow of foreign funds from Russia and Asian countries
- Banks relaxed mortgage lending standards and created Collateralized Debt Obligations (CDOs)
- AIG sold Credit Default Swaps (CDS) as insurance against CDO defaults

Crisis Development: 

- By end of 2007: CDS contracts reached approximately $60 trillion globally
- Housing market decline led to subprime mortgage rate adjustments
- Increasing repayments caused CDOs to collapse
- Liquidity crunch: AIG had insufficient reserves to cover insured CDOs
- AIG faced bankruptcy until Federal Reserve bailout due to its Systemically Important Financial Institution (SIFI) status

Post-Crisis Regulatory Response:

- Basel III framework implementation
- Dodd-Frank Wall Street Reform and Protection Act
- CDS writing limits and restrictions

## Case Study 2: Iceland Banking Crisis (2008)

Background:

- Three largest banks (Kaupthing, Landsbanki, Glitnir) had combined assets 11 times Iceland's GDP
- Banks underwent privatization in 2003, followed by aggressive international expansion
- Heavy reliance on lending as primary growth tool
- Excessive leveraging and questionable lending patterns

Crisis Development:

- Triggered by Lehman Brothers collapse, which raised CDS rates for Icelandic banks
- Global interbank lending freeze exacerbated liquidity problems
- Foreign currency as part of domestic money supply amplified macroeconomic deterioration
- Currency (Krona) plunged dramatically
- Most corporate loans were foreign-exchange indexed, leading to widespread bankruptcies

Government Response:

- Government takeover of banks
- Capital control measures to stabilize currency
- Interest rate increase to 18%
- Daily currency auctions
- Agreements with British and Dutch governments for deposit reimbursements
- IMF assistance program

# E. Analysis: The Network Perspective

## 1. Contagion Mechanisms

Bankruptcy Cascades:

- One bankruptcy leads to another through credit exposure
- Network-based financial accelerator effect: falling net worth increases borrowing costs, further decreasing net worth
- Small micro-level shocks can amplify into macro-level crises

Systemic Risk Factors:

- Complexity of financial instruments
- Concentration of risk in key institutions
- Contagion through interconnected balance sheets

Behavioral Elements:

- Speculation and overconfidence
- Misaligned incentives
- Herding behavior in financial markets
- Inappropriate risk assessment

## 2. Network Model Application

Applying the Delli Gatti model to our case studies reveals:

- How liquidity shocks propagate through the financial system
- The importance of firm and bank net worth as buffers against shocks
- How interest rate dynamics influence lending decisions and financial stability
- Why traditional microprudential approaches may be insufficient

According to various official sources, the combined assets of the banks were 11 times Iceland’s GDP at the time of collapse. The Domino’s effect soon came into play, leading to a slowdown of the whole financial system, and Iceland didn’t have a last resort capable of bailing out; most of the corporate loans were foreign-exchange indexed, resulting in bankruptcy of the majority of private firms and the currency plunged. 

![image](https://github.com/user-attachments/assets/ed5fc568-cfe1-471b-84ba-c656c703c8b8)

The final network model would is presented below: 

![image](https://github.com/user-attachments/assets/d01d76cb-8400-4a4f-9fb7-fd824a641018)

Impact on Iceland's Economic Indicators: 

![image](https://github.com/user-attachments/assets/22b71d04-34dd-4f29-9d57-83a258744b0e)

The impact can be seen in the economic figures of Iceland from 2007 onwards, where unemployment and government debt were at their peak. The strength of their currency was boiled down significantly because the banks had to repay the foreign deposits. After the crisis, a lot of banking reforms and financial regulation scrutiny were conducted. To combat the conditions, Iceland raised its interest to 18%, daily currency auctions, and agreements with the British and Dutch governments for reimbursement of deposits. Started with the failure of Lehman Brothers, which raised CDS rates in Icelandic banks, which went into bankruptcy, as the global interbank lending was frozen. Foreign currency being a part of domestic money supply was a major reason for the macroeconomic deterioration in Iceland. High tax burdens generating very little tax income for the government, misguided inflation targeting, higher interest rates leading to increased foreign borrowing, and the central bank failing to improve foreign reserves are major policy implications not addressed back then. This empirical case shows how the behavioural point of view regarding wage and price flexibility, financial regulation policies (including monetary policy) for market reforms are critically important for financial stability. 

# F. Business Implications

## For Financial Institutions

1. Risk Management Reform:

- Develop stress-testing methodologies that account for network effects
- Diversify counterparty exposures to reduce concentration risk
- Improve liquidity management practices beyond regulatory minimums

2. Behavioral Finance Integration:

- Recognize cognitive biases in risk assessment and decision-making
- Implement behavioral guardrails in investment and lending processes
- Create organizational structures that promote risk awareness and challenge

3. Structural Changes:

- Review compensation structures to avoid short-term risk-taking incentives
- Strengthen corporate governance and risk oversight
- Develop early warning systems for network-based vulnerabilities

## For Non-Financial Corporations

1. Financial Resilience Strategies:

- Diversify funding sources to reduce dependency on specific financial institutions
- Maintain adequate liquidity buffers for economic downturns
- Understand and manage currency exposure risks

2. Scenario Planning:

- Develop contingency plans for financial system disruptions
- Test business models against severe financial stress scenarios
- Prepare alternative supply chain and customer financing arrangements

3. Strategic Positioning:

- Monitor financial system health as part of strategic planning
- Consider financial network position when selecting banking partners
- Understand how regulatory changes affect business operations

# G. Policy Recommendations

## Macroprudential Framework

Dynamic Capital Requirements:

- Implement countercyclical capital buffers that increase during economic expansions
- Adjust capital requirements based on systemic importance and interconnectedness
- Develop network-based metrics to assess systemic risk contributions

Systemic Risk Monitoring:

- Create real-time monitoring systems for financial network vulnerabilities
- Require regular stress tests that include contagion scenarios
- Establish early intervention mechanisms for troubled systemically important institutions

Cross-Border Coordination:

- Harmonize international regulatory frameworks for global financial institutions
- Create cross-border resolution mechanisms for failing international banks
- Develop information-sharing protocols between national regulators

## Monetary Policy Integration

Dual Mandate Extension:

- Incorporate financial stability objectives alongside price stability
- Develop monetary policy tools sensitive to credit cycles and asset prices
- Use interest rate policy to moderate excessive financial risk-taking

Liquidity Provision Framework:

- Establish clear lender of last resort facilities with appropriate safeguards
- Create cross-currency swap lines for international liquidity provision
- Design liquidity support mechanisms that minimize moral hazard

Shadow Banking Oversight:

- Extend regulatory perimeter to include non-bank financial intermediaries
- Implement mandatory reporting requirements for all significant market participants
- Develop specialized regulatory approaches for different types of shadow banks

# H. Conclusion

Behavioral macroeconomics provides a more realistic framework for understanding financial instability than traditional models. By incorporating psychological factors, network effects, and contagion mechanisms, we can better explain how financial crises develop and propagate through the economic system.
The case studies of AIG and Iceland demonstrate how seemingly rational decisions at the microeconomic level can accumulate into catastrophic outcomes at the systemic level. Our analysis shows that effective financial stability requires both microprudential and macroprudential approaches, with particular emphasis on understanding network interactions and behavioral biases.
The policy recommendations proposed in this project aim to strengthen financial stability by addressing the identified weaknesses in current regulatory frameworks. By implementing these measures, policymakers can reduce the frequency and severity of financial crises while maintaining efficient capital allocation.

# I. References

- Borio, C. (2003). Towards a macroprudential framework for financial supervision and regulation?
- Delli Gatti, D., Gallegati, M., Greenwald, B., Russo, A., & Stiglitz, J. E. (2010). The financial accelerator in an evolving credit network. Journal of Economic Dynamics and Control, 34(9), 1627-1650.
- Keynes, J. M. (1936). The General Theory of Employment, Interest and Money. Macmillan.
- Special Investigation Commission. (2010). Report on the collapse of Icelandic banks.
- World Bank. (2023). World Economic Indicators.
