# timetrap-toggl

A Toggl formatter for Timetrap

`timetrap-toggl` allows you to submit your harvest timesheets to [Toggl](https://toggl.com/).

__timetrap-harvest__'s initial development was sponsored by [dscout](https://dscout.com). Many thanks to them!

## Usage

```bash
# Reference one of your harvest project task aliases within an entry's note:
$ timetrap in working on timetrap-harvest @code
$ timetrap out

# display the entries you wish to submit using the harvest formatter:
$ timetrap display --start 'last monday' --end 'last friday' --format harvest
```

## Installation

```bash
$ gem install timetrap-toggl

$ echo "require 'timetrap-toggl'" > ./path/to/formatters/toggl.rb
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
