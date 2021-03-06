class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
     
      enum role: [:standard, :premium, :admin] 
      
  before_save { self.role ||= :standard }

  
  
  has_many :collaborators
  has_many :wikis


end
