class User < ActiveRecord::Base
    has_many :reviews
    has_many :movies, through: :reviews
    
    def format_date
        self.date_joined.strftime("%b %Y")
    end

end
