defmodule Basilisk.Client do
  @moduledoc """
  A `DynamicSupervisor` to oversee all of a server's clients, as well as a struct to hold session info
  """
  use DynamicSupervisor
  alias Basilisk.Client.Session
  alias Basilisk.User
  require Logger

  @typedoc """
  Contains information about a client connection.

  `:session` defaults to an empty `Basilisk.Client.Session`

  Enforced keys:
    - `:ip_address`
  """
  @type t() :: %__MODULE__{
          :account => Basilisk.User.t() | nil,
          :session => Basilisk.Client.Session.t(),
          :ip_address => :inet.ip_address()
        }

  @enforce_keys [:ip_address]
  defstruct account: %User{}, session: %Session{}, ip_address: nil

  @spec start_link(term()) :: Supervisor.on_start()
  def start_link(arg) do
    DynamicSupervisor.start_link(__MODULE__, arg, name: Basilisk.ClientSupervisor)
  end

  @impl DynamicSupervisor
  def init(_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  @doc """
  Starts a new client process

  A struct containing everything we know about the client and their session is
  used to initialize the process.
  """
  @spec new(client :: t()) :: pid() | :failed
  def new(client) do
    res = DynamicSupervisor.start_child(Basilisk.ClientSupervisor, {Basilisk.Client, client})

    case res do
      {:ok, pid} ->
        pid

      {:ok, pid, _info} ->
        pid

      :ignore ->
        _ = Logger.warn("unexpected :ignore from new client")
        :failed

      {:error, reason} ->
        _ = Logger.error("failed to start client: #{reason}")
        :failed
    end
  end
end
