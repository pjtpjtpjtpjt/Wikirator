class WikiPolicy < ApplicationPolicy
    def update?
        user.present?
    end
    

  class Scope
     
    attr_reader :user, :scope
    
    def initialize(user, scope)
    @user = user
    @scope = scope
    end
    
    def resolve
      wikis = []
      if user.role == "admin"
          wikis = scope.all
        
        elsif user.role == "standard"
          all_wikis = scope.all
          wikis = []
          all_wikis.each do |wiki|
             if wiki.private == false || wiki.private == true && wiki.users.include?(user)
              wikis << wiki
             end
          end
        else
          
        all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.private == false || wiki.private == true && wiki.users.include?(user) || wiki.user == user
             wikis << wiki
           end
         end
      end
      wikis
    end
  end
     
     
end
    
    
