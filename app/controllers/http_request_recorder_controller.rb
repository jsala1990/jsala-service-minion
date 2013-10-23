class HttpRequestRecorderController < ApplicationController
  def minionLogger
    @@minionLogger ||= Logger.new("#{Rails.root}/log/service-minion.log")
  end
  
  def retrieve 
    render file: "#{Rails.root}/log/service-minion.log"
  end

  def record
    minionLogger.info "|$|$#{request.body.read} \n"
    head :ok, :content_type => 'text/html'
  end

  def clear
    f = File.open("#{Rails.root}/log/service-minion.log", "w")
    f.close
    logger.info("Flushed service-minion.log")
    head :ok, :content_type => 'text/html'
  end

end
