require 'securerandom'
require 'carrierwave'
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
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ActiveRecord::Base
   #set_table_name 'customers'
has_many:folios
accepts_nested_attributes_for :folios

has_many:savingsdeposits
accepts_nested_attributes_for :savingsdeposits

#has_many:savingsdeposits
  
#accepts_nested_attributes_for :savingsdeposits
  attr_accessible :address, :city, :dob, :first_name, :last_name, :pan, :pincode, :sex, :state, :status, :code, :image, :folios_attributes, :savingsdeposits_attributes
  belongs_to :user

  
  mount_uploader :image, ImageUploader

#before_save :make_it_folio
#def make_it_folio
  # this can create permalink with random 8 digit alphanumeric
  #self.folio = SecureRandom.random_number(68430)
#end

before_create :increment_code
def increment_code
    self.code = (self.class.last.nil?) ? "0000000001" : ((self.class.last.code.to_i) + 1).to_s.rjust(10, '0')
end 

before_save :set_default_val
  def set_default_val
    self.status = 'Pending' unless self.status
  end

  

#def self.search(search, id, page)
  #paginate :per_page => 20, :page => page
  #if search
  #where('first_name LIKE ?', "%#{search}%")
  #else
  #scoped
  #end
#end
 
  
  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: %r{^[a-zA-Z]*} }

  validates :last_name, presence: true, length: { maximum: 50 }, format: { with: %r{^[a-zA-Z]*} }

  validates_inclusion_of :dob,
      :in => Date.civil(1900, 1, 1)..Date.today,
      :message => "must be between 1990 and now"

  validates :sex, presence: true

  validates :address, presence: true

  validates :city, presence: true
 
  validates :state, presence: true

  validates_numericality_of :pincode, presence: true, length: { maximum: 6 }

  validates :pan, presence: true, format: { with: %r{^[A-Z]{5}\d{4}[A-Z]{1}} }, :uniqueness => true

  validates_length_of :pan, :is => 10, :wrong_length => "Should be 10 characters only"

   
end

