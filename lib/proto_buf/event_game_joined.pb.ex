defmodule Event_GameJoined do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          game_info: ServerInfo_Game.t() | nil,
          game_types: [ServerInfo_GameType.t()],
          host_id: integer,
          player_id: integer,
          spectator: boolean,
          resuming: boolean
        }
  defstruct [:game_info, :game_types, :host_id, :player_id, :spectator, :resuming]

  field :game_info, 1, optional: true, type: ServerInfo_Game
  field :game_types, 2, repeated: true, type: ServerInfo_GameType
  field :host_id, 3, optional: true, type: :sint32
  field :player_id, 4, optional: true, type: :sint32
  field :spectator, 5, optional: true, type: :bool
  field :resuming, 6, optional: true, type: :bool
end
