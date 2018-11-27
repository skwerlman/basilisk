defmodule Event_GameStateChanged do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          player_list: [ServerInfo_Player.t()],
          game_started: boolean,
          active_player_id: integer,
          active_phase: integer,
          seconds_elapsed: non_neg_integer
        }
  defstruct [:player_list, :game_started, :active_player_id, :active_phase, :seconds_elapsed]

  field :player_list, 1, repeated: true, type: ServerInfo_Player
  field :game_started, 2, optional: true, type: :bool
  field :active_player_id, 3, optional: true, type: :sint32
  field :active_phase, 4, optional: true, type: :sint32
  field :seconds_elapsed, 5, optional: true, type: :uint32
end
