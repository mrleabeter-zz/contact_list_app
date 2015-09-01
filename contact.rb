class Contact
 
  attr_accessor :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
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
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end
 
    def all
      # ContactDatabase.all_contacts
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end