require 'sinatra/asset_pipeline'

module Example
  class App < Sinatra::Base
    configure do
      # Asset configuration and settings
      set root: File.expand_path('../../', __FILE__)
      register Sinatra::AssetPipeline
      set :assets_css_compressor, :sass
      set :assets_js_compressor, :uglifier
      if defined?(RailsAssets)
        RailsAssets.load_paths.each do |path|
          settings.sprockets.append_path(path)
        end
      end
    end
    enable :sessions
    set :session_secret, ENV['SESSION_KEY']
    register Sinatra::Auth::Oauthed

    get '/logout' do
      logout!
      'Peace!'
    end

    # API proxy, sends authenticated requests
    #
    # This isn't working yet
    # get '/api/*' do
    #   authenticate!
    #   url = params[:captures][0]
    #   oauthed_raw_request(url)
    # end

    # The pages that are rendered
    #
    # Add new routes below here
    get '/' do
      authenticate!
      @user = oauthed_user
      # @organization_id = oauthed_user.organization_id
      # You can make requests to the API and set them on instance variables to
      # render on the page. Include the path, get a response
      @req = oauthed_raw_request('me')
      haml :demo_index
    end

    get '/no_authentication' do
      haml :demo_index
    end
  end
end
