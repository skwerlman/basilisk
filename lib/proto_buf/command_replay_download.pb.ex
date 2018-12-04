defmodule Command_ReplayDownload do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replay_id: integer
        }
  defstruct [:replay_id]

  field(:replay_id, 1, optional: true, type: :sint32, default: -1)
end
