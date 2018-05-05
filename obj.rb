class BankAccount
    def initialize()
        @account_number = 1234
        @ivar3 = "ivar3"
    end

    # class variable
    def interest_rate
        @@interest_rate = 0.2
    end

    # accessor
    def account_number
        @account_number
    end

    def account_number=(value)
        @account_number = value
    end

    # attr_accessor
    attr_accessor :ivar1, :ivar2, :ivar3

    # attr_reader, attr_writer
    attr_reader :ivar_reader1
    attr_writer :ivar_writer1

    # method
    def test_method
        puts "The class is working"
        puts account_number

        @ivar_reader1 = "reader"
    end

    def calc_interset(balance)
        puts balance * interest_rate
    end
end

account = BankAccount.new()

puts account.account_number
account.account_number = "54321"
puts account.account_number

puts account.interest_rate
puts account.calc_interset(1000)

account.test_method

account.ivar1 = "ivar1"
account.ivar2 = "ivar2"
puts "attr_reader:"
p account.ivar_reader1
account.ivar_writer1 = "writer"

p account