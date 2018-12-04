defmodule Command_DumpZone do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          player_id: integer,
          zone_name: String.t(),
          number_cards: integer
        }
  defstruct [:player_id, :zone_name, :number_cards]

  field(:player_id, 1, optional: true, type: :sint32, default: -1)
  field(:zone_name, 2, optional: true, type: :string)
  field(:number_cards, 3, optional: true, type: :sint32)
end
