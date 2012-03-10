class CartesianProduct
  include Enumerable
  def initialize(array1, array2)
    @array1 = array1
    @array2 = array2
    @array = []
    if (!@array1.empty? && !@array2.empty?)
      @array1.each { |element1| @array2.each { |element2| @array << [element1, element2]}}
    end

    def each
      @array.each { |element| yield element }
    end
  end
end