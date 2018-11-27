defmodule Command_CreateCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          counter_name: String.t(),
          counter_color: Color.t() | nil,
          radius: non_neg_integer,
          value: integer
        }
  defstruct [:counter_name, :counter_color, :radius, :value]

  field :counter_name, 1, optional: true, type: :string
  field :counter_color, 2, optional: true, type: Color
  field :radius, 3, optional: true, type: :uint32
  field :value, 4, optional: true, type: :sint32
end
