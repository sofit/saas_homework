class Dessert
  def name
    @name
  end

  def name=(value)
    @name = value
  end

  def calories
    @calories
  end

  def calories=(value)
    @calories = value
  end

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    return @calories < 200
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def flavor
    @flavor
  end

  def flavor=(value)
    @flavor = value
  end
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    if (@flavor == 'black licorice')
      return false
    else 
      return super
    end
  end
end