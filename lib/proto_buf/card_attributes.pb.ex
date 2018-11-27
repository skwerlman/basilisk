defmodule CardAttribute do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :AttrTapped, 1
  field :AttrAttacking, 2
  field :AttrFaceDown, 3
  field :AttrColor, 4
  field :AttrPT, 5
  field :AttrAnnotation, 6
  field :AttrDoesntUntap, 7
end
