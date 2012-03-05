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
    @calories < 200
  end

  def delicious?
    true
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
    @flavor == 'black licorice' ? false : super
  end
end