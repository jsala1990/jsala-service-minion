class HttpRequestRecorderController < ApplicationController
  def minionLogger
    @@minionLogger ||= Logger.new("#{Rails.root}/log/service-minion.log")
  end

  def record
    minionLogger.info "[#{Time.now}] Request params -> #{params}"
    minionLogger.info "[#{Time.now}] -> Request body begin"
    minionLogger.info request.body.read
    minionLogger.info "[#{Time.now}] -> Request body end"
    head :ok, :content_type => 'text/html'
  end

  def clear
    f = File.open("#{Rails.root}/log/service-minion.log", "w")
    f.close
    logger.info("Flushed service-minion.log")
    head :ok, :content_type => 'text/html'
  end

end
