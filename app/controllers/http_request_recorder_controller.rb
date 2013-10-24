class HttpRequestRecorderController < ApplicationController
  LOG_FILE = "#{Rails.root}/tmp/service-minion.txt"

  def retrieve 
    render file: LOG_FILE
  end

  def record
    File.open(LOG_FILE, "w") { |f| f.write(request.body.read) }
    head :ok, :content_type => 'text/html'
  end

  def retrieve_gmail 
  end
end
