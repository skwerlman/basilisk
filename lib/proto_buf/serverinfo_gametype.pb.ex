defmodule ServerInfo_GameType do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          game_type_id: integer,
          description: String.t()
        }
  defstruct [:game_type_id, :description]

  field(:game_type_id, 1, optional: true, type: :sint32)
  field(:description, 2, optional: true, type: :string)
end
