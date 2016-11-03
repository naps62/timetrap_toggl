class TimetrapToggl::Toggler
  attr_reader :entries, :client

  def initialize(entries, client)
    @entries = entries
    @client  = client
  end

  def toggl
    entries.each do |entry|
      if entry.key? :error
        failed << entry
      else
        client.create_time_entry(entry)
        submitted << entry
      end
    end

    { submitted: submitted, failed: failed }
  end

  def submitted
    @submitted ||= []
  end

  def failed
    @failed ||= []
  end
end
