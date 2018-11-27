defmodule Event_ConnectionClosed do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          reason: integer,
          reason_str: String.t(),
          end_time: non_neg_integer
        }
  defstruct [:reason, :reason_str, :end_time]

  field :reason, 1, optional: true, type: Event_ConnectionClosed.CloseReason, enum: true
  field :reason_str, 2, optional: true, type: :string
  field :end_time, 3, optional: true, type: :uint32
end

defmodule Event_ConnectionClosed.CloseReason do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :OTHER, 1
  field :SERVER_SHUTDOWN, 2
  field :TOO_MANY_CONNECTIONS, 3
  field :BANNED, 4
  field :USERNAMEINVALID, 5
  field :USER_LIMIT_REACHED, 6
  field :DEMOTED, 7
  field :LOGGEDINELSEWERE, 8
end
