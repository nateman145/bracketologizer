class Bracket < ActiveRecord::Base
  has_one :user
  belongs_to :bracket_node
end
