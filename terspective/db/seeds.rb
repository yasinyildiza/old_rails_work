user = User.new(:email => 'admin@terspective.com', :password => 'password', :password_confirmation =>'password')
user.save(:validate => false)