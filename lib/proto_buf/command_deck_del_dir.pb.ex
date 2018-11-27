defmodule Command_DeckDelDir do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t()
        }
  defstruct [:path]

  field :path, 1, optional: true, type: :string
end
