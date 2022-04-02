class Category < ApplicationRecord

  validates :name, presence: true, length: { maximum: 20, minimum: 3 }

  before_create :my_before_create
  after_create :my_after_create

  has_many :products

  def my_before_create
    #byebug
    p "🎃 Before Category Create " + { id: self.id, name: self.name }.to_s # id should be nil
  end

  def my_after_create
    #byebug
    p "🌽 After Category Create " + { id: self.id, name: self.name }.to_s # id shouldn't be nil
  end
end
