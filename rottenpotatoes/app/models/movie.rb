class Movie < ActiveRecord::Base
    def self.find_similar_by_director movie
        director = Movie.find_by(title: movie).director
        if director == '' or director.nil?
            return 
        end
        Movie.where(director: director)
    end
end
