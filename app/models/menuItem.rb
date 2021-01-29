class MenuItem < ActiveRecord::Base
  self.table_name = 'menuItems'
  belongs_to :menu
end