class Contact
 
  attr_accessor :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end
 
  ## Class Methods
  class << self
    def create(first_name, last_name, email)
      new_contact = Contact.new(first_name, last_name, email)
      id = ContactDatabase.total_contacts
      contact_array = []
      contact_array << id +=1
      contact_array << first_name
      contact_array << last_name
      contact_array << email
      
      ContactDatabase.add_to_database(contact_array)
    end

    def phone_number
      phone_number_hash = {}
      input = ""
      label = ""
      while input != "done" do
        puts "Please enter a label and phone number using the following format: label, XXX-XXX-XXXX."
        puts "Or enter 'done' to complete the new contact"
        input = STDIN.gets.chomp
        (label, number) = input.split(",")
        phone_number_hash[label] = number
      end
    end
    
  end
 
end