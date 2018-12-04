defmodule ServerInfo_User do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          user_level: non_neg_integer,
          address: String.t(),
          real_name: String.t(),
          gender: integer,
          country: String.t(),
          avatar_bmp: String.t(),
          id: integer,
          server_id: integer,
          session_id: non_neg_integer,
          accountage_secs: non_neg_integer,
          email: String.t(),
          clientid: String.t(),
          privlevel: String.t()
        }
  defstruct [
    :name,
    :user_level,
    :address,
    :real_name,
    :gender,
    :country,
    :avatar_bmp,
    :id,
    :server_id,
    :session_id,
    :accountage_secs,
    :email,
    :clientid,
    :privlevel
  ]

  field(:name, 1, optional: true, type: :string)
  field(:user_level, 2, optional: true, type: :uint32)
  field(:address, 3, optional: true, type: :string)
  field(:real_name, 4, optional: true, type: :string)

  field(:gender, 5,
    optional: true,
    type: ServerInfo_User.Gender,
    default: :GenderUnknown,
    enum: true
  )

  field(:country, 6, optional: true, type: :string)
  field(:avatar_bmp, 7, optional: true, type: :bytes)
  field(:id, 8, optional: true, type: :sint32, default: -1)
  field(:server_id, 9, optional: true, type: :sint32, default: -1)
  field(:session_id, 10, optional: true, type: :uint64)
  field(:accountage_secs, 11, optional: true, type: :uint64)
  field(:email, 12, optional: true, type: :string)
  field(:clientid, 13, optional: true, type: :string)
  field(:privlevel, 14, optional: true, type: :string)
end

defmodule ServerInfo_User.UserLevelFlag do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field(:IsNothing, 0)
  field(:IsUser, 1)
  field(:IsRegistered, 2)
  field(:IsModerator, 4)
  field(:IsAdmin, 8)
end

defmodule ServerInfo_User.Gender do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field(:GenderUnknown, -1)
  field(:Male, 0)
  field(:Female, 1)
end
