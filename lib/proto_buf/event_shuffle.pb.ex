defmodule Event_Shuffle do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t()
        }
  defstruct [:zone_name]

  field(:zone_name, 1, optional: true, type: :string)
end
