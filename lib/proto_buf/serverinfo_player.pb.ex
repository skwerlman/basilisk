defmodule ServerInfo_Player do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          properties: ServerInfo_PlayerProperties.t() | nil,
          deck_list: String.t(),
          zone_list: [ServerInfo_Zone.t()],
          counter_list: [ServerInfo_Counter.t()],
          arrow_list: [ServerInfo_Arrow.t()]
        }
  defstruct [:properties, :deck_list, :zone_list, :counter_list, :arrow_list]

  field :properties, 1, optional: true, type: ServerInfo_PlayerProperties
  field :deck_list, 2, optional: true, type: :string
  field :zone_list, 3, repeated: true, type: ServerInfo_Zone
  field :counter_list, 4, repeated: true, type: ServerInfo_Counter
  field :arrow_list, 5, repeated: true, type: ServerInfo_Arrow
end
