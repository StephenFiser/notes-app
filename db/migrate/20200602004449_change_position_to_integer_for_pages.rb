class ChangePositionToIntegerForPages < ActiveRecord::Migration[6.0]
  def change
    change_column :pages, :position, :integer
  end
end
