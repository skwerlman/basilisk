defmodule ServerInfo_Card do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          x: integer,
          y: integer,
          face_down: boolean,
          tapped: boolean,
          attacking: boolean,
          color: String.t(),
          pt: String.t(),
          annotation: String.t(),
          destroy_on_zone_change: boolean,
          doesnt_untap: boolean,
          counter_list: [ServerInfo_CardCounter.t()],
          attach_player_id: integer,
          attach_zone: String.t(),
          attach_card_id: integer
        }
  defstruct [
    :id,
    :name,
    :x,
    :y,
    :face_down,
    :tapped,
    :attacking,
    :color,
    :pt,
    :annotation,
    :destroy_on_zone_change,
    :doesnt_untap,
    :counter_list,
    :attach_player_id,
    :attach_zone,
    :attach_card_id
  ]

  field :id, 1, optional: true, type: :sint32, default: -1
  field :name, 2, optional: true, type: :string
  field :x, 3, optional: true, type: :sint32, default: -1
  field :y, 4, optional: true, type: :sint32, default: -1
  field :face_down, 5, optional: true, type: :bool
  field :tapped, 6, optional: true, type: :bool
  field :attacking, 7, optional: true, type: :bool
  field :color, 8, optional: true, type: :string
  field :pt, 9, optional: true, type: :string
  field :annotation, 10, optional: true, type: :string
  field :destroy_on_zone_change, 11, optional: true, type: :bool
  field :doesnt_untap, 12, optional: true, type: :bool
  field :counter_list, 13, repeated: true, type: ServerInfo_CardCounter
  field :attach_player_id, 14, optional: true, type: :sint32, default: -1
  field :attach_zone, 15, optional: true, type: :string
  field :attach_card_id, 16, optional: true, type: :sint32, default: -1
end
