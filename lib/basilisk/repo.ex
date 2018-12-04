defmodule Basilisk.Repo do
  use Ecto.Repo,
    otp_app: :basilisk,
    adapter: Ecto.Adapters.Postgres
end
