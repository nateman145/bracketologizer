class Bracket < ActiveRecord::Base
  has_one :user
  has_one :bracket_node
end
