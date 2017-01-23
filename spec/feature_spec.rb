require 'account'
require 'bank_statement'
require 'transaction_manager'

describe 'Feature tests' do
  it 'should be have an account make multiple deposits and withdrawals and return a statement' do
    date = DateTime.now.strftime('%d/%m/%Y')
    account = Account.new
    account.deposit(500)
    account.withdraw(250)
    account.deposit(700)
    account.withdraw(400)
    expect(account.bank_statement.print_statement).to eq(
    "date       || credit || debit   || balance\n" +
    "#{date} ||        || 400.00  || 550.00 \n" +
    "#{date} || 700.00 ||         || 950.00 \n" +
    "#{date} ||        || 250.00  || 250.00 \n" +
    "#{date} || 500.00 ||         || 500.00 \n"
    )
  end
end
