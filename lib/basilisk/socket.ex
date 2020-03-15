defmodule Basilisk.Socket do
  @moduledoc """
  A `:ranch` supervisor to handle incoming connections
  """
  require Logger

  def start_link do
    port = Application.get_env(:basilisk, :port, 4747)
    acceptors = Application.get_env(:basilisk, :connection_workers, 100)
    _ = Logger.info(fn -> "starting server on port :#{inspect(port)}" end)

    opts = [
      port: port,
      keepalive: true
    ]

    :ranch.start_listener(
      Basilisk.Socket.Pool,
      acceptors,
      # NOTE
      # if cockatrice ever implements ssl support,
      # change this to :ranch_ssl
      :ranch_tcp,
      opts,
      Basilisk.Socket.Handler,
      []
    )
  end

  def child_spec(_arg) do
    %{
      id: Basilisk.Socket,
      start: {Basilisk.Socket, :start_link, []}
    }
  end
end
