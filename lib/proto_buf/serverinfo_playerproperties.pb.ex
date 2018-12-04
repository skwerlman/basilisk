defmodule ServerInfo_PlayerProperties do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          player_id: integer,
          user_info: ServerInfo_User.t() | nil,
          spectator: boolean,
          conceded: boolean,
          ready_start: boolean,
          deck_hash: String.t(),
          ping_seconds: integer,
          sideboard_locked: boolean
        }
  defstruct [
    :player_id,
    :user_info,
    :spectator,
    :conceded,
    :ready_start,
    :deck_hash,
    :ping_seconds,
    :sideboard_locked
  ]

  field(:player_id, 1, optional: true, type: :sint32)
  field(:user_info, 2, optional: true, type: ServerInfo_User)
  field(:spectator, 3, optional: true, type: :bool)
  field(:conceded, 4, optional: true, type: :bool)
  field(:ready_start, 5, optional: true, type: :bool)
  field(:deck_hash, 6, optional: true, type: :string)
  field(:ping_seconds, 7, optional: true, type: :sint32)
  field(:sideboard_locked, 8, optional: true, type: :bool)
end
