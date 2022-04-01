class Category < ApplicationRecord

  before_create :my_before_create
  after_create :my_after_create

  def my_before_create
    #byebug
    p "🎃 Before Category Create " + { id: self.id, name: self.name }.to_s # id should be nil
  end

  def my_after_create
    #byebug
    p "🌽 After Category Create " + { id: self.id, name: self.name }.to_s # id shouldn't be nil
  end
end
