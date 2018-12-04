defmodule Basilisk.Client do
  @moduledoc false
  alias Basilisk.Client.Session
  alias Basilisk.User
  require Logger
  use DynamicSupervisor

  @typedoc """
  Contains information about a client connection.

  `:state` defaults to an empty `Basilisk.Client.State`

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

  def start_link(arg) do
    DynamicSupervisor.start_link(__MODULE__, arg, name: Basilisk.ClientSupervisor)
  end

  @impl true
  def init(_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

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