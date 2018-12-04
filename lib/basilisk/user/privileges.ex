defmodule Basilisk.User.Privileges do
  @moduledoc false
  @type t :: %{
          :admin => boolean(),
          :moderator => boolean(),
          :vip => boolean(),
          :donator => boolean()
        }
  defstruct admin: false,
            moderator: false,
            vip: false,
            donator: false
end
