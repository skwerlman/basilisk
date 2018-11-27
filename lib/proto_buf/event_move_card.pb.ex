defmodule Event_MoveCard do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          card_id: integer,
          card_name: String.t(),
          start_player_id: integer,
          start_zone: String.t(),
          position: integer,
          target_player_id: integer,
          target_zone: String.t(),
          x: integer,
          y: integer,
          new_card_id: integer,
          face_down: boolean
        }
  defstruct [
    :card_id,
    :card_name,
    :start_player_id,
    :start_zone,
    :position,
    :target_player_id,
    :target_zone,
    :x,
    :y,
    :new_card_id,
    :face_down
  ]

  field :card_id, 1, optional: true, type: :sint32, default: -1
  field :card_name, 2, optional: true, type: :string
  field :start_player_id, 3, optional: true, type: :sint32, default: -1
  field :start_zone, 4, optional: true, type: :string
  field :position, 5, optional: true, type: :sint32, default: -1
  field :target_player_id, 6, optional: true, type: :sint32, default: -1
  field :target_zone, 7, optional: true, type: :string
  field :x, 8, optional: true, type: :sint32, default: -1
  field :y, 9, optional: true, type: :sint32, default: -1
  field :new_card_id, 10, optional: true, type: :sint32, default: -1
  field :face_down, 11, optional: true, type: :bool
end
