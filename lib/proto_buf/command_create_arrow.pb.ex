defmodule Command_CreateArrow do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          start_player_id: integer,
          start_zone: String.t(),
          start_card_id: integer,
          target_player_id: integer,
          target_zone: String.t(),
          target_card_id: integer,
          arrow_color: Color.t() | nil
        }
  defstruct [
    :start_player_id,
    :start_zone,
    :start_card_id,
    :target_player_id,
    :target_zone,
    :target_card_id,
    :arrow_color
  ]

  field(:start_player_id, 1, optional: true, type: :sint32, default: -1)
  field(:start_zone, 2, optional: true, type: :string)
  field(:start_card_id, 3, optional: true, type: :sint32, default: -1)
  field(:target_player_id, 4, optional: true, type: :sint32, default: -1)
  field(:target_zone, 5, optional: true, type: :string)
  field(:target_card_id, 6, optional: true, type: :sint32, default: -1)
  field(:arrow_color, 7, optional: true, type: Color)
end
