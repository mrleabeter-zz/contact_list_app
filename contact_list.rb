require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

class Application

  def command_list
    case ARGV[0]

    when "help"
      puts "Here is a list of available commands:"
      puts "new - Create a new contact"
      puts "list - List all contacts"
      puts "show - Show a contact"
      puts "find - Find a contact"

    when "new"
      puts "You selected create a new contact."
      puts "Please enter the new contact's email address"
      email = STDIN.gets.chomp
      ContactDatabase.find_duplicate(email)
      puts "Please enter the new contact's first name."
      first_name = STDIN.gets.chomp
      puts "Please enter the new contact's last name."
      last_name = STDIN.gets.chomp
      new_contact = Contact.new(first_name, last_name, email)
      new_contact.create
      input = ""
      label = ""
      while input != "done" do
        puts "Please enter a label and phone number using the following format: label, XXX-XXX-XXXX."
        puts "Or enter 'done' to complete the new contact"
        input = STDIN.gets.chomp
        if input != "done"
          new_contact.add_phone_num(input)
        end
      end
      new_contact.save
      puts "The ID for this new contact is #{ContactDatabase.total_contacts}"

    when "list"
      puts "You selected list all contacts."
      puts "Here is a list of all your contacts:"
      ContactDatabase.list_all_contacts

    when "show"
      contact_id = ARGV[1]
      ContactDatabase.contact_by_id(contact_id)

    when "find"
      search_term = ARGV[1]
      ContactDatabase.find_contact(search_term)
    else
      puts "That is not a valid command."
    end
  end

end

example = Application.new
example.command_list
