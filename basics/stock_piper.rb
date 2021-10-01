def stock_piper(prices)
    min_p = prices[0]
    min_i = 0

    profit = 0
    days=[0,0]
]
    prices.each_with_index do |price, i|
        if price < min_p
            min_p = price
            min_i = i 
            next
        end

        if price - min_p > profit
            profit = price - min_p
            days = [min_i, i]
        end
    end
    
    days
end

stock_prices = [17,3,6,9,15,8,6,1,10]

p stock_piper(stock_prices)