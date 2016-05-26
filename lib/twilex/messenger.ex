defmodule Twilex.Messenger do
  @default_base_url ""

  def base_url() do
    sid = Application.get_env(:twilex, :sid)
    "https://api.twilio.com/2010-04-01/Accounts/#{sid}/Messages.json"
  end

  def send_message(from_number, to_number, message) do
    sid = Application.get_env(:twilex, :sid)
    token = Application.get_env(:twilex, :token)
    hackney = [basic_auth: {sid, token}]

    HTTPoison.post(base_url, {:form, ["From": from_number, "To": to_number, "Body": message]}, [], [hackney: hackney])
  end
end
