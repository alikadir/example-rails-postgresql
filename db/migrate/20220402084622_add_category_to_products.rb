class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :category, null: false, foreign_key: true
  end
end
# rails generate migration AddCategoryToProducts category:references
# added category_id field automatically at products