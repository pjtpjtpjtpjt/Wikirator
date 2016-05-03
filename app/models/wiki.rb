class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  
  
  default_scope { order('wikis.user_id DESC') }
  
  def collaborator_for(user)
    collaborators.find_by(user: user)
  end
end
