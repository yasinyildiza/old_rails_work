puts "creating notification types"
NotificationType.find_or_create_by_name("mail")
NotificationType.find_or_create_by_name("sms")

puts "creating notification types"
NotificationStatus.find_or_create_by_name("new")
NotificationStatus.find_or_create_by_name("pending")
NotificationStatus.find_or_create_by_name("sent")
NotificationStatus.find_or_create_by_name("archived")
NotificationStatus.find_or_create_by_name("cancelled")

puts "creating default user"
User.find_or_create_by_first_name_and_last_name_and_mail_and_phone_number(
	"abc", "def", "notify.me.myself.and.i@gmail.com", "1234567")