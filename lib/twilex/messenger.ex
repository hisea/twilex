defmodule Twilex.Messenger do
  @endpoint "https://api.twilio.com/2010-04-01/Accounts/"

  #####
  # Public API
  #####

  @doc """
  The send_sms/4 function sends an sms to a
  given phone number from a given phone number.

  ## Example:
      ```
      iex(1)> Twilex.Messenger.send_sms("15005550006", "15005550001", "test text")
      ```
  """

  @spec send_sms(String.t(), String.t(), String.t(), String.t()) :: map()
  def send_sms(from, to, body, media \\ "") do
    request_url()
    |> HTTPoison.post!(sms(from, to, body, media), headers())
    |> process_response_body()
  end

  #####
  # Private API
  #####

  defp process_response_body(%HTTPoison.Response{body: body}) do
    Poison.decode!(body, keys: :atom)
  end

  defp sms(from, to, body, media) do
    {:form, [To: to, From: from, Body: body, MediaUrl: media]}
  end

  def request_url do
    sid = Application.get_env(:twilex, :sid)

    "#{@endpoint}#{sid}/Messages.json"
  end

  defp headers do
    sid = Application.get_env(:twilex, :sid)
    token = Application.get_env(:twilex, :token)

    encoded_token = Base.encode64("#{sid}:#{token}")

    [
      {"Content-Type", "application/x-www-form-urlencoded"},
      {"Authorization", "Basic " <> encoded_token}
    ]
  end
end
