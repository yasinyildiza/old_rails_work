#encoding: utf-8

puts "Creating Class Types"
ClassType.find_or_create_by_name(:name => "Data")
ClassType.find_or_create_by_name(:name => "View")
ClassType.find_or_create_by_name(:name => "ViewController")
ClassType.find_or_create_by_name(:name => "Manager")
ClassType.find_or_create_by_name(:name => "Other")

puts "Creating Data Types"
DataType.find_or_create_by_name(:name => "Void")
DataType.find_or_create_by_name(:name => "String")
DataType.find_or_create_by_name(:name => "Integer")
DataType.find_or_create_by_name(:name => "Long")
DataType.find_or_create_by_name(:name => "Float")
DataType.find_or_create_by_name(:name => "Double")
DataType.find_or_create_by_name(:name => "Boolean")
DataType.find_or_create_by_name(:name => "Array")
DataType.find_or_create_by_name(:name => "Dictionary")
DataType.find_or_create_by_name(:name => "Tuple")
DataType.find_or_create_by_name(:name => "Object")

puts "Creating Method Types"
MethodType.find_or_create_by_name_and_character(:name => "Constructor", :character => "C")
MethodType.find_or_create_by_name_and_character(:name => "Destructor", :character => "D")
MethodType.find_or_create_by_name_and_character(:name => "Static Method", :character => "+")
MethodType.find_or_create_by_name_and_character(:name => "Instance Method", :character => "-")