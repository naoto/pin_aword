class CreatePin < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :slack_id
      t.string :user_id
      t.text :text
      t.datetime :post_date
      t.integer :fav
      t.timestamps
    end
  end
end
