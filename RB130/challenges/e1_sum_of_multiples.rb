class SumOfMultiples
  DEFAULT = 3, 5
  
  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit)
    new(3, 5).to(limit)
    # (0..limit - 1).select { |number| number % 3 == 0 || number % 5 == 0 }.reduce(&:+)
  end

  def to(limit)
    result = []

    (0..limit - 1).each do |number| 
      result << number if divisable_by_any_factor?(number)
    end

    result.reduce(&:+)
  end

  def divisable_by_any_factor?(number)
    # @factors.each do |factor|
    #   return true if number % factor == 0
    # end
    # false

    @factors.any? { |factor|  number % factor == 0  }
  end
end

p SumOfMultiples.to(20)
p SumOfMultiples.new(3, 5).to(20)