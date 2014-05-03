class Dailyproduct < ActiveRecord::Base
    belongs_to :savingsdeposit

  attr_accessible :balance, :from_date, :interest, :no_of_days, :rate_of_interest, :to_date, :savingsdeposit_id
  attr_accessor :current_balance, :opened_on
  attr_accessible :current_balance
end
