defmodule RoomCommand do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule RoomCommand.RoomCommandType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field(:LEAVE_ROOM, 1000)
  field(:ROOM_SAY, 1001)
  field(:CREATE_GAME, 1002)
  field(:JOIN_GAME, 1003)
end

defmodule Command_LeaveRoom do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Command_RoomSay do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          message: String.t()
        }
  defstruct [:message]

  field(:message, 1, optional: true, type: :string)
end

defmodule Command_CreateGame do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          description: String.t(),
          password: String.t(),
          max_players: non_neg_integer,
          only_buddies: boolean,
          only_registered: boolean,
          spectators_allowed: boolean,
          spectators_need_password: boolean,
          spectators_can_talk: boolean,
          spectators_see_everything: boolean,
          game_type_ids: [non_neg_integer]
        }
  defstruct [
    :description,
    :password,
    :max_players,
    :only_buddies,
    :only_registered,
    :spectators_allowed,
    :spectators_need_password,
    :spectators_can_talk,
    :spectators_see_everything,
    :game_type_ids
  ]

  field(:description, 1, optional: true, type: :string)
  field(:password, 2, optional: true, type: :string)
  field(:max_players, 3, optional: true, type: :uint32)
  field(:only_buddies, 4, optional: true, type: :bool)
  field(:only_registered, 5, optional: true, type: :bool)
  field(:spectators_allowed, 6, optional: true, type: :bool)
  field(:spectators_need_password, 7, optional: true, type: :bool)
  field(:spectators_can_talk, 8, optional: true, type: :bool)
  field(:spectators_see_everything, 9, optional: true, type: :bool)
  field(:game_type_ids, 10, repeated: true, type: :uint32)
end

defmodule Command_JoinGame do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          game_id: integer,
          password: String.t(),
          spectator: boolean,
          override_restrictions: boolean
        }
  defstruct [:game_id, :password, :spectator, :override_restrictions]

  field(:game_id, 1, optional: true, type: :sint32, default: -1)
  field(:password, 2, optional: true, type: :string)
  field(:spectator, 3, optional: true, type: :bool)
  field(:override_restrictions, 4, optional: true, type: :bool)
end
