defmodule Basilisk.User do
  @moduledoc false
  @type t :: %{
          :active => boolean(),
          :avatar_bmp => binary() | nil,
          :country => String.t() | nil,
          :email => String.t() | nil,
          :known_client_ids => list(String.t()),
          :password_blake2b => binary() | nil,
          :privileges => Basilisk.User.Privileges.t(),
          :real_name => String.t() | nil,
          :registration_date => DateTime.t() | nil,
          :username => String.t() | nil
        }

  defstruct active: false,
            avatar_bmp: nil,
            country: nil,
            email: nil,
            known_client_ids: [],
            password_sha512: nil,
            privileges: %Basilisk.User.Privileges{},
            real_name: nil,
            registration_date: nil,
            username: nil
end
