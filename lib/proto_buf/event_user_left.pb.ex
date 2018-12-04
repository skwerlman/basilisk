defmodule Event_UserLeft do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field(:name, 1, optional: true, type: :string)
end
