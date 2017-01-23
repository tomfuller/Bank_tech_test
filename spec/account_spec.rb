require 'account'

describe Account do

  subject(:account) { described_class.new(bank_statement) }
  let(:bank_statement) { double(:bank_statement) }
  before { allow(bank_statement).to receive(:new)}

  context 'tests bank statement' do

    it 'should be initialized with a bank statement' do
      expect(account.bank_statement).to eq bank_statement.new
    end

  end

  context 'tests balance' do

    it 'should test that account is initialied with a balance of zero' do
      expect(account.balance).to eq 0
    end

  end

  context 'new transactions' do

    it 'should be able to create a new deposit' do
      date = DateTime.now.strftime('%d/%m/%Y')
      expect(account.deposit(500)).to have_attributes(:action => 'Deposit', :amount => 500, :date => date)
    end

  end
end
