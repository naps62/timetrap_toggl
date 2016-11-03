# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'timetrap_toggl/version'

Gem::Specification.new do |s|
  s.name        = 'timetrap_toggl'
  s.version     = TimetrapToggl::VERSION
  s.date        = '2014-06-12'
  s.summary     = 'A toggl formatter for Timetrap'
  s.description = <<-DESCRIPTION
    timetrap-toggl bridges the gap between your entries in Timetrap and your
    project tasks in Toggl allowing for incredible easy timesheet
    submissions.
  DESCRIPTION
  s.authors     = ['Miguel Palhas']
  s.email       = 'mpalhas@gmail.com'
  s.files       = Dir.glob('lib/**/*.rb')
  s.homepage    = 'https://github.com/dblandin/timetrap-toggl'
  s.license     = 'MIT'

  s.add_runtime_dependency 'timetrap', '~> 1.7', '>= 1.7.0'
  s.add_runtime_dependency 'togglv8', '~> 1.2.1'

  s.add_development_dependency 'rspec', '~> 3.0',  '>= 3.0.0'
  s.add_development_dependency 'pry',   '~> 0.10', '>= 0.10.0'
end
