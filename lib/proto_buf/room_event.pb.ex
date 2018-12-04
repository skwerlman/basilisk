defmodule RoomEvent do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          room_id: integer
        }
  defstruct [:room_id]

  field(:room_id, 1, optional: true, type: :sint32)
end

defmodule RoomEvent.RoomEventType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field(:LEAVE_ROOM, 1000)
  field(:JOIN_ROOM, 1001)
  field(:ROOM_SAY, 1002)
  field(:LIST_GAMES, 1003)
end
