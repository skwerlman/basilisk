defmodule Command_StopDumpZone do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          player_id: integer,
          zone_name: String.t()
        }
  defstruct [:player_id, :zone_name]

  field(:player_id, 1, optional: true, type: :sint32)
  field(:zone_name, 2, optional: true, type: :string)
end
