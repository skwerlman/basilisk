defmodule GameEventContainer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          game_id: non_neg_integer,
          event_list: [GameEvent.t()],
          context: GameEventContext.t() | nil,
          seconds_elapsed: non_neg_integer
        }
  defstruct [:game_id, :event_list, :context, :seconds_elapsed]

  field :game_id, 1, optional: true, type: :uint32
  field :event_list, 2, repeated: true, type: GameEvent
  field :context, 3, optional: true, type: GameEventContext
  field :seconds_elapsed, 4, optional: true, type: :uint32
end
