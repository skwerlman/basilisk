defmodule Event_Leave do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          reason: integer
        }
  defstruct [:reason]

  field(:reason, 1, optional: true, type: Event_Leave.LeaveReason, enum: true)
end

defmodule Event_Leave.LeaveReason do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field(:OTHER, 1)
  field(:USER_KICKED, 2)
  field(:USER_LEFT, 3)
  field(:USER_DISCONNECTED, 4)
end
