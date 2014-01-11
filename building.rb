class Building
  
  attr_accessor :name, :address, :units

  # initialize instance variables
  def initialize(name, address, units = [])
    @name = name
    @address = address
    @units = units

  end

  # Returns an array. Each element is a tenant's contact info
  def get_contact_list
    @units.select { |unit| unit.available? == false }.map { |unit| 
      unit.tenant }.map {|contact| contact.contact_info}

  end

  # Returns the total sqft rented.
  def calc_total_sqft_rented
    @units.select { |unit| unit.available? }.map { |unit| unit.sqft }

  end

  # Returns the annual income. Only rented units make income.
  def calc_annual_income
    @total_income =+ @rent

  end

  # Returns an array containing all available units
  def get_available_units 
    @units.select { |unit| unit.available? }.map { |unit| unit.number }
   
  end

  # Returns an array containing all occupied units
  def get_rented_units
    @units.select { |unit| not unit.available? }.map { |unit| unit.number }

  end

  #push created units into the unit array from building
  def add_unit (unit)
    @units << unit

  end

end


