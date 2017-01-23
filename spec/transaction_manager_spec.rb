require 'transaction_manager'

describe TransactionManager do

  subject(:transaction_manager) { described_class }
  let(:bank_station) { double(:bank_statement) }

  it 'should be able to create a transaction' do
    date = DateTime.now.strftime('%d/%m/%Y')
    expect(transaction_manager.create_transaction('Deposit', 500)).to have_attributes(:action => 'Deposit', :amount => 500, :date => date)
  end
end
