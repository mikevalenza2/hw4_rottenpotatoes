class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.similar(id)
    Movie.find_by_director(Movie.find(id))
  end
end
