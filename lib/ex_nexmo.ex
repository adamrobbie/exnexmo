defmodule ExNexmo do
  @moduledoc """
    Elixir Bindings for the Nexmo SMS service
  """

  @doc false
  use Application

  @doc false
  def start(_type, _args) do
    ExNexmo.Supervisor.start_link
  end
end
