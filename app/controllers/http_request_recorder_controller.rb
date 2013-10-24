class HttpRequestRecorderController < ApplicationController
  #  LOG_FILE = "#{Rails.root}/log/service-minion.log"

  def retrieve 
    render file: "#{Rails.root}/log/production.log" 
  end

  def record
    puts request.body.read
    head :ok, :content_type => 'text/html'
  end


  def retrieve_gmail 
  end
end
