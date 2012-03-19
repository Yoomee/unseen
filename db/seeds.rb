# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create default users

DEFAULT_USERS = [
  {
    :first_name => 'Si',
    :last_name => 'Wilkins',
    :email => 'si@yoomee.com'
  },
  {
    :first_name => 'Rich',
    :last_name => 'Wells',
    :email => 'rich@yoomee.com'
  },
  {
    :first_name => 'Ian',
    :last_name => 'Mooney',
    :email => 'ian@yoomee.com'
  },
  {
    :first_name => 'Matt',
    :last_name => 'Atkins',
    :email => 'matt@yoomee.com'
  },
  {
    :first_name => 'Andy',
    :last_name => 'Mayer',
    :email => 'andy@yoomee.com'
  },
  {
    :first_name => 'Nicola',
    :last_name => 'Mayer',
    :email => 'nicola@yoomee.com'
  }
]

DEFAULT_USERS.each do |user_attrs|
  user = User.new(user_attrs)
  user.encrypted_password = "$2a$10$0I7i6.g2JMYLoLzYpAZPcujZpGhQ/oJ41RaaMm.8Ff.1k9thCALIm"
  user.save(:validate => false)
end