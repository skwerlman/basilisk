defmodule ServerInfo_Room do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          room_id: integer,
          name: String.t(),
          description: String.t(),
          game_count: non_neg_integer,
          player_count: non_neg_integer,
          auto_join: boolean,
          game_list: [ServerInfo_Game.t()],
          user_list: [ServerInfo_User.t()],
          gametype_list: [ServerInfo_GameType.t()],
          permissionlevel: String.t(),
          privilegelevel: String.t()
        }
  defstruct [
    :room_id,
    :name,
    :description,
    :game_count,
    :player_count,
    :auto_join,
    :game_list,
    :user_list,
    :gametype_list,
    :permissionlevel,
    :privilegelevel
  ]

  field :room_id, 1, optional: true, type: :sint32
  field :name, 2, optional: true, type: :string
  field :description, 3, optional: true, type: :string
  field :game_count, 4, optional: true, type: :uint32
  field :player_count, 5, optional: true, type: :uint32
  field :auto_join, 6, optional: true, type: :bool
  field :game_list, 7, repeated: true, type: ServerInfo_Game
  field :user_list, 8, repeated: true, type: ServerInfo_User
  field :gametype_list, 9, repeated: true, type: ServerInfo_GameType
  field :permissionlevel, 10, optional: true, type: :string
  field :privilegelevel, 11, optional: true, type: :string
end
