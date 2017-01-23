require 'account'

describe Account do

  subject(:account) { described_class.new(bank_statement) }
  let(:bank_statement) { double(:bank_statement) }
  before { allow(bank_statement).to receive(:push)}

  context 'tests bank statement' do

    it 'should be initialized with a bank statement' do
      expect(account.bank_statement).to eq bank_statement
    end

    it 'should be able to print a bank statement' do
      allow(bank_statement).to receive(:print_statement).and_return('statement')
      expect(account.print_statement).to eq 'statement'
    end

  end

  context 'tests balance' do

    it 'should test that account is initialized with a balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'should test that the balance increases with deposits' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end

    it 'should test that the balance decreases with withdrawals' do
      account.withdraw(500)
      expect(account.balance).to eq -500
    end

  end

  context 'new transactions' do

    it 'should be able to create a new deposit' do
      date = DateTime.now.strftime('%d/%m/%Y')
      expect(account.deposit(500)).to have_attributes(:action => 'Deposit', :amount => 500, :date => date, :balance => 500)
    end

    it 'should be able to create a new withdrawal' do
      date = DateTime.now.strftime('%d/%m/%Y')
      expect(account.withdraw(500)).to have_attributes(:action => 'Withdraw', :amount => 500, :date => date, :balance => -500)
    end
  end
end
