class HttpRequestRecorderController < ApplicationController
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
  end
end
