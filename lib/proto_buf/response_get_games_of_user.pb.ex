defmodule Response_GetGamesOfUser do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          room_list: [ServerInfo_Room.t()],
          game_list: [ServerInfo_Game.t()]
        }
  defstruct [:room_list, :game_list]

  field :room_list, 1, repeated: true, type: ServerInfo_Room
  field :game_list, 2, repeated: true, type: ServerInfo_Game
end
