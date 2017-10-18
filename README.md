# Twilex

Twilex is an Elixir Client to send SMS/MMS using Twilio.

## Install

1. Add twilex to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:twilex, "~> 0.0.1"}]
  end
  ```

2. Ensure twilex is started before your application:

  ```elixir
  def application do
    [applications: [:twilex]]
  end
  ```


## Configure

Add the following to your `config.exs` file:

```elixir
config :twilex,
  sid: "YOUR_TWILIO_SID",
  token: "YOUR_TWILIO_AUTH_TOKEN"
```

## Usage

```elixir
 # Twilex.Messenger.send_sms("from_number", "to_number", "body_text", "optional_media_url")
 iex(1)> Twilex.Messenger.send_sms("15005550006", "15005550001", "test text", "https://github.com")
```
