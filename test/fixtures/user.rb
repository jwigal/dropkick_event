class User
  attr_accessor :first, :last
  def initialize(first,last)
    @first,@last = first,last
    self      
  end
  
  def to_s
    "#{first} #{last}"
  end
end
