require 'sinatra'

class API < Sinatra::Base

  get '/' do
    # 'Hello from planet earth'
    erb(:index)
  end

  run! if app_file == $0

end

