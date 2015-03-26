class BracketNode < ActiveRecord::Base
  has_one :parent_node, :class_name => "BracketNode", :foreign_key => :parent_id
  has_many :children, :class_name => "BracketNode", :primary_key => :parent_id
  has_one :team
end
