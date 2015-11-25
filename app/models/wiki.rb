class Wiki < ActiveRecord::Base
  belongs_to :user
  
  
  #default_scope { order('wikis.title') }
  default_scope { order('wikis.user_id DESC') }
end
