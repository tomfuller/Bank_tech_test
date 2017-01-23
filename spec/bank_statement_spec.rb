require 'bank_statement'
require 'ostruct'

describe BankStatement do

  subject(:bank_statement) { described_class.new}

  it 'should have an array to contain transactions' do
    expect(bank_statement.transactions).to eq []
  end

  it 'should accept a new transaction' do
    bank_statement.push('Transaction')
    expect(bank_statement.transactions).to eq ['Transaction']
  end

  it 'should be able to break up the object it recieves and render a statement' do
    transaction = OpenStruct.new(:action => "Withdraw", :amount => 500, :date => '14/01/2012', :balance => 2500.0)
    bank_statement.push(transaction)
    expect(bank_statement.print_statement).to eq(
    "date       || credit || debit   || balance\n" +
    "14/01/2012 ||        || 500.00  || 2500.00\n")
  end
end
