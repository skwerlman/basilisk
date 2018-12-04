defmodule MoveCard_ToZone do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          card_name: String.t(),
          start_zone: String.t(),
          target_zone: String.t()
        }
  defstruct [:card_name, :start_zone, :target_zone]

  field(:card_name, 1, optional: true, type: :string)
  field(:start_zone, 2, optional: true, type: :string)
  field(:target_zone, 3, optional: true, type: :string)
end
