defmodule Command_SetSideboardLock do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          locked: boolean
        }
  defstruct [:locked]

  field(:locked, 1, optional: true, type: :bool)
end
