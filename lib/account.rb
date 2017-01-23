class Account

    attr_reader :balance, :bank_statement

    def initialize(statement_object = BankStatement)
      @balance = 0
      @bank_statement = statement_object.new
    end

    def deposit(amount)
      add_amount_to_balance(amount)
      transaction_manager.create_transaction('Deposit', amount)
    end

    def withdraw(amount)
      subtract_ammount_from_balance(amount)
      transaction_manager.create_transaction('Withdraw', amount)
    end

    private

    attr_writer :balance

    def transaction_manager(transaction_module = TransactionManager)
      transaction_module
    end

    def add_amount_to_balance(amount)
      self.balance += amount
    end

    def subtract_ammount_from_balance(amount)
      self.balance -= amount
    end

end
