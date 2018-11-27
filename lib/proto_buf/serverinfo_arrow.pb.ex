defmodule ServerInfo_Arrow do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          id: integer,
          start_player_id: integer,
          start_zone: String.t(),
          start_card_id: integer,
          target_player_id: integer,
          target_zone: String.t(),
          target_card_id: integer,
          arrow_color: Color.t() | nil
        }
  defstruct [
    :id,
    :start_player_id,
    :start_zone,
    :start_card_id,
    :target_player_id,
    :target_zone,
    :target_card_id,
    :arrow_color
  ]

  field :id, 1, optional: true, type: :sint32
  field :start_player_id, 2, optional: true, type: :sint32
  field :start_zone, 3, optional: true, type: :string
  field :start_card_id, 4, optional: true, type: :sint32
  field :target_player_id, 5, optional: true, type: :sint32
  field :target_zone, 6, optional: true, type: :string
  field :target_card_id, 7, optional: true, type: :sint32
  field :arrow_color, 8, optional: true, type: Color
end
