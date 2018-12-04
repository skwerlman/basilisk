defmodule Basilisk.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

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
      {:ok, _} -> :ok
      {:error, reason} -> raise reason
    end
  end
end
