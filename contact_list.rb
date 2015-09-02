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
      puts "Please enter the new contact's first name."
      first_name = STDIN.gets.chomp
      puts "Please enter the new contact's last name."
      last_name = STDIN.gets.chomp
      puts "Please enter the new contact's email address"
      email = STDIN.gets.chomp
      Contact.create(first_name, last_name, email)
      puts "The ID for this new contact is #{ContactDatabase.total_contacts}"

    when "list"
      puts "You selected list all contacts."
      puts "Here is a list of all your contacts:"
      ContactDatabase.list_all_contacts

    when "show"
      puts "You selected show a contact."
      puts "Please enter the ID number of the contact you wish to show."
      contact_id = STDIN.gets.chomp
      ContactDatabase.contact_by_id(contact_id)

    when "find"
      puts "You selected find a contact."
      puts "Please enter a term to help me find contacts that match."
      search_term = STDIN.gets.chomp
      ContactDatabase.find_contact
    else
      puts "That is not a valid command."
    end
  end

end

example = Application.new
example.command_list
