require 'pry'

class CashRegister

    attr_accessor :total, :discount, :void_last_transaction
  
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end   

    

    def add_item(title, amount, quantity = 1)
        self.total += amount*quantity*(1-@discount/100)
        quantity.times do
            @items << title 
        end
        @void_last_transaction = amount * quantity
    end

    def apply_discount 
        if @discount != 0
            @total -= @total * @discount/100
        "After the discount, the total comes to $#{@total}." 
        else    
        "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total = @total - @void_last_transaction
        @total
    end
    
end
