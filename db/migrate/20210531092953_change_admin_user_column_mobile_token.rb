class ChangeAdminUserColumnMobileToken < ActiveRecord::Migration[6.1]
  def change
    change_column_null :admin_users, :mobile_token, false
  end
end
