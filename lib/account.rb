class Account

    attr_reader :balance, :bank_statement

    def initialize(statement_object = BankStatement.new)
      @balance = 0.00
      @bank_statement = statement_object
    end

    def deposit(amount)
      add_amount_to_balance(amount)
      transaction = transaction_manager.create_transaction('Deposit', amount)
      add_balance_to_transaction(transaction)
      send_transaction_to_statement(transaction)
      transaction
    end

    def withdraw(amount)
      subtract_ammount_from_balance(amount)
      transaction = transaction_manager.create_transaction('Withdraw', amount)
      add_balance_to_transaction(transaction)
      send_transaction_to_statement(transaction)
      transaction
    end

    def print_statement
      bank_statement_printer
    end

    private

    attr_writer :balance

    def bank_statement_printer
      self.bank_statement.print_statement
    end

    def send_transaction_to_statement(transaction)
      self.bank_statement.push(transaction)
    end

    def add_balance_to_transaction(transaction)
      transaction[:balance] = self.balance
    end

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
