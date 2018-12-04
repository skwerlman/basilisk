defmodule Event_ServerMessage do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          message: String.t()
        }
  defstruct [:message]

  field(:message, 1, optional: true, type: :string)
end
