defmodule Event_FlipCard do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t(),
          card_id: integer,
          card_name: String.t(),
          face_down: boolean
        }
  defstruct [:zone_name, :card_id, :card_name, :face_down]

  field(:zone_name, 1, optional: true, type: :string)
  field(:card_id, 2, optional: true, type: :sint32)
  field(:card_name, 3, optional: true, type: :string)
  field(:face_down, 4, optional: true, type: :bool)
end
