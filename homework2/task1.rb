class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1 }

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
    self * @@currencies[singular_currency]
    else
    super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
    self / @@currencies[singular_currency]
    end
  end
end

class String
  def palindrome?()
    x = self.downcase.gsub(/\W/, "")
    x == x.reverse
  end
end

class Array
  def palindrome?()
    self.to_s.palindrome?
  end
end