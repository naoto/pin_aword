class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :slack_id
      t.string :name
      t.text :avatar_url
      t.timestamps
    end
  end
end
