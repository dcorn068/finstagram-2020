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

get '/' do

  @finstagram_post_shark = {
    username: "sharky_j",
    avatar_url: "http://naserca.com/images/sharky_j.jpg",
    photo_url: "http://naserca.com/images/shark.jpg",
    humanized_time_ago: get_humanized_time_ago(15),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "sharky_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  @finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
    photo_url: "http://naserca.com/images/whale.jpg",
    humanized_time_ago: get_humanized_time_ago(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
  }

  @finstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
    photo_url: "http://naserca.com/images/marlin.jpg",
    humanized_time_ago: get_humanized_time_ago(190),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)"
    }]
  }

  #  my_variable is a normal variable, only accessible inside this code block
  # @my_variable is an INSTANCE variable, accessible inside any .erb file we render
  # -> "@" is like "pipe into .erb file"
  @finstagram_posts = [@finstagram_post_shark, @finstagram_post_whale, @finstagram_post_marlin]

#   render the .erb file in /views named "index.erb"
    erb(:index)

    # final step: DRY the code https://web-pt.compass.lighthouselabs.ca/days/w3d1/activities/85

end

# next code group here https://web-pt.compass.lighthouselabs.ca/activities/35

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