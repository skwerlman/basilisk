defmodule Basilisk.Socket do
  @moduledoc """
  A `:ranch` supervisor to handle incoming connections
  """
  require Logger

  @spec start_link() :: {:ok, pid()} | {:error, any()}
  def start_link do
    port = Application.get_env(:basilisk, :port, 4747)
    acceptors = Application.get_env(:basilisk, :connection_workers, 100)
    _ = Logger.info(fn -> "starting server on port :#{inspect(port)}" end)

    opts = %{
      socket_opts: [
        port: port,
        keepalive: true
      ],
      num_acceptors: acceptors
    }

    :ranch.start_listener(
      Basilisk.Socket.Pool,
      # NOTE
      # trice clients can connect over ssl
      # this should be made configurable to :ranch_ssl
      :ranch_tcp,
      opts,
      Basilisk.Socket.Handler,
      []
    )
  end

  @spec child_spec(any()) :: %{
          id: Basilisk.Socket,
          start: {Basilisk.Socket, :start_link, []}
        }
  def child_spec(_arg) do
    %{
      id: Basilisk.Socket,
      start: {Basilisk.Socket, :start_link, []}
    }
  end
end
