class CreateUsers < ActiveRecord::Migration[5.0]
  enable_extension "citext"
  def change
    create_table :users do |t|
      t.citext :email
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
