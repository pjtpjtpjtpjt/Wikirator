class UsersController < ApplicationController
  def show
  
  end
  
  
  def update
  current_user.update(role: "standard")
  redirect_to root_path
  end
  
  
end
