class CreateSavingsdeposits < ActiveRecord::Migration
  def change
    create_table :savingsdeposits do |t|
      t.string :current_balace
      t.date :opened_on
      t.string :account_type
      t.string :status
      t.integer :customer_id

      t.timestamps
    end
  end
end
