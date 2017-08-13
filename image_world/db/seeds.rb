ActiveRecord::Base.connection.execute("TRUNCATE TABLE categories")

general_category = Category.find_or_create_by_name(:name => 'General Design')
general_category.update_attributes(:description => "Project's General Design Category")

user = User.new(:email => 'admin', :password => 'password', :password_confirmation =>'password')
user.save(:validate => false)
