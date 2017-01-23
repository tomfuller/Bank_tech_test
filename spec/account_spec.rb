require 'account'

describe Account do

  subject(:account) { described_class.new }

  context 'tests balance' do

    it 'should test that account is initialied with a balance of zero' do
      expect(account.balance).to eq 0
    end

  end

end
