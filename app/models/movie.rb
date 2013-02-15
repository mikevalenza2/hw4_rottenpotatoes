class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.similar(id)
    #puts "Testing..." + Movie.find(id).to_s
    #puts "Testing..." + Movie.find(id).director.to_s
    #puts "Testing..." + Movie.find_all_by_director(Movie.find(id).director).to_s
    find_all_by_director(Movie.find(id).director).each do |movie|
        puts "Testing movie:" + movie.title
    end

    @director = Movie.find(id).director
    Movie.find_all_by_director(Movie.find(id).director)
  end
end
