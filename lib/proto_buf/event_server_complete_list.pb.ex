defmodule Event_ServerCompleteList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          server_id: non_neg_integer,
          user_list: [ServerInfo_User.t()],
          room_list: [ServerInfo_Room.t()]
        }
  defstruct [:server_id, :user_list, :room_list]

  field :server_id, 1, optional: true, type: :uint32
  field :user_list, 2, repeated: true, type: ServerInfo_User
  field :room_list, 3, repeated: true, type: ServerInfo_Room
end
