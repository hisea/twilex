defmodule Twilex.Mixfile do
  use Mix.Project

  def project do
    [app: :twilex,
     version: "0.1.0",
     elixir: "~> 1.5",
     description: "A Twilio client for elixir.",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison],
     mod: {Twilex, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.13"},
     {:poison, "~> 3.1"}]
  end

  defp package do
    [licenses: ["MIT"],
     maintainers: ["Yinghai Zhao"],
     links: %{"GitHub" => "https://github.com/hisea/twilex"}]
  end
end
