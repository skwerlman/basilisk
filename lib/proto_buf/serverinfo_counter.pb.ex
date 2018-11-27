defmodule ServerInfo_Counter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          counter_color: Color.t() | nil,
          radius: integer,
          count: integer
        }
  defstruct [:id, :name, :counter_color, :radius, :count]

  field :id, 1, optional: true, type: :sint32
  field :name, 2, optional: true, type: :string
  field :counter_color, 3, optional: true, type: Color
  field :radius, 4, optional: true, type: :sint32
  field :count, 5, optional: true, type: :sint32
end
