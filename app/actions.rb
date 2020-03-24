# frozen_string_literal: true

#### HOMEPAGE route

# "listen" for a GET request to "/" (homepage)
get '/' do
  # render the .erb file in /views named "index.erb"
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

###### SIGNUP route

get '/signup' do
  # make an empty user object
  # make it an @instance variable to pass it to the view
  @user = User.new
  # render views/signup.erb
  erb(:signup)
end

post '/signup' do
  # grab user input values from url params
  # e.g. website.com/stuff?email=hi@hi.com&password=secrets
  my_email = params[:email]
  my_avatar_url = params[:avatar_url]
  my_username_value = params[:username]
  my_password = params[:password]

  # instantiate and save a User
  @user = User.new({ email: my_email, avatar_url: my_avatar_url, username: my_username_value, password: my_password })

  # (try to) save the user (checks the validation)
  did_user_save = @user.save

  if did_user_save
    # return readable representation of User object
    redirect to('/')
  else
    # go back to the signup page with the new @user
    erb(:signup)
  end
end

# RUBY EXERCISES

get '/fizzbuzz' do
  my_string = ''

  (1..100).each do |number|
    # creating named booleans like these
    # helps to verify that they're working
    # (you can log the output to check)
    is_divisible_by_3 = number % 3 == 0
    is_divisible_by_5 = number % 5 == 0

    my_string = if is_divisible_by_3 && is_divisible_by_5
                  my_string + 'FizzBuzz <br/>'

                elsif is_divisible_by_5
                  my_string + 'Buzz <br/>'

                elsif is_divisible_by_3
                  my_string + 'Fizz <br/>'

                else
                  my_string + "#{number} <br/>"

                end
  end

  return my_string
end

get '/yellow' do
  # Write a method that accepts a 10-character string of letters and outputs a corresponding phone number string. If the input letter string isn't 10 characters, you should return false (indicating that the input is not valid).

  # Write a method that accepts a 10-character string of letters

  my_old_string = 'hellohello'

  return_string = get_phone_text(my_old_string)

  return return_string
end

# def get_phone_text(string_of_10_chars, arg2, arg3, parameter4)
# our method only takes one argument
def get_phone_text(string_of_10_chars)
  # the output string, starts empty, we'll add to it before returning it
  returned_string_to_build = ''

  # If the input letter string isn't 10 characters in length return false
  is_string_10_chars_long = string_of_10_chars.length == 10

  return false unless is_string_10_chars_long

  # outputs a corresponding phone number string
  # 2 -> A B C
  # 3 -> D E F
  # 4 -> G H I
  # 5 -> J K L
  # 6 -> M N O
  # 7 -> P Q R S
  # 8 -> T U V
  # 9 -> W X Y Z

  # hash,
  # keys = numbers
  # values = arrays of letters
  #   number_to_letter_hash = {
  #     "2": %w[A B C],
  #     "3": %w[D E F],
  #     "4": %w[G H I],
  #     "5": %w[J K L],
  #     "6": %w[M N O],
  #     "7": %w[P Q R S],
  #     "8": %w[T U V],
  #     "9": %w[W X Y Z]
  #   }

  # hash (aka map)
  # keys = letters,
  # values = numbers
  letter_to_number_hash = { A: 1,
                            D: 2, G: 3, J: 1, M: 1,
                            P: 1, T: 1, W: 1, B: 1, E: 1,
                            H: 9, K: 1, N: 1, Q: 1, U: 1,
                            X: 1, C: 1, F: 1, I: 1, L: 1,
                            O: 1, R: 1, V: 1, Y: 1, S: 1, Z: 1 }
  # make a "map" of letters to numbers

  # break it up into characters
  # 1..string_of_10_chars.length do |char_idx|

  # end

  (0..(string_of_10_chars.length - 1)).each do |char_idx|
    # we now have the number between 1 and 10
    # get the letter in the string at "index" 1-10

    my_letter = string_of_10_chars[char_idx]

    # uppercase it!
    my_uppercase_letter = my_letter.upcase

    # # get the associated number
    # # fetch from a hash in ruby https://launchschool.com/books/ruby/read/hashes#fetch
    my_number_to_add = letter_to_number_hash.fetch(my_uppercase_letter.to_sym)

    # get the associated number FROM number_to_letter_hash!!!!!
    # fetch from a hash in ruby https://launchschool.com/books/ruby/read/hashes#fetch
    # my_number_to_add = number_to_letter_hash.fetch(my_uppercase_letter.to_sym)

    # add the number we found to the end of the string we're building
    returned_string_to_build += my_number_to_add.to_s
  end

  returned_string_to_build
end
