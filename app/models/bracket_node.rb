class BracketNode < ActiveRecord::Base
  belongs_to :parent_node, :class_name => "BracketNode"
  has_many :children, :class_name => "BracketNode", :primary_key => => :parent_id
  has_one :team
end
