require 'bank_statement'

describe BankStatement do

  subject(:bank_statement) { described_class.new}

  it 'should have an array to contain transactions' do
    expect(bank_statement.transactions).to eq []
  end

end
