require 'ostruct'
module TransactionManager

  def self.create_transaction(action, amount)
    OpenStruct.new(
      action: action,
      amount: amount,
      date: DateTime.now.strftime('%d/%m/%Y'))
  end

end
