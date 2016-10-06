class Storage < ActiveRecord::Base
  belongs_to :farm
  has_many :storables
  
  AVAILABLE_CATEGORIES = ["Rectangular", "Round", "Square"]
  
  validates :capacity, presence: true
  validates :farm_id, presence: true
  
  before_validation :set_capacity
  
  def set_capacity
  
    case self.category.to_s.downcase
      when "rectangular"
        self.capacity = 28
      
      when "round"
        self.capacity = 18
      
      when "square"
        self.capacity = 21
    
    end
  
  end

  
end
