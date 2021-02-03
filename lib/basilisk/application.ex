defmodule Basilisk.Application do
  @moduledoc """
  The main module for the Basilisk application

  The module starts up in 2 phases: `:init` and `:ready`.

  During the `:init` phase, the client, room, server, and repo supervisors
  are started.

  In the `:ready` phase, the socket supervisor is started, and the application
  begins accepting connections.

  NOTE: In future versions with multi-server support, a third phase will happen
  between `:init` and `:ready`, called `:sync`. This phase will handle connecting
  to any existsing nodes, and early synchronisation of server state.
  """

  use Application
  require Logger

  @impl Application
  def start(_type, _args) do
    children = []
    opts = [strategy: :one_for_one, name: Basilisk.Supervisor]

    Supervisor.start_link(children, opts)
  end

  @impl Application
  def start_phase(:init, _type, _args) do
    start_supervised_child!(Basilisk.Client)
    # start_supervised_child!(Basilisk.Repo)
  end

  def start_phase(:ready, _type, _args) do
    start_supervised_child!(Basilisk.Socket)
  end

  defp start_supervised_child!(child_spec) do
    case Supervisor.start_child(Basilisk.Supervisor, child_spec) do
      {:ok, _} ->
        :ok

      {:error, reason} ->
        Logger.error(inspect(reason))
        raise inspect(reason)
    end
  end
end
