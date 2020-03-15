defmodule Basilisk.User.Privileges do
  @moduledoc """
  A struct for containing and validating user privileges
  """
  @type t :: %{
          :admin => boolean(),
          :moderator => boolean(),
          :vip => boolean(),
          :donator => boolean()
        }
  @enforce_keys [:admin, :moderator, :vip, :donator]
  defstruct admin: false,
            moderator: false,
            vip: false,
            donator: false

  defguard is_mod(admin, moderator)
           when is_boolean(admin) and is_boolean(moderator) and (admin or moderator)

  @spec mod?(%__MODULE__{admin: boolean(), moderator: boolean()}) :: boolean()
  def mod?(%__MODULE__{admin: admin, moderator: moderator}) when is_mod(admin, moderator),
    do: true

  def mod?(%__MODULE__{admin: _, moderator: _}), do: false
end
