require 'faker'

# Premium plan

admin = User.new(
  name: 'Amber Rose',
  email: 'admin@textopedia.com',
  password: 'helloworld',
  plan: 'premium'
)
admin.skip_confirmation!
admin.save!

# Free plan

mod = User.new(
  name: 'Coral Reed',
  email: 'mod@textopedia.com',
  password: 'helloworld',
  plan: 'free'
)
mod.skip_confirmation!
mod.save!

# More users on free 
6.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld',
    plan: 'free'
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

text_array = ["Adventures in the Open Sea", "Best Books of 2014", "Conspiracies in the 1900s", "Delirium: What Does It Look Like?", "Evenings in Paris", "Foliage", "The Art of Gastronomy", "History's Top 10 Unsung Heroes", "Investigation into 2010 Election", "Joke's on You: April Fool's Traditions", "Knowing When to Let Go", "Love in the Time of... Smartphones?", "DIY: Makeshift Gadgets", "Nature and Technology", "Oasis in the Desert", "Portable Power: Is It Here?", "Quotes of the Day", "Our Favorite Thanksgiving Recipes", "Solar Talks Yield Promising Results", "Try Again: The Importance of Determination", "Unclear Link Between Jobs and Economy", "Vacation Vows", "Our Wondrous World", "Xeric Xenoliths", "Youths Aren't Buying Cars, Homes, or Much of Anything", "Zealotry in the 20th Century"]

text_array.each do |t|
  text = Text.create!(
    title: t,
    users: users.sample(rand(1..5)),
    description: Faker::Lorem.paragraph
  )
  text.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
end

texts = Text.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Text.count} topics created"
