class TimetrapToggl::Formatter
  TOGGABLE_REGEX = /@(.*)/

  attr_reader :entry, :config

  def initialize(entry, config)
    @entry  = entry
    @config = config
  end

  def format
    if project["id"]
      {
        description: entry[:note],
        duration: seconds_for_time(entry[:start], entry[:end]),
        start:   TogglV8::API.new.iso8601(entry[:start]),
        pid: project["id"],
        created_with: "timetrap-toggl",
      }
    else
      {
        error: "Project #{project["name"]} does not exist",
        note: entry[:note]
      }
    end
  end

  def project
    config.projects.find { |p| p["name"].downcase == code.downcase }
  end

  def task_id
    alias_config[:task_id]
  end

  def round_in_minutes
    config.round_in_minutes
  end

  def code
    if match = TOGGABLE_REGEX.match(entry[:note])
      code = match[1]
    end
  end

  def seconds_for_time(start_time, end_time)
    end_time - start_time
  end
end
