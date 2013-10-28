class HttpRequestRecorderController < ApplicationController
  require 'gmail'
  #  LOG_FILE = "#{Rails.root}/log/service-minion.log"
  attr_accessor :this_is_var
  


  def retrieve 
    this_is_var = Rails.cache.read('rando')
    puts this_is_var
    render text: this_is_var

  end

  def record
    Rails.cache.write('rando', request.body.read)
    head :ok, :content_type => 'text/html'
  end


  def retrieve_gmail

    gmail = Gmail.new(params[:username], params[:password])
    mail_count = gmail.inbox.count(:unread)
    unread = gmail.inbox.emails(:unread).last
#    puts unread.body.parts
    
    render text: "Is a mail count #{mail_count}. With message: #{unread.body.inspect}"  

    gmail.logout
  end
end
