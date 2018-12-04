defmodule Event_UserMessage do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          sender_name: String.t(),
          receiver_name: String.t(),
          message: String.t()
        }
  defstruct [:sender_name, :receiver_name, :message]

  field(:sender_name, 1, optional: true, type: :string)
  field(:receiver_name, 2, optional: true, type: :string)
  field(:message, 3, optional: true, type: :string)
end
