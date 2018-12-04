defmodule ServerInfo_Game do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          server_id: integer,
          room_id: integer,
          game_id: integer,
          description: String.t(),
          with_password: boolean,
          max_players: non_neg_integer,
          game_types: [integer],
          creator_info: ServerInfo_User.t() | nil,
          only_buddies: boolean,
          only_registered: boolean,
          spectators_allowed: boolean,
          spectators_need_password: boolean,
          spectators_can_chat: boolean,
          spectators_omniscient: boolean,
          player_count: non_neg_integer,
          spectators_count: non_neg_integer,
          started: boolean,
          start_time: non_neg_integer,
          closed: boolean
        }
  defstruct [
    :server_id,
    :room_id,
    :game_id,
    :description,
    :with_password,
    :max_players,
    :game_types,
    :creator_info,
    :only_buddies,
    :only_registered,
    :spectators_allowed,
    :spectators_need_password,
    :spectators_can_chat,
    :spectators_omniscient,
    :player_count,
    :spectators_count,
    :started,
    :start_time,
    :closed
  ]

  field(:server_id, 1, optional: true, type: :sint32, default: -1)
  field(:room_id, 2, optional: true, type: :sint32, default: -1)
  field(:game_id, 3, optional: true, type: :sint32, default: -1)
  field(:description, 4, optional: true, type: :string)
  field(:with_password, 5, optional: true, type: :bool)
  field(:max_players, 6, optional: true, type: :uint32)
  field(:game_types, 7, repeated: true, type: :sint32)
  field(:creator_info, 8, optional: true, type: ServerInfo_User)
  field(:only_buddies, 9, optional: true, type: :bool)
  field(:only_registered, 10, optional: true, type: :bool)
  field(:spectators_allowed, 11, optional: true, type: :bool)
  field(:spectators_need_password, 12, optional: true, type: :bool)
  field(:spectators_can_chat, 13, optional: true, type: :bool)
  field(:spectators_omniscient, 14, optional: true, type: :bool)
  field(:player_count, 30, optional: true, type: :uint32)
  field(:spectators_count, 31, optional: true, type: :uint32)
  field(:started, 50, optional: true, type: :bool)
  field(:start_time, 51, optional: true, type: :uint32)
  field(:closed, 52, optional: true, type: :bool)
end
