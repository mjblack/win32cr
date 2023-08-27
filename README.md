# win32cr

[![CI](https://github.com/mjblack/win32cr/actions/workflows/crystal.yml/badge.svg)](https://github.com/mjblack/win32cr/actions/workflows/crystal.yml) [![Crystal Latest CI](https://github.com/mjblack/win32cr/actions/workflows/crystal_latest.yml/badge.svg)](https://github.com/mjblack/win32cr/actions/workflows/crystal_latest.yml)

Win32 library bindings created from Windows Metadata.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  win32cr:
    github: mjblack/win32cr
```

## Usage

```ruby
require "win32cr"
require "win32cr/ui/windowsandmessaging"

LibWin32.MessageBoxW(nil, "Message Box Body".to_utf16, "Title".to_utf16, LibWin32::MESSAGEBOX_STYLE::MB_OK)
```

## Contributing

1. Fork it (<https://github.com/mjblack/win32cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Matthew J. Black](https://github.com/mjblack) - creator and maintainer
