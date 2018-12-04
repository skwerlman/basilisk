defmodule Basilisk.Socket.Handler do
  @moduledoc false
  require Logger
  use GenServer
  @behaviour :ranch_protocol

  @protocol_version 14

  @impl :ranch_protocol
  def start_link(ref, socket, transport, _opts) do
    pid = :proc_lib.spawn_link(__MODULE__, :init, [ref, socket, transport])
    {:ok, pid}
  end

  @impl GenServer
  def init({ref, _socket, transport}) do
    {:ok, socket} = :ranch.handshake(ref)
    :ok = transport.setopts(socket, [{:active, true}])
    :gen_server.enter_loop(__MODULE__, [], %{socket: socket, transport: transport})
  end

  def init(ref, socket, transport) do
    init({ref, socket, transport})
  end

  @impl GenServer
  def handle_info({:tcp, socket, <<0, 0, 0, 0>>}, state = %{socket: socket, transport: transport}) do
    # transport.send(socket, "<?xml version=\"1.0\"?><cockatrice_server_stream version=\"#{@protocol_version}\">")

    server_id =
      %Event_ServerIdentification{
        server_name: Basilisk.server_name(),
        server_version: "basilisk-v#{Basilisk.version()}",
        protocol_version: @protocol_version
      }
      |> Protobuf.encode()

    transport.send(socket, server_id)
    {:noreply, state}
  end

  def handle_info({:tcp, socket, data}, state = %{socket: socket, transport: transport}) do
    # command = Protobuf.decode(data)
    _ = Logger.warn(inspect(data))
    # transport.send(socket, data)
    {:noreply, state}
  end

  def handle_info({:tcp_closed, socket}, state = %{socket: socket, transport: transport}) do
    IO.puts("Closing")
    transport.close(socket)
    {:stop, :normal, state}
  end
end
