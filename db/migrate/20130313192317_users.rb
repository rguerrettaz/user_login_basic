class Users < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name, :email, :password, :secret_page

      t.timestamps
    end
  end
end
