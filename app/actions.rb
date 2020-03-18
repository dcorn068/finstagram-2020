def get_humanized_time_ago(time_ago_in_minutes)
  if time_ago_in_minutes >= 60
    return "#{time_ago_in_minutes / 60} hours ago"
  else
    return "#{time_ago_in_minutes} minutes ago"
  end
end

# get "/" do
#     File.read('app/views/index.html')
# end

# the "/" route

###################
#### HOMEPAGE #####
###################

get '/' do
#   render the .erb file in /views named "index.erb"
  @finstagram_posts = FinstagramPost.order(created_at: :desc)

    erb(:index)

end

# next code group here https://web-pt.compass.lighthouselabs.ca/activities/35

# listen for a post request
post "/fizzbuss" do
    # validate a new user
    # (sent to us by an HTML form)
    # save the user if valid
end

get "/fizzbuzz" do 
    my_string = ""
    
    for number in 1..100 do
        # creating named booleans like these
        # helps to verify that they're working
        # (you can log the output to check)
        is_divisible_by_3 = number % 3 == 0
        is_divisible_by_5 = number % 5 == 0

        if is_divisible_by_3 && is_divisible_by_5
            my_string = my_string + "FizzBuzz <br/>"

        elsif is_divisible_by_5
            my_string = my_string + "Buzz <br/>"

        elsif is_divisible_by_3
            my_string = my_string + "Fizz <br/>"
            
        else
            my_string = my_string + "#{number} <br/>"
            
        end
    end
    
    return my_string
end

get "/yellow" do 
    # Write a method that accepts a 10-character string of letters and outputs a corresponding phone number string. If the input letter string isn't 10 characters, you should return false (indicating that the input is not valid).

    # Write a method that accepts a 10-character string of letters
    
    my_old_string = "hellohello"
    
    return_string = get_phone_text(my_old_string)

    return return_string
end

# def get_phone_text(string_of_10_chars, arg2, arg3, parameter4)
# our method only takes one argument
    def get_phone_text(string_of_10_chars)

        # the output string, starts empty, we'll add to it before returning it
        returned_string_to_build = ""

        # If the input letter string isn't 10 characters in length return false
        is_string_10_chars_long = string_of_10_chars.length == 10

        if (!is_string_10_chars_long)
            return false
        end
        
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
        number_to_letter_hash = {
            "2": ["A", "B", "C"],
            "3": ["D", "E", "F"],
            "4": ["G", "H", "I"],
            "5": ["J", "K", "L"],
            "6": ["M", "N", "O"],
            "7": ["P", "Q", "R", "S"],
            "8": ["T", "U", "V"],
            "9": ["W", "X", "Y", "Z"]
        }

        # hash (aka map)
        # keys = letters,
                    # values = numbers
        letter_to_number_hash = { A: 1,
            D: 2, G: 3, J: 1, M: 1,
            P: 1, T: 1, W: 1, B: 1, E: 1,
            H: 9, K: 1, N: 1, Q: 1, U: 1,
            X: 1, C: 1, F: 1, I: 1, L: 1,
            O: 1, R: 1, V: 1, Y: 1, S: 1, Z: 1,}
        # make a "map" of letters to numbers

        # break it up into characters
        # 1..string_of_10_chars.length do |char_idx|

        # end

        for char_idx in 0..(string_of_10_chars.length - 1) do
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
            returned_string_to_build = returned_string_to_build + my_number_to_add.to_s
            
        end 
        
        return returned_string_to_build

    end