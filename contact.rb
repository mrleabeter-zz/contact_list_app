class Contact
 
  attr_accessor :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone_number_hash = {}
    @contact_array = []
  end

  def create
    id = ContactDatabase.total_contacts
    @contact_array << id +=1
    @contact_array << @first_name
    @contact_array << @last_name
    @contact_array << @email
  end

  def add_phone_num(input)
    (label, number) = input.split(",")
    @phone_number_hash[label] = number
    @contact_array << @phone_number_hash
  end

  def save
    ContactDatabase.add_to_database(@contact_array)
  end
 
  ## Class Methods
  class << self
    
  end
 
end