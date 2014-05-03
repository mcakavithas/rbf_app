class ChangeColumnName < ActiveRecord::Migration
def change
	rename_column :savingsdeposits, :current_balace, :current_balance
end
end
