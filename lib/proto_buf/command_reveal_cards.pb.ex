defmodule Command_RevealCards do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t(),
          card_id: integer,
          player_id: integer,
          grant_write_access: boolean,
          top_cards: integer
        }
  defstruct [:zone_name, :card_id, :player_id, :grant_write_access, :top_cards]

  field(:zone_name, 1, optional: true, type: :string)
  field(:card_id, 2, optional: true, type: :sint32, default: -1)
  field(:player_id, 3, optional: true, type: :sint32, default: -1)
  field(:grant_write_access, 4, optional: true, type: :bool)
  field(:top_cards, 5, optional: true, type: :sint32, default: -1)
end
