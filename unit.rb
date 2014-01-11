class Unit
  #basic properties, feel free to add more
  attr_accessor :number, :sqft, :rent, :building, :tenant

  # initialize instance variables
  def initialize(number, sqft, rent)
    @building = building
    @number = number
    @sqft = sqft
    @rent = rent
    @tenant = nil
  end

  #Returns true if unit is available, otherwise false. The unit
  # is available if it is not occupied by a tenant.
  def available?
    if @tenant
      return false
    else
      return true
    end
  end

end
