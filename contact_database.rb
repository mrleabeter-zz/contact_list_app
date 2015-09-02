## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  def self.add_to_database(contact_array)
    CSV.open("contacts.csv", "a") do |csv|
        csv << contact_array
      end
  end

  def self.total_contacts
    CSV.open("contacts.csv", "r") do |csv|
      csv.readlines.size
    end
  end

  def self.list_all_contacts
    CSV.foreach('contacts.csv') do |csv|
        puts "#{csv[0]}: #{csv[1]} #{csv[2]}  (#{csv[3]})"
    end
    CSV.open("contacts.csv", "r") do |csv|
      puts "---"
      puts "#{csv.readlines.size} records total"
    end
  end

  def self.show_contact_by_id(contact_id)
    CSV.foreach('contacts.csv') do |csv|
      if csv[0] == contact_id
        puts "ID #: #{csv[0]}"
        puts "First Name: #{csv[1]}"
        puts "Last Name: #{csv[2]}"
        puts "Email: #{csv[3]}"
      end
    end
  end

end