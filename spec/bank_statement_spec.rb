require 'bank_statement'

describe BankStatement do

  subject(:bank_statement) { described_class.new}

  it 'should have an array to contain transactions' do
    expect(bank_statement.transactions).to eq []
  end

  it 'should accept a new transaction' do
    bank_statement.push('Transaction')
    expect(bank_statement.transactions).to eq ['Transaction']
  end

end
