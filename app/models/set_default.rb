class SetDefault < ActiveRecord::Base

  def self.up
    change_column :customers, :status, :string, :default => "Pending"
  end

  def self.down
    # You can't currently remove default values in Rails
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end

  # attr_accessible :title, :body
end
