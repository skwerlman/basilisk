defmodule Command_ReadyStart do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ready: boolean
        }
  defstruct [:ready]

  field(:ready, 1, optional: true, type: :bool)
end
