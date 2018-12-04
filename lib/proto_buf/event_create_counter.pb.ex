defmodule Event_CreateCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          counter_info: ServerInfo_Counter.t() | nil
        }
  defstruct [:counter_info]

  field(:counter_info, 1, optional: true, type: ServerInfo_Counter)
end
