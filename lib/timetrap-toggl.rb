require_relative './timetrap_toggl/version'
require_relative './timetrap_toggl/config'
require_relative './timetrap_toggl/formatter'
require_relative './timetrap_toggl/toggler'
require_relative './timetrap_toggl/output'

begin
  Module.const_get('Timetrap')
rescue NameError
  module Timetrap;
    module Formatters; end
    Config = { 'toggl' => { 'aliases' => {} } }
  end
end

class Timetrap::Formatters::Toggl
  attr_reader :entries
  attr_writer :client, :config

  def initialize(entries)
    @entries = entries
  end

  def output
    results = entries.map { |entry| TimetrapToggl::Formatter.new(entry, config).format }

    toggler = TimetrapToggl::Toggler.new(results, config.client)
    results   = toggler.toggl

    TimetrapToggl::Output.new(results, config.projects).generate
  end

  private

  def config
    @config ||= TimetrapToggl::Config.new
  end
end
