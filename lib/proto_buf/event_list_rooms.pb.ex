defmodule Event_ListRooms do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          room_list: [ServerInfo_Room.t()]
        }
  defstruct [:room_list]

  field(:room_list, 1, repeated: true, type: ServerInfo_Room)
end
