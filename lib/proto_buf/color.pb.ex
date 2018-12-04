defmodule Color do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          r: non_neg_integer,
          g: non_neg_integer,
          b: non_neg_integer,
          a: non_neg_integer
        }
  defstruct [:r, :g, :b, :a]

  field(:r, 1, optional: true, type: :uint32)
  field(:g, 2, optional: true, type: :uint32)
  field(:b, 3, optional: true, type: :uint32)
  field(:a, 4, optional: true, type: :uint32)
end
