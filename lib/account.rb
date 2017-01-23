class Account

    attr_reader :balance, :bank_statement

    def initialize(statement_object = BankStatement)
      @balance = 0
      @bank_statement = statement_object.new
    end

    def deposit(amount)
      transaction_manager.create_transaction('Deposit', amount)
    end

    private

    def transaction_manager(transaction_module = TransactionManager)
      transaction_module
    end

end
