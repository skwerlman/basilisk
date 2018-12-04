defmodule Response_ViewLogHistory do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          log_message: [ServerInfo_ChatMessage.t()]
        }
  defstruct [:log_message]

  field(:log_message, 1, repeated: true, type: ServerInfo_ChatMessage)
end
