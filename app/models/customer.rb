# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  dob        :date
#  sex        :string(255)
#  address    :text
#  city       :string(255)
#  state      :string(255)
#  pincode    :integer
#  pan        :text
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :dob, :first_name, :last_name, :pan, :pincode, :sex, :state, :status

  
before_save :set_default_val

  def set_default_val
    self.status = 'Pending' unless self.status
  end

 

  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: %r{^[A-Z][a-zA-Z\s]*} }

  validates :last_name, presence: true, length: { maximum: 50 }, format: { with: %r{^[A-Z][a-zA-Z\s]*} }

  validates_inclusion_of :dob,
      :in => Date.civil(1900, 1, 1)..Date.today,
      :message => "must be between 1990 and now"

  validates :sex, presence: true

  validates :address, presence: true

  validates :city, presence: true

  validates :state, presence: true

  validates_numericality_of :pincode, presence: true, length: { maximum: 6 }

  validates :pan, presence: true, format: { with: %r{^[A-Z]{5}\d{4}[A-Z]{1}} }

  validates_length_of :pan, :is => 10, :wrong_length => "Pan Should be 10 characters only"

   
end
