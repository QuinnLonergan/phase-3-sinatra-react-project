class Review < ActiveRecord::Base
    belongs_to :movie
    belongs_to :user

    def imdb_id
        self.movie.imdb_id
    end

    def title
        self.movie.name
    end

    def year
        self.movie.year
    end
    
    def poster
        self.movie.img_url
    end

    def runtime
        self.movie.runtime
    end

    def genre
        self.movie.genre
    end

    def plot
        self.movie.plot
    end

    def rating 
        self.movie.rating
    end

end
