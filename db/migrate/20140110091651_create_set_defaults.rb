class CreateSetDefaults < ActiveRecord::Migration
  def change
    create_table :set_defaults do |t|

      t.timestamps
    end
  end
end
