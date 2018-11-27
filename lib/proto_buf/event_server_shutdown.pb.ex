defmodule Event_ServerShutdown do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          reason: String.t(),
          minutes: non_neg_integer
        }
  defstruct [:reason, :minutes]

  field :reason, 1, optional: true, type: :string
  field :minutes, 2, optional: true, type: :uint32
end
