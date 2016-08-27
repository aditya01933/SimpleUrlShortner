class ChangeDefaultOfClicks < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :links, :clicks, 0

  end
end
