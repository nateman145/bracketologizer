class BracketNode < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent_node, :class_name => "BracketNode", :foreign_key => :parent_id
  has_many :children, :class_name => "BracketNode", :foreign_key => :parent_id
  belongs_to :team

  def <=> another
    id <=> another.id
  end
end
