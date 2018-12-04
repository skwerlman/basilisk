defmodule ServerInfo_Zone do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          type: integer,
          with_coords: boolean,
          card_count: integer,
          card_list: [ServerInfo_Card.t()],
          always_reveal_top_card: boolean
        }
  defstruct [:name, :type, :with_coords, :card_count, :card_list, :always_reveal_top_card]

  field(:name, 1, optional: true, type: :string)
  field(:type, 2, optional: true, type: ServerInfo_Zone.ZoneType, enum: true)
  field(:with_coords, 3, optional: true, type: :bool)
  field(:card_count, 4, optional: true, type: :sint32)
  field(:card_list, 5, repeated: true, type: ServerInfo_Card)
  field(:always_reveal_top_card, 10, optional: true, type: :bool)
end

defmodule ServerInfo_Zone.ZoneType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field(:PrivateZone, 0)
  field(:PublicZone, 1)
  field(:HiddenZone, 2)
end
