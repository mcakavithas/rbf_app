class Savingsdeposittransaction < ActiveRecord::Base

belongs_to :savingsdeposit

after_save :calculate_current_balance

#Calculate the Savings Deposit

def calculate_current_balance
  if transactionmode == "Credit"
    savingsdeposit.current_balance += self.transaction_amount.to_i
  elsif transactionmode == "Debit"
    savingsdeposit.current_balance -= self.transaction_amount.to_i
  else
    :savingsdeposits
  end
  savingsdeposit.save

end


attr_accessor :current_balance
  attr_accessible :current_balance
  attr_accessible :comments, :particulars, :status, :transaction_amount, :transaction_date, :transactionmode, :transactiontype, :savingsdeposit_id
  
before_save :set_default_val
  def set_default_val
    self.status = 'Pending' unless self.status
  end
before_save :set_opened_on_date
 def set_opened_on_date
    self.transaction_date = Date.today
 end

#Validation For Savings Deposits Transaction

  validates :transaction_amount, presence: true
  validates :transactionmode, presence: true
  validates :transactiontype, presence: true
  validates :particulars, presence: true
  #validates :comments, presence: true
end
