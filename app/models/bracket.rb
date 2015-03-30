class Bracket < ActiveRecord::Base
  belongs_to :user
  belongs_to :bracket_node
end
