import pandas as pd
import matplotlib.pyplot as plt

# Load the data
sales = pd.read_csv("Dataset for Data Analytics_2.csv")

# Quick check
print(sales.head())
print(sales.info())
print(sales.columns.tolist())

# Total Revenue by Product
sales_by_product = sales.groupby('Product')['TotalPrice'].sum().sort_values(ascending=False)
plt.figure(figsize=(10, 6))
sales_by_product.plot(kind='bar', color='skyblue')
plt.title('Total Revenue by Product')
plt.xlabel('Product')
plt.ylabel('Total Revenue')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# Number of Orders by Product
orders_by_product = sales['Product'].value_counts()
plt.figure(figsize=(10, 6))
orders_by_product.plot(kind='bar', color='lightgreen')
plt.title('Number of Orders by Product')
plt.xlabel('Product')
plt.ylabel('Number of Orders')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# Payment Method Distribution
payment_counts = sales['PaymentMethod'].value_counts()
plt.figure(figsize=(8, 8))
plt.pie(payment_counts, labels=payment_counts.index, autopct='%1.1f%%', startangle=90)
plt.title('Payment Method Distribution')
plt.axis('equal')
plt.show()

# Order Status Distribution
status_counts = sales['OrderStatus'].value_counts()
plt.figure(figsize=(8, 8))
plt.pie(status_counts, labels=status_counts.index, autopct='%1.1f%%', startangle=90)
plt.title('Order Status Distribution')
plt.axis('equal')
plt.show()

# Sales Over Time
sales['Date'] = pd.to_datetime(sales['Date'])
monthly_sales = sales.groupby(sales['Date'].dt.to_period('M'))['TotalPrice'].sum()
plt.figure(figsize=(12, 6))
monthly_sales.plot(kind='line', marker='o')
plt.title('Monthly Sales Revenue Over Time')
plt.xlabel('Month')
plt.ylabel('Total Revenue')
plt.xticks(rotation=45)
plt.grid(True)
plt.tight_layout()
plt.show()

# Referral Source Performance
referral_sales = sales.groupby('ReferralSource')['TotalPrice'].sum().sort_values(ascending=False)
plt.figure(figsize=(10, 6))
referral_sales.plot(kind='bar', color='orange')
plt.title('Total Sales by Referral Source')
plt.xlabel('Referral Source')
plt.ylabel('Total Revenue')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# Top product by revenue
top_product = sales_by_product.index[0]
top_product_revenue = sales_by_product.iloc[0]
print(f"1. Highest revenue product: {top_product} (${top_product_revenue:,.2f})")

# Most ordered product
most_ordered = orders_by_product.index[0]
print(f"2. Most ordered product: {most_ordered} ({orders_by_product.iloc[0]} orders)")

# Most used payment method
top_payment = payment_counts.index[0]
print(f"3. Most popular payment method: {top_payment} ({payment_counts.iloc[0]} orders)")

# Order status overview
print(f"4. Order Status breakdown:")
for status, count in status_counts.items():
    percentage = (count / len(sales)) * 100
    print(f"   - {status}: {count} orders ({percentage:.1f}%)")

# Top referral source
top_referral = referral_sales.index[0]
print(f"5. Best performing referral source: {top_referral} (${referral_sales.iloc[0]:,.2f})")

# Total revenue
total_revenue = sales['TotalPrice'].sum()
print(f"6. Overall total revenue: ${total_revenue:,.2f}")



