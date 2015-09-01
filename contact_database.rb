## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase
  
  def self.add_to_database(contact_array)
    CSV.open("contacts.csv", "a") do |csv|
        csv << contact_array
      end
  end

end