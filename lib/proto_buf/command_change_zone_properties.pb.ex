defmodule Command_ChangeZoneProperties do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t(),
          always_reveal_top_card: boolean
        }
  defstruct [:zone_name, :always_reveal_top_card]

  field(:zone_name, 1, optional: true, type: :string)
  field(:always_reveal_top_card, 10, optional: true, type: :bool)
end
