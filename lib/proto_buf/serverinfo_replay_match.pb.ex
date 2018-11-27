defmodule ServerInfo_ReplayMatch do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replay_list: [ServerInfo_Replay.t()],
          game_id: integer,
          room_name: String.t(),
          time_started: non_neg_integer,
          length: non_neg_integer,
          game_name: String.t(),
          player_names: [String.t()],
          do_not_hide: boolean
        }
  defstruct [
    :replay_list,
    :game_id,
    :room_name,
    :time_started,
    :length,
    :game_name,
    :player_names,
    :do_not_hide
  ]

  field :replay_list, 1, repeated: true, type: ServerInfo_Replay
  field :game_id, 2, optional: true, type: :sint32, default: -1
  field :room_name, 3, optional: true, type: :string
  field :time_started, 4, optional: true, type: :uint32
  field :length, 5, optional: true, type: :uint32
  field :game_name, 6, optional: true, type: :string
  field :player_names, 7, repeated: true, type: :string
  field :do_not_hide, 8, optional: true, type: :bool
end
