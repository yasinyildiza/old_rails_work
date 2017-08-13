echo dropping database...
rake db:drop
echo database dropped
echo creating database
rake db:create
echo database created
echo migrating
rake db:migrate
echo migration completed
echo seeding
rake db:seed
echo seed completed

rm -rf public/uploads/image/image_file