# 🚗📊 PL/SQL Window Functions Project – AutoMax Dealership Analytics System

# 1.Problem Definition

## Business context

AutoMax is a nationwide car dealership with branches in Kigali, Musanze, and Huye. The company sells vehicles to both individual customers and corporate clients. Management wants better visibility into sales performance across time, customers, and branches.

## Data challenge

Management lacks insight into who the top customers are, how sales evolve monthly, and how to categorize customers into spending tiers. 

Without deeper analysis, decisions on promotions, inventory, and branch strategies are less effective.

## Expected outcome

By applying PL/SQL window functions, AutoMax will gain insights into:

-Top customers by revenue

-Monthly and cumulative sales trends

-Month-over-month growth

-Customer spending segments (quartiles)


# 2.Success Criteria

Here are 5 measurable goals (aligned with the assignment’s requirement):

Top 5 customers by spending using RANK() or DENSE_RANK()
→ Insight: Identify high-value customers for premium offers.

Running monthly sales totals using SUM() OVER()
→ Insight: Monitor cumulative revenue and growth trajectory.

Month-over-month growth using LAG() or LEAD()
→ Insight: Detect increases or decreases in sales performance.

Customer quartiles using NTILE(4)
→ Insight: Segment customers into spending groups (Q1 = top 25%, Q4 = lowest 25%).

3-month moving average of sales using AVG() OVER (ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
→ Insight: Smooth out sales fluctuations and track underlying trends.

# Queries & Results

# 3.Database schema


## Results Analysis
- *Descriptive:* What happened?  
- *Diagnostic:* Why did it happen?  
- *Prescriptive:* What actions should management take?  

## References
1. Oracle Docs: https://docs.oracle.com
2. W3Schools SQL Window Functions
3. TutorialsPoint SQL Window Functions
... (add at least 10)

## Integrity Statement
“All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.”
