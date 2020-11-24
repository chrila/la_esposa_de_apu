class CreateBreastfeedings < ActiveRecord::Migration[6.0]
  def change
    create_table :breastfeedings do |t|
      t.float :amount
      t.float :time
      t.references :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
