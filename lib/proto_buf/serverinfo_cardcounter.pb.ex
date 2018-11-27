defmodule ServerInfo_CardCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          id: integer,
          value: integer
        }
  defstruct [:id, :value]

  field :id, 1, optional: true, type: :sint32
  field :value, 2, optional: true, type: :sint32
end
