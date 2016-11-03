class TimetrapToggl::Output
  LINE_DIVIDER     = '-' * 80
  SUBMITTED_HEADER = "Submitted entries\n#{LINE_DIVIDER}"
  FAILED_HEADER    = "Failed entries\n#{LINE_DIVIDER}"

  attr_reader :results, :projects

  def initialize(results, projects)
    @results = results
    @projects = projects
  end

  def generate
    messages = [stats]

    unless submitted.empty?
      messages << SUBMITTED_HEADER
      messages += submitted.map do |submitted|
        project = projects.find { |p| p["id"] == submitted["pid"] }
        success_message("#{project["name"]} - #{submitted["description"]}")
      end
      messages << "\n"
    end

    unless failed.empty?
      messages << FAILED_HEADER
      messages += failed.map do |failed|
        project = projects.find { |p| p["id"] == failed["pid"] }
        failed_message(failed[:note], failed[:error])
      end
      messages << "\n"
    end

    messages.join("\n")
  end

  private

  def stats
    "Submitted: #{submitted.count}\nFailed: #{failed.count}\n"
  end

  def submitted
    results.fetch(:submitted, [])
  end

  def failed
    results.fetch(:failed, [])
  end

  def success_message(note)
    "Submitted: #{note}"
  end

  def failed_message(note, error)
    "Failed (#{error}): #{note}"
  end
end
