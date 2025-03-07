# Provided, don't edit
require 'directors_database'
require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  movie_with_director = []
  index = 0
  while index < movies_collection.length do
    combine = movie_with_director_name(name, movies_collection[index])
    movie_with_director << combine
    index += 1
  end
  movie_with_director
end


def gross_per_studio(collection)
  gps = {}
  i = 0
  while i < collection.length do
    ww_gross = collection[i][:worldwide_gross]
    studio = collection[i][:studio]
    if !gps[studio]
      gps[studio] =ww_gross
    else
      gps[studio] += ww_gross
    end
    i += 1
  end
  gps
end

def movies_with_directors_set(source)
  movies_and_director = []
  i = 0
  while i < source.length do
    director = source[i][:name]
    inner_pairing = []
    k = 0
    while k < source[i][:movies].length do
      movie = source[i][:movies][k]
      film_unit = movie_with_director_name(director, movie)
      inner_pairing << film_unit
      k += 1
    end
    movies_and_director << inner_pairing
    i += 1
  end
  movies_and_director
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
