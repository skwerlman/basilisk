defmodule Command_FlipCard do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone: String.t(),
          card_id: integer,
          face_down: boolean,
          pt: String.t()
        }
  defstruct [:zone, :card_id, :face_down, :pt]

  field(:zone, 1, optional: true, type: :string)
  field(:card_id, 2, optional: true, type: :sint32, default: -1)
  field(:face_down, 3, optional: true, type: :bool)
  field(:pt, 4, optional: true, type: :string)
end
