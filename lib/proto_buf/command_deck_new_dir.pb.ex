defmodule Command_DeckNewDir do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          dir_name: String.t()
        }
  defstruct [:path, :dir_name]

  field :path, 1, optional: true, type: :string
  field :dir_name, 2, optional: true, type: :string
end
