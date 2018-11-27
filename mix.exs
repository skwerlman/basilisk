defmodule Basilisk.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :basilisk,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, test: :test],
      deps: deps(),
      dialyzer: dialyzer(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Basilisk.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:protobuf, "~> 0.5"},
      #####
      {:credo, "~> 1.0", runtime: false, only: [:dev, :test]},
      {:dialyxir, ">= 1.0.0-rc.4", runtime: false, only: [:dev, :test]},
      {:distillery, "~> 2.0", runtime: false},
      {:ex_doc, "~> 0.19", runtime: false, only: :dev},
      {:excoveralls, "~> 0.10", runtime: false, only: :test}
    ]
  end

  defp dialyzer do
    plt =
      case Mix.env() do
        # this fixes a failure when dialyxir is run in a test env
        :test ->
          [:ex_unit]

        _ ->
          []
      end

    [
      plt_add_apps: plt,
      flags: [
        :unmatched_returns,
        :error_handling,
        :race_conditions,
        :no_opaque,
        :underspecs
      ]
    ]
  end

  defp package do
    [
      maintainers: ["skwerlman"],
      licenses: ["GPLv3"],
      files: files(),
      links: links()
    ]
  end

  defp files do
    [
      "lib",
      "proto_buf",
      "mix.exs",
      "LICENSE",
      "README.md"
    ]
  end

  defp links do
    %{
      "Github" => "https://github.com/skwerlman/basilisk",
      "Cockatrice Wiki" => "https://github.com/cockatrice/cockatrice/wiki"
    }
  end
end
