require 'forwardable'

class BankStatement

  attr_reader :transactions

  extend Forwardable
  def_delegators :@transactions, :push
  include Enumerable

  def initialize
    @transactions = []
  end

end
