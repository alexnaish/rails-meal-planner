class CreateRecipesAndIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.timestamps
      t.references :user, index: true, foreign_key: true
    end

    create_table :ingredients do |t|
      t.references :recipe, index: true, foreign_key: true
      t.string :name
      t.string :quantity
      t.string :quantity_units
      t.timestamps
    end

  end
end
