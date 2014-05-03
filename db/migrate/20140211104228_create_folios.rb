class CreateFolios < ActiveRecord::Migration
  def change
    create_table :folios do |t|
      t.date :folio_allocation_date
      t.integer :no_of_shares
      t.integer :customer_id
      t.string :folio_number
      t.timestamps
    end
  end
end
