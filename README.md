### A [Sinatra](http://www.sinatrarb.com/) template for [Grape-Doorkeep applications](https://github.com/sethherr/grape-doorkeeper)

A template application for building mini web sites/services authenticated with OAuth2.

- No database required
- [warden-oauth](https://github.com/Zensaburou/warden-oauthed) for authentication
- [Includes rails assets for bower package management](#rails-assets)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Using it:

1. Fork or clone this repository
2. Update the values in [.env](.env) with [your values](#env-values)
3. Go to the directory this is contained in the terminal
4. `bundle install`
5. Use `rerun rackup` to start the server 
6. The above command will print out something like `WEBrick::HTTPServer#start: pid=62447 port=9292`. Go to localhost:{that_port_number} - e.g. [http://localhost:9292](http://localhost:9292). 
7. Go there to the above url to see the app! :sparkles:

## Env Values

The `.env` file defines information about the service you are connecting to. The `.env` file is gitignored, because you shouldn't commit secrets to Github! There is a sample file at `.env-sample` - move it or copy it to `.env` to get it to work.

The callback url for this sinatra template is `localhost:9292/auth/oauthed/callback` - change localhost:9292 to reflect your local conditions - e.g., if you're running on a different port, or if you deploy this to something with a domain name. You will have to add this to the application on the provider.

After you've created an application on the provider, add the client id (`APPLICATION_CLIENT_ID`) and the client secret (`APPLICATION_CLIENT_SECRET`) of it to the `.env` file.

Update the `OAUTH_BASE_URL` to the url of the service (e.g. [https://bikeindex.org](https://bikeindex.org)). Add the `API_BASE_URL` as well (e.g. [https://bikeindex.org/api/v2](https://bikeindex.org/api/v2))

For the `APPLICATION_SCOPES_REQUESTED`, separate scopes with whitespace.

For `USER_ATTRIBUTES`, separate values with whitespace. This is the values that come along with the user after sign in. You can get more information about the user by selecting them afterward.

## Directories / files

*The directory structure of this app is set up to loosely resemble rails*

- `assets`
  - javascript, coffeescript, css, scss - compiled, minified, concatenated.
- `views`
  - haml, erb or html files. `layout.haml` is the layout file that wraps everything else up.
- `public` 
  - files in here are served directly from the base url
- `config/routes.rb`
  - the routes for the app


## Rails Assets

This template includes [rails-assets](https://rails-assets.org/), which makes it easy to use [bower](http://bower.io/) packages.

**View [the list of bower packages](http://bower.io/search/)** 

Add bower packages to the Gemfile by putting them in the Bower packages block in this format:

    gem 'rails-assets-BOWER_PACKAGE_NAME'`.

Since Javascript packages change quickly, it's a particularly good idea to lock the packages with a loose version after you `bundle install`. e.g. for the jQuery version currently installed,

    `gem 'rails-assets-jquery', '~> 2.1.4'`

*(which means >= 2.1.4 and < 2.2.0).*

So you can safely update your packages with `bundle update`

=======

Many thanks to [sinatra_auth_github](https://github.com/atmos/sinatra_auth_github) :shipit: from which this draws inspiration.