defmodule Response_JoinRoom do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          room_info: ServerInfo_Room.t() | nil
        }
  defstruct [:room_info]

  field :room_info, 1, optional: true, type: ServerInfo_Room
end
