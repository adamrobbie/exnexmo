defmodule ExNexmo.Mixfile do
  use Mix.Project

  def project do
    [app: :exnexmo,
     version: "0.0.1",
     elixir: "~> 1.0",
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [ mod: { ExNexmo, [] },
      applications: []
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp description do
    """
    Elixir Bindings for the Nexmo API
    """
  end

  defp package do
    [
      contributors: "adamrobbie",
      liscences: "MIT",
      links: %{"Github" => "https://github.com/adamrobbie/exnexmo"}
    ]
  end
  defp deps do
    [ 
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.1"},
      {:httpotion, "~> 2.0.0"},
      {:poison, "~> 1.3"}]
  end
end
