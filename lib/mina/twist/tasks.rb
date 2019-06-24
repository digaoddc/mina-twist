require 'json'
require 'net/http'
require 'mina'

namespace :twist do
  set :twist_url,       -> { ENV['TWIST_URL'] }
  set :author,          -> { ENV['GIT_AUTHOR_NAME'] || `git config user.name`.chomp }
  set :commit, -> { ENV['GIT_COMMIT'] || `git rev-parse #{fetch(:branch)} | cut -c 1-7`.strip }
  set :environment, -> { ENV['to'] }

  task :starting do
    notification = "#{fetch(:author).call} is deploying branch #{branch_name} to #{fetch(:environment).call}"
    post_twist_thread(notification)
    set(:start_time, Time.now)
  end

  task :finished do
    end_time = Time.now
    start_time = fetch(:start_time)
    elapsed = end_time.to_i - start_time.to_i

    notification = "#{fetch(:author).call} successfully deployed branch #{branch_name} in #{elapsed} seconds."
    post_twist_thread(notification)
  end

  def branch_name
    "#{fetch(:branch)} (#{fetch(:commit).call})"
  end

  def post_twist_thread(message)
    uri = URI.parse(fetch(:twist_url))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    payload = {
      content: message
    }
    headers = {'Content-Type': 'application/json'}

    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = payload.to_json

    # Call Twist webhook
    http.request(request)
  end
end
