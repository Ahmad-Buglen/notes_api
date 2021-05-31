class AddRegistrationTokenForAdminUser < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :mobile_token, :string
  end
end
