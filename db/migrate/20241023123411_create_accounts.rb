class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :password
      t.string :full_name


      t.timestamps
    end
  end
end
