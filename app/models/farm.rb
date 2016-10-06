class Farm < ActiveRecord::Base
  belongs_to :user
  has_many :storages
  validates :name, presence: true, 
  length: {minimum: 3, maximum: 15}, uniqueness: {case_sensitive: false}
  validates_associated :user, presence: true
end
