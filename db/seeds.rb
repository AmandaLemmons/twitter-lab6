
user = User.create username: 'amanda', password: 'amanda', password_confirmation: 'amanda', email: 'amanda.lemmons@gmail.com'


5.times do
  user = User.create username: Faker::Internet.user_name, password: "12345678", password_confirmation: "12345678", email: Faker::Internet.email
end

30.times do
  user = User.all.sample
  created_at = (1..21).to_a.sample.days.ago
  Tweet.create user: user,
                  content: Faker::Company.catch_phrase,
                  created_at: created_at,
                  updated_at: created_at
end
