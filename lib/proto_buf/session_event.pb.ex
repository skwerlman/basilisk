defmodule SessionEvent do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule SessionEvent.SessionEventType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :SERVER_IDENTIFICATION, 500
  field :SERVER_COMPLETE_LIST, 600
  field :SERVER_MESSAGE, 1000
  field :SERVER_SHUTDOWN, 1001
  field :CONNECTION_CLOSED, 1002
  field :USER_MESSAGE, 1003
  field :LIST_ROOMS, 1004
  field :ADD_TO_LIST, 1005
  field :REMOVE_FROM_LIST, 1006
  field :USER_JOINED, 1007
  field :USER_LEFT, 1008
  field :GAME_JOINED, 1009
  field :NOTIFY_USER, 1010
  field :REPLAY_ADDED, 1100
end
