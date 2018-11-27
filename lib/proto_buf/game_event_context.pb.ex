defmodule GameEventContext do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule GameEventContext.ContextType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :READY_START, 1000
  field :CONCEDE, 1001
  field :DECK_SELECT, 1002
  field :UNDO_DRAW, 1003
  field :MOVE_CARD, 1004
  field :MULLIGAN, 1005
  field :PING_CHANGED, 1006
  field :CONNECTION_STATE_CHANGED, 1007
  field :SET_SIDEBOARD_LOCK, 1008
end
