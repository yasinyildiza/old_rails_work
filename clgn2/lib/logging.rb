module Logging
=begin
  def log_info(msg)
    log_in_db(msg,CallChain.caller_method)
  end

  def log_form_error(msg,err_cnt)
    msg.concat(err_cnt.to_s).concat(" form warnings.")
    log_in_db(msg,CallChain.caller_method)
  end

  private

  def log_in_db(msg,caller_method)
    UserLog.create(
      :caller_class => self.class.name,
      :caller_method => caller_method,
      :log_date => Time.now,
      :user => @current_user,
      :message =>msg,
    )
  end
=end
#Getting the Caller Method in Ruby
#http://grosser.it/2009/07/01/getting-the-caller-method-in-ruby/
class CallChain
  def self.caller_method(depth=1)
    result=parse_caller(caller(depth+1).first)
    "#{result[2]}:#{result[1]}"
  end

  private

  #Stolen from ActionMailer, where this was used but was not made reusable
  def self.parse_caller(at)
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ at
      file   = Regexp.last_match[1]
      line   = Regexp.last_match[2].to_i
      method = Regexp.last_match[3].split.last
      [file, line, method]
    end
  end
end
end