class ChangeNotes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :notes, :name, false
    change_column_null :notes, :time, false
  end
end
