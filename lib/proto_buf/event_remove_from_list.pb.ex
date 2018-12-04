defmodule Event_RemoveFromList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          list_name: String.t(),
          user_name: String.t()
        }
  defstruct [:list_name, :user_name]

  field(:list_name, 1, optional: true, type: :string)
  field(:user_name, 2, optional: true, type: :string)
end
