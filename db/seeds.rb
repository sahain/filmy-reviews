# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create!([
  {
    title: 'The Big Sleep',
    description: 
    %{
      Private detective Philip Marlowe is hired by a rich family. Before the complex case is over, he's seen murder, blackmail, and what might be love.
    }.squish,
    cast: 'Humphrey Bogart, Lauren Bacall, John Ridgely',
    released_on: "1946-08-31",
    duration: '114 min',
    director: 'Howard Hawks',
    rating: 'PG',
    total_gross: 1_100_000
  },
  {
    title: 'Touch of Evil',
    description: 
    %{
      A stark, perverse story of murder, kidnapping, and police corruption in a Mexican border town.
    }.squish,
    cast: 'Charlton Heston, Orson Welles, Janet Leigh',
    released_on: "1958-05-01",
    duration: '143 min',
    director: 'Orson Welles',
    rating: 'PG-13',
    total_gross: 2_500_000
  },
  {
    title: 'The Third Man',
    description: 
    %{
      Pulp novelist Holly Martins travels to shadowy, postwar Vienna, only to find himself investigating the mysterious death of an old friend, black-market opportunist Harry Lime.
    }.squish,
    cast: 'Orson Welles, Joseph Cotten, Alida Valli',
    released_on: "1949-08-31",
    duration: '104 min',
    director: 'Carol Reed',
    rating: 'PG',
    total_gross: 600_000
  },
  {
    title: 'M',
    description: 
    %{
      When the police in a German city are unable to catch a child-murderer, other criminals join in the manhunt.
    }.squish,
    cast: 'Peter Lorre, Ellen Widmann, Inge Landgut',
    released_on: "1931-06-23",
    duration: '117 min',
    director: 'Fritz Lang',
    rating: 'R',
    total_gross: 30_000
  },
  {
    title: "Walk Like a Man",
    description: 
    %{
      Boy raised by wolves is reunited as an adult with his real family.
    }.squish,
    cast: "Christopher Lloyd, Howie Mandel, Cloris Leachman",
    released_on: "1987-04-17",
    duration: "86 min",
    director: "Melvin Frank",
    rating: "PG",
    total_gross: 460_000
  },
  {
    title: 'Evil Dead II',
    description: 
    %{
      The lone survivor of an onslaught of flesh-possessing spirits holds up in a cabin with a group of strangers while the demons continue their attack.
    }.squish,
    cast: 'Bruce Campbell, Sarah Berry, Dan Hicks',
    released_on: "1987-03-13",
    duration: '84 min',
    director: 'Sam Raimi',
    rating: 'NC-17',
    total_gross: 6_000_000
  }
])

10.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  full_name = first_name + " " + last_name
  isp = ["gmail", "yahoo", "aol"]
  isp = isp.sample
  email = "#{first_name+last_name}@#{isp}.com"
  password = "password"
  User.create!(
    name: full_name,
    email: email,
    password: password,
    password_confirmation: password
    )
end

User.create!([
  {
    name: Faker::Name.name,
    email: "email@email.com",
    password: "password",
    password_confirmation: "password",
    admin: true
  }

])

user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)
user4 = User.find(4)

action = Genre.create!(name: "Action")
comedy = Genre.create!(name: "Comedy")
drama = Genre.create!(name: "Drama")
romance = Genre.create!(name: "Romance")
thriller = Genre.create!(name: "Thriller")
fantasy = Genre.create!(name: "Fantasy")
documentary = Genre.create!(name: "Documentary")
adventure = Genre.create!(name: "Adventure")
animation = Genre.create!(name: "Animation")
scifi = Genre.create!(name: "Sci-Fi")
film_noir = Genre.create!(name: "Film-Noir")
horror = Genre.create!(name: "Horror")

movie = Movie.find_by(title: 'Walk Like a Man')
movie.reviews.create!(user: user1, stars: 5, comment: "Through the juxtaposition of poverty and nature, Walk Like a Man fragments order and chaos.")
movie.reviews.create!(user: user2, stars: 5, comment: "A compelling plot. I was rivetted to my chair in the theater!")
movie.reviews.create!(user: user3, stars: 4, comment: "The story was a bit convoluted, but the acting was incredible! I urge you to go just to see the virtuoso performance of Howie Mandel. Simply brilliant.")
movie.fans << user1
movie.fans << user2
movie.fans << user3
movie.genres = [comedy]

movie = Movie.find_by(title: 'The Big Sleep')
movie.reviews.create!(user: user1, stars: 2, comment: "A bicameral perambulation of relentlessly visceral post-disco. Plodding.")
movie.reviews.create!(user: user2, stars: 1, comment: "When I saw this in the theater, I was like, huh?")
movie.reviews.create!(user: user4, stars: 5, comment: "A synaesthetic ejaculation of purple.")
movie.fans << user4
movie.genres = [drama, film_noir]

movie = Movie.find_by(title: 'Touch of Evil')
movie.genres = [film_noir, drama]
movie.reviews.create!(user: user1, stars: 3, comment: "A salubrious race against time of super-sized lazer-waves. The end is filled with substandard interpretational mediocrity, however.")

movie = Movie.find_by(title: 'The Third Man')
movie.genres = [film_noir, drama]

movie = Movie.find_by(title: 'Evil Dead II')
movie.genres = [horror]

movie = Movie.find_by(title: 'M')
movie.genres = [drama, thriller]
