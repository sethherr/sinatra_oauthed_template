module Example
  class App < Sinatra::Base
    configure do
      # Asset configuration and settings
      set root: File.expand_path('../../', __FILE__)
    end
    enable :sessions
    set :session_secret, ENV['SESSION_KEY']
    register Sinatra::Auth::Oauthed

    get '/logout' do
      logout!
      'Peace!'
    end

    # The pages that are rendered
    #
    # Add new routes below here
    get '/' do
      authenticate!
      @user = oauthed_user
      haml :demo_index
    end

    get '/no_authentication' do
      haml :demo_index
    end
  end
end
