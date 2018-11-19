defmodule BasiliskTest do
  use ExUnit.Case
  doctest Basilisk

  test "greets the world" do
    assert Basilisk.hello() == :world
  end
end
