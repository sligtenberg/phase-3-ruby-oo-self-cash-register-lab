require 'pry'
class CashRegister
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    attr_accessor :discount, :total, :items, :last_transaction

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        self.last_transaction = price * quantity
        quantity.times { self.items << title }
        #binding.pry
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total * (100 - self.discount) / 100
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end