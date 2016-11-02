require "togglv8"

class TimetrapToggl::Config
  MissingTogglConfig     = Class.new(StandardError)
  MissingTogglAliases    = Class.new(StandardError)
  MissingTogglSubdomain  = Class.new(StandardError)
  DEFAULT_ROUND_IN_MINUTES = 15

  attr_reader :timetrap_config

  def initialize(timetrap_config = Timetrap::Config)
    @timetrap_config = timetrap_config
  end

  def api_token
    config['api_token']
  end

  def subdomain
    ensure_subdomain!

    config['subdomain']
  end

  def round_in_minutes
    config['round_in_minutes'] || DEFAULT_ROUND_IN_MINUTES
  end

  def client
    @client ||= TogglV8::API.new(api_token)
  end

  def workspace
    @workspace ||= client.workspaces.find { |w| w["name"] == config["workspace"] }
  end

  def projects
    @projects ||= client.projects(workspace["id"])
  end

  def aliases
    ensure_aliases!

    config['aliases']
  end

  def config
    ensure_config!

    timetrap_config['toggl']
  end

  def ensure_config!
    fail(MissingTogglConfig, 'Missing toggl key in .timetrap.yml config file') if timetrap_config.nil? || timetrap_config['toggl'].nil?
  end

  def ensure_aliases!
    fail(MissingTogglAliases, 'Missing aliases key in .timetrap.yml config file') if config['aliases'].nil?
  end

  def ensure_subdomain!
    fail(MissingTogglSubdomain, 'Missing subdomain key in .timetrap.yml config file') if config['subdomain'].nil?
  end
end
