defmodule CardToMove do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          card_id: integer,
          face_down: boolean,
          pt: String.t(),
          tapped: boolean
        }
  defstruct [:card_id, :face_down, :pt, :tapped]

  field :card_id, 1, optional: true, type: :sint32, default: -1
  field :face_down, 2, optional: true, type: :bool
  field :pt, 3, optional: true, type: :string
  field :tapped, 4, optional: true, type: :bool
end

defmodule ListOfCardsToMove do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          card: [CardToMove.t()]
        }
  defstruct [:card]

  field :card, 1, repeated: true, type: CardToMove
end

defmodule Command_MoveCard do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          start_player_id: integer,
          start_zone: String.t(),
          cards_to_move: ListOfCardsToMove.t() | nil,
          target_player_id: integer,
          target_zone: String.t(),
          x: integer,
          y: integer
        }
  defstruct [
    :start_player_id,
    :start_zone,
    :cards_to_move,
    :target_player_id,
    :target_zone,
    :x,
    :y
  ]

  field :start_player_id, 1, optional: true, type: :sint32, default: -1
  field :start_zone, 2, optional: true, type: :string
  field :cards_to_move, 3, optional: true, type: ListOfCardsToMove
  field :target_player_id, 4, optional: true, type: :sint32, default: -1
  field :target_zone, 5, optional: true, type: :string
  field :x, 6, optional: true, type: :sint32, default: -1
  field :y, 7, optional: true, type: :sint32, default: -1
end
