defmodule Event_ServerIdentification do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          server_name: String.t(),
          server_version: String.t(),
          protocol_version: non_neg_integer
        }
  defstruct [:server_name, :server_version, :protocol_version]

  field :server_name, 1, optional: true, type: :string
  field :server_version, 2, optional: true, type: :string
  field :protocol_version, 3, optional: true, type: :uint32
end
