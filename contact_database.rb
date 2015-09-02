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
        puts "#{csv[0]}: #{csv[1]} #{csv[2]} (#{csv[3]}) #{csv[4]}"
    end
    CSV.open("contacts.csv", "r") do |csv|
      puts "---"
      puts "#{csv.readlines.size} records total"
    end
  end

  def self.contact_by_id(contact_id)
    contact = nil
    CSV.foreach('contacts.csv') do |csv|
      if csv[0] == contact_id
        contact = csv
      end
    end
    if contact
        puts "ID #: #{contact[0]}"
        puts "First Name: #{contact[1]}"
        puts "Last Name: #{contact[2]}"
        puts "Email: #{contact[3]}"
    else
        puts "Not found: I'm sorry, but I don't have a record for contact ID ##{contact_id}"
    end
  end

  def self.find_contact(search_term)
    contact = nil
    CSV.foreach('contacts.csv') do |csv|
      if csv.any?{ |string| string.include?(search_term) }
        contact = csv
      end
    end
    if contact
        puts "ID #: #{contact[0]}"
        puts "First Name: #{contact[1]}"
        puts "Last Name: #{contact[2]}"
        puts "Email: #{contact[3]}"
    else
        puts "Not found: I'm sorry, but I don't have any records containing #{search_term}"
    end
  end

  def self.find_duplicate(email)
    CSV.foreach('contacts.csv') do |csv|
      if csv[3] == email
        puts "A contact with this email address already exists."
        puts "Here is the full contact info associated with that email."
        find_contact(email)
        abort
      end
    end
  end

end