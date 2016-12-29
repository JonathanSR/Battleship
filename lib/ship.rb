class Ship

attr_reader :size, :hits
  def initialize(size = 2)
    @size = size
    @hits = 0
  end

  def hit
    @hits += 1
  end

  def health
    @size - @hits
  end

  def sunk?
   @size == @hits
  end
end
