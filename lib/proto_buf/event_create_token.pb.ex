defmodule Event_CreateToken do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t(),
          card_id: integer,
          card_name: String.t(),
          color: String.t(),
          pt: String.t(),
          annotation: String.t(),
          destroy_on_zone_change: boolean,
          x: integer,
          y: integer
        }
  defstruct [
    :zone_name,
    :card_id,
    :card_name,
    :color,
    :pt,
    :annotation,
    :destroy_on_zone_change,
    :x,
    :y
  ]

  field :zone_name, 1, optional: true, type: :string
  field :card_id, 2, optional: true, type: :sint32
  field :card_name, 3, optional: true, type: :string
  field :color, 4, optional: true, type: :string
  field :pt, 5, optional: true, type: :string
  field :annotation, 6, optional: true, type: :string
  field :destroy_on_zone_change, 7, optional: true, type: :bool
  field :x, 8, optional: true, type: :sint32
  field :y, 9, optional: true, type: :sint32
end
