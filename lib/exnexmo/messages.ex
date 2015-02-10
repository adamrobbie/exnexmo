defmodule ExNexmo.Messages do
  def send(params) when is_list(params) do
    ExNexmo.request("sms/json", Enum.concat([api_key: ExNexmo.key, api_secret: ExNexmo.secret], params))
  end

  def send(from, to, text) do
    params = [
      api_key: ExNexmo.key,
      api_secret: ExNexmo.secret,
      from: from,
      to: to,
      text: text
    ]
    ExNexmo.request("sms/json", params)
  end
end
