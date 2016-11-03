# timetrap-toggl

A Toggl formatter for Timetrap

`timetrap-toggl` allows you to submit your timetrap timesheets to [Toggl](https://toggl.com/).

__timetrap-toggl__'s initial development was sponsored by [dscout](https://dscout.com). Many thanks to them!

## Usage

```bash
# Reference one of your toggl project task aliases within an entry's note:
$ timetrap in working on timetrap-toggl @code
$ timetrap out

# display the entries you wish to submit using the toggl formatter:
$ timetrap display --start 'last monday' --end 'last friday' --format toggl
```

## Installation

```bash
$ gem install timetrap_toggl

$ echo "require 'timetrap_toggl'" > ./path/to/formatters/toggl.rb
```

## Configuration

```yaml
# ~/.timetrap.yml
---
...
toggl:
  api_token: "YOUR_API_TOKEN"
  workspace: "My workspace"
```

The gem will find all the projects in the given workspace, and match them with
the tags you add to your tasks. Here's a correspondence of examples of Toggl
project names, and the corresponding tags you should use:

* `ProjectName`: `@projectname` (matching is case-insensitive)
* `Marketing & Communication`: `@marketing-communication` (special characters
    and spaces are replaced with dashes)

## Dependencies

timetrap-toggl depends upon the timetrap gem

When installing timetrap-toggl, timetrap is installed for you as a runtime
dependency.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Thanks

* [dblandin](https://github.com/dblandin) for creating timetrap-harvest, which
    was the basis for this one
