import math

def maxProfit(prices):
    n = len(prices)
    min_price = math.inf
    max_profit = 0
    for i in range(n):
        if prices[i] < min_price:
            min_price = prices[i]
            for j in range(i+1,n):
                temp = prices[j] - min_price
                max_profit = temp if temp > max_profit else max_profit

    return max_profit

# Pruebas
print(maxProfit([7, 1, 5, 3, 6, 4]))   # 5
print(maxProfit([7, 6, 4, 3, 1]))      # 0