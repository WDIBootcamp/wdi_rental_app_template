class Tenant
  
  #basic properties, feel free to add more
  attr_accessor :name, :phone, :unit
  def initialize(name, phone)
    @name = name
    @phone = phone
    @unit = unit
  end

  # Returns the tenant's contact info (name and phone) as one string
  def contact_info
    puts "#{name}: #{phone}"
  end

end
