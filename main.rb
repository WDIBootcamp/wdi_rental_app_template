require './building'
require './unit'
require './tenant'
require 'pry'

building = Building.new("Waterfront Tower", "345 Embarcadero")

def menu message
  puts `clear`
  puts "*** Land Lord v1.0 ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Add unit'
  puts '2 : Add tenant'
  puts '3 : Show all unrented units'
  puts '4 : Show tenant contacts'
  puts '5 : Show total rented sqft'
  puts '6 : Cha-ching! Show my annual income'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice

  when "1"
    # 1) ask user for unit info
    puts "What is the unit number?"
    number = gets.chomp
    puts "What is the sqft?"
    sqft = gets.chomp
    puts "What is the rent?"
    rent = gets.chomp
    # 2) use info to create instance of unit.
    new_unit = Unit.new(number, sqft, rent)

    building.add_unit(new_unit)

    # 3) display message that unit was added
    message += "Unit #{number} was added."
   
  when "2"
    message += ''
    # 1) ask user for tenant info
    puts "What is the tenant's name?"
    name = gets.chomp
    puts "What is the tenant's phone number?"
    phone = gets.chomp
    # 2) create new tenant
    new_tenant = Tenant.new(name, phone)
    # 3) display list of available units (unit number)
    puts "The availalbe units are: #{building.get_available_units.join(", ")}"
    # 4) Ask user for unit number (the one the tenant will be assigned to)
    puts "Which unit would you like?"
    chosen_unit = gets.chomp
    # 5) Get a reference to the unit from building.units
    # 6) Assign previously created tenant to the requested unit
    new_tenant.unit = building.units.select {|unit| unit.number == chosen_unit}
    new_tenant.unit[0].tenant = new_tenant
    
    # 7) Display message that tenant X was added to unit Y
    message += "Tenant #{name} was added to unit #{chosen_unit}."
  when "3"
    message += ''
    # Display list of all available units
    message += "unrented units: #{building.get_available_units.join(", ")}"
  when "4"
    message += ""
    # Display a list of all tenants contact info
    message += "Contact list: \n #{building.get_contact_list}"
  when "5"
    message += 'option 5'
    # Show total sqft rented

  when "6"
    message += 'option 6'
    # Show annual income of building
  else
      message += "I don't understand ..."
  end
  choice = menu message

end
