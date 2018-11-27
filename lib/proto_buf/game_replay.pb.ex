defmodule GameReplay do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replay_id: non_neg_integer,
          game_info: ServerInfo_Game.t() | nil,
          event_list: [GameEventContainer.t()],
          duration_seconds: non_neg_integer
        }
  defstruct [:replay_id, :game_info, :event_list, :duration_seconds]

  field :replay_id, 1, optional: true, type: :uint64
  field :game_info, 2, optional: true, type: ServerInfo_Game
  field :event_list, 3, repeated: true, type: GameEventContainer
  field :duration_seconds, 4, optional: true, type: :uint32
end
