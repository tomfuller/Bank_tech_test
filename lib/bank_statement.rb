require 'forwardable'

class BankStatement

  attr_reader :transactions

  extend Forwardable
  def_delegators :@transactions, :push
  include Enumerable

  STATEMENT_TITLE_LINE = "date       || credit || debit   || balance\n"

  def initialize
    @transactions = []
  end

  def print_statement
    statement = STATEMENT_TITLE_LINE
    self.transactions.reverse.each do |transaction|
      if transaction.action == 'Deposit'
        statement += create_deposit_line(transaction)
      else
        statement += create_withdrawal_line(transaction)
      end
    end
    print_statement_to_REPL(statement)
    statement
  end

  private

  def create_withdrawal_line(transaction)
    "#{transaction.date.to_s.ljust(11)}|| #{''.ljust(7)}|| #{('%.2f' % transaction.amount).ljust(8)}|| #{('%.2f' % transaction.balance).ljust(7)}\n"
  end

  def create_deposit_line(transaction)
    "#{transaction.date.to_s.ljust(11)}|| #{('%.2f' % transaction.amount).ljust(7)}|| #{''.ljust(8)}|| #{('%.2f' % transaction.balance).ljust(7)}\n"
  end

  def print_statement_to_REPL(statement)
    puts statement
  end
end
