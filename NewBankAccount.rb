require './obj'

class NewBankAccount < BankAccount
    def customerPhone
        @customerPhone
    end

    def customerPhone=(value)
        @customerPhone = value
    end
end

customer_account = NewBankAccount.new()
customer_account.customerPhone = "1111"
puts customer_account.customerPhone