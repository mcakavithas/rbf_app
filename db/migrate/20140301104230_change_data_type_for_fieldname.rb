class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def up
  	change_column :savingsdeposits, :current_balace, :integer
  end

  def down

  	 change_column :savingsdeposits, :current_balace, :string
  end



end
