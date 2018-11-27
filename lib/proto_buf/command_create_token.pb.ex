defmodule Command_CreateToken do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone: String.t(),
          card_name: String.t(),
          color: String.t(),
          pt: String.t(),
          annotation: String.t(),
          destroy_on_zone_change: boolean,
          x: integer,
          y: integer,
          target_zone: String.t(),
          target_card_id: integer
        }
  defstruct [
    :zone,
    :card_name,
    :color,
    :pt,
    :annotation,
    :destroy_on_zone_change,
    :x,
    :y,
    :target_zone,
    :target_card_id
  ]

  field :zone, 1, optional: true, type: :string
  field :card_name, 2, optional: true, type: :string
  field :color, 3, optional: true, type: :string
  field :pt, 4, optional: true, type: :string
  field :annotation, 5, optional: true, type: :string
  field :destroy_on_zone_change, 6, optional: true, type: :bool
  field :x, 7, optional: true, type: :sint32
  field :y, 8, optional: true, type: :sint32
  field :target_zone, 9, optional: true, type: :string
  field :target_card_id, 10, optional: true, type: :sint32, default: -1
end
