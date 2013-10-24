class HttpRequestRecorderController < ApplicationController
  LOG_FILE = "#{Rails.root}/log/service-minion.log"

  def retrieve 
    render file: LOG_FILE
  end

  def record
    minionLogger = Logger.new(LOG_FILE)
    #File.open(LOG_FILE, "w") { |f| f.truncate(0) }
    minionLogger.info(request.body.read)
    minionLogger.close
    head :ok, :content_type => 'text/html'
  end

  def retrieve_gmail 
  end
end
