require 'pry'

class CashRegister

    attr_accessor :total, :last_price
    attr_reader :discount, :items

    def initialize discount=0
        @discount=discount
        @total=0
        @items=[]
        @last_price= 0
    end

    # reader:
    # def discount
    #     @discount
    # end

    def add_item(title, price,quantity=1)
        quantity.times do
            self.items << title
        end

        self.last_price=price*quantity
        self.total = self.total + self.last_price
        # due to PEMDAS the multiplcation will be done first, so it does not have to be in parenthesis
    end

    def apply_discount
        if self.discount > 0
            discount_amount=self.total*self.discount/100
            self.total= self.total - discount_amount
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -=self.last_price
    end

end
# binding.pry