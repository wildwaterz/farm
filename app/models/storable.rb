class Storable < ActiveRecord::Base
  belongs_to :storage

AVAILABLE_CATEGORIES = ["Chicken", "Cow", "Haystack"]
  
  validates :size, presence: true
  validates :storage_id, presence: true
  validate  :check_space_available 
  
  before_validation :set_size
  
  def set_size
  
    case self.category.to_s.downcase
      when "chicken"
        self.size = 1
        self.weight = rand(3..7)
      
      when "cow"
        self.size = 2
        self.weight = rand(1250..2000).round(-2)
      
      when "haystack"
        self.size = 4
        self.weight = rand(2000..3000).round(-2)
    
    end
  
  end
  
 
  def check_space_available
    if self.size > (self.storage.capacity - self.storage.storables.sum(:size))
      self.errors.add(:size, "Not enough space available!")
    end
  end
end
