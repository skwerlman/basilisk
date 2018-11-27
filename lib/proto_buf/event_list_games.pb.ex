defmodule Event_ListGames do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          game_list: [ServerInfo_Game.t()]
        }
  defstruct [:game_list]

  field :game_list, 1, repeated: true, type: ServerInfo_Game
end
