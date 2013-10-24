class HttpRequestRecorderController < ApplicationController
  LOG_FILE = "#{Rails.root}/log/service-minion.log"

  def logFile
    @@logFile ||= File.new(LOG_FILE, "w")
  end

  def minionLogger
    @@minionLogger ||= Logger.new(logFile.path)
  end
  
  def retrieve 
    render file: logFile.path
  end

  def record
    minionLogger.info "|$|$#{request.body.read} \n"
    head :ok, :content_type => 'text/html'
  end

  def clear
    f = File.open(logFile.path, "w")
    f.truncate(0)
    logger.info("Flushed service-minion.log")
    head :ok, :content_type => 'text/html'
  end

  def retrieve_gmail 
    f = File.open("#{Rails.root}/log/service-minion.log", "w")
    f.close
    logger.info("Flushed service-minion.log")
    head :ok, :content_type => 'text/html'
  end
end
