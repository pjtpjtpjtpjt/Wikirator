class WikiPolicy < ApplicationPolicy
    def update?
        user.present? #&& (record.user == user || record.public? || user.premium? || user.admin?)
    end
    

    
    
end