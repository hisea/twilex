# Twilex

**Twilex is an Elixir Client to send SMS/MMS using Twilio. **

## Install

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add twilex to your list of dependencies in `mix.exs`:

        def deps do
          [{:twilex, "~> 0.0.1"}]
        end

  2. Ensure twilex is started before your application:

        def application do
          [applications: [:twilex]]
        end

## Configure

Add the following to your `config.exs` file:

```
config :twilex,
  sid: "YOUR_TWILIO_SID",
  token: "YOUR_TWILIO_AUTH_TOKEN"
```

## Send Messages

```
 Twilex.Messenger.create("from_number", "to_number", "body_text", "optional_media_url")
 
 i.e.
 
 iex(1)> Twilex.Messenger.create("15005550006", "15005550001", "test text")
```
