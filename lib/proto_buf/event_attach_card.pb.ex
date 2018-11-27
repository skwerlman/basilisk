defmodule Event_AttachCard do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          start_zone: String.t(),
          card_id: integer,
          target_player_id: integer,
          target_zone: String.t(),
          target_card_id: integer
        }
  defstruct [:start_zone, :card_id, :target_player_id, :target_zone, :target_card_id]

  field :start_zone, 1, optional: true, type: :string
  field :card_id, 2, optional: true, type: :sint32
  field :target_player_id, 3, optional: true, type: :sint32
  field :target_zone, 4, optional: true, type: :string
  field :target_card_id, 5, optional: true, type: :sint32
end
