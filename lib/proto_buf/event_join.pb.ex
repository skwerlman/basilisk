defmodule Event_Join do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          player_properties: ServerInfo_PlayerProperties.t() | nil
        }
  defstruct [:player_properties]

  field :player_properties, 1, optional: true, type: ServerInfo_PlayerProperties
end
