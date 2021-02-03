defmodule Basilisk.MixProject do
  @moduledoc false
  use Mix.Project

  @version "0.1.0"
  @repo "https://github.com/skwerlman/basilisk"

  def project do
    [
      app: :basilisk,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: [test: :test],
      aliases: aliases(),
      deps: deps(),
      docs: docs(),
      dialyzer: dialyzer(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :protobuf],
      mod: {Basilisk.Application, []},
      start_phases: [
        init: [],
        # sync: [],
        ready: []
      ]
    ]
  end

  defp aliases do
    [
      setup: [
        "cmd ./tasks/setup_hooks.sh",
        "escript.install github skwerlman/protobuf-elixir branch no_underscores",
        "cmd ./tasks/setup_protoc.sh",
        "deps.get",
        "deps.compile",
        "compile",
        "ecto.create",
        "ecto.migrate"
      ],
      hipe: ["protoc", "cmd ./tasks/hipe.sh"],
      protoc: "cmd ./tasks/protoc.sh",
      compile: ["protoc", "compile"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:argon2_elixir, "~> 2.4"},
      {:comeonin, "~> 5.3"},
      {:ecto_sql, "~> 3.5"},
      {:ecto, "~> 3.5"},
      {:flex_logger, "~> 0.2"},
      {:logger_file_backend, "~> 0.0"},
      {:protobuf, git: "https://github.com/skwerlman/protobuf-elixir", branch: "no_underscores"},
      {:postgrex, "~> 0.15"},
      {:ranch, "~> 1.7"},
      {:jason, "~> 1.2"},
      #####
      {:credo, "~> 1.5", runtime: false, only: [:dev, :test]},
      {:dialyxir, "~> 1.0", runtime: false, only: [:dev, :test]},
      {:ex_doc, "~> 0.23", runtime: false, only: :dev}
    ]
  end

  defp docs do
    [
      main: "readme",
      # source_ref: "v#{@version}",
      source_url: @repo,
      extras: [
        "README.md": [title: "README"]
      ]
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
      "mix.exs",
      "LICENSE",
      "README.md"
    ]
  end

  defp links do
    %{
      "Github" => @repo,
      "Basilisk Wiki" => "https://github.com/skwerlman/basilisk/wiki",
      "Cockatrice Wiki" => "https://github.com/cockatrice/cockatrice/wiki"
    }
  end
end
