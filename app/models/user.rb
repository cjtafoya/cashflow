class User < ActiveRecord::Base
    has_secure_password

    validates :password, length: { minimum: 8 }, allow_nil: true
    validates :email, uniqueness: true
    validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    has_many :public_tokens
    has_many :accounts
    has_many :transactions, through: :accounts
    has_many :categories, through: :transactions
    has_many :budgets

  # def net_worth
  #   worth = 0
  #   accounts.each do |acct|
  #     if acct.acct_subtype == "savings" || acct.acct_subtype == "checking"
  #       worth += acct.current_balance
  #     else
  #       worth -= acct.current_balance
  #     end
  #   end
  #    worth
  # end

end
