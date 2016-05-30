defmodule Twilex.Messenger do
  @endpoint "https://api.twilio.com/2010-04-01/Accounts/"


  def create(from, to, body, media \\ "") do
    {:ok, response} = HTTPoison.post(
      request_url,
      {:form, ["From": from, "To": to, "Body": body, "Media": media]},
      [],
      [ hackney: auth_key ])

    response.body
    |> process_response_body
  end

  def auth_key do
    sid = Application.get_env(:twilex, :sid)
    token = Application.get_env(:twilex, :token)
    [basic_auth: {sid, token}]
  end

  def request_url do
    sid = Application.get_env(:twilex, :sid)

    "#{@endpoint}#{sid}/Messages.json"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.reduce(%{}, fn({k, v}, acc) -> Map.put(acc, String.to_atom(k), v) end)
  end
end
