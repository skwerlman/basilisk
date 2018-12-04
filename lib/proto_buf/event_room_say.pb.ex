defmodule Event_RoomSay do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          message: String.t(),
          message_type: integer,
          time_of: non_neg_integer
        }
  defstruct [:name, :message, :message_type, :time_of]

  field(:name, 1, optional: true, type: :string)
  field(:message, 2, optional: true, type: :string)
  field(:message_type, 3, optional: true, type: Event_RoomSay.RoomMessageType, enum: true)
  field(:time_of, 4, optional: true, type: :uint64)
end

defmodule Event_RoomSay.RoomMessageType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field(:UserMessage, 0)
  field(:Welcome, 1)
  field(:ChatHistory, 2)
end
