require 'forwardable'

class BankStatement

  attr_reader :transactions

  extend Forwardable
  def_delegators :@transactions, :push
  include Enumerable

  def initialize
    @transactions = []
  end

  def print_statement
    statement = "date       || credit || debit   || balance\n"
    self.transactions.each do |transaction|
      if transaction.action == 'Deposit'
        statement += "#{transaction.date.to_s.ljust(11)}|| #{('%.2f' % transaction.amount).ljust(7)}|| #{''.ljust(8)}|| #{('%.2f' % transaction.balance).ljust(7)}\n"
      else
        statement += "#{transaction.date.to_s.ljust(11)}|| #{''.ljust(7)}|| #{('%.2f' % transaction.amount).ljust(8)}|| #{('%.2f' % transaction.balance).ljust(7)}\n"
      end
    end
    puts statement
    statement
  end
end
