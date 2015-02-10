defmodule ExNexmo do
  @moduledoc """
    Elixir Bindings for the Nexmo SMS service
  """

  @doc false
  use Application
  use HTTPoison.Base

  @doc false
  def start(_type, _args) do
    ExNexmo.Supervisor.start_link
  end

  def key do
    Application.get_env(:ex_nexmo, :key) ||
      System.get_env("NEXMO_API_KEY")
  end

  def secret do
    Application.get_env(:ex_nexmo, :secret) ||
      System.get_env("NEXMO_API_SECRET")
  end

  def process_url(endpoint) do
    "https://rest.nexmo.com/" <> endpoint
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  def request(method, endpoint, body) when method == :get do
    ExNexmo.get(endpoint, {:form, body}, %{"Content-type" => "application/x-www-form-urlencoded"}).body
  end
  def request(method, endpoint, body) when method == :post do
    ExNexmo.post(endpoint, {:form, body}, %{"Content-type" => "application/x-www-form-urlencoded"}).body
  end
end
