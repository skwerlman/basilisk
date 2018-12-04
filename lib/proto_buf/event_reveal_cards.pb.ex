defmodule Event_RevealCards do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t(),
          card_id: integer,
          other_player_id: integer,
          cards: [ServerInfo_Card.t()],
          grant_write_access: boolean
        }
  defstruct [:zone_name, :card_id, :other_player_id, :cards, :grant_write_access]

  field(:zone_name, 1, optional: true, type: :string)
  field(:card_id, 2, optional: true, type: :sint32, default: -1)
  field(:other_player_id, 3, optional: true, type: :sint32, default: -1)
  field(:cards, 4, repeated: true, type: ServerInfo_Card)
  field(:grant_write_access, 5, optional: true, type: :bool)
end
