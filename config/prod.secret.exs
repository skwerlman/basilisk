use Mix.Config

# ==== DATABASE ==============================================================

config :basilisk, Basilisk.Repo,
  username: "postgres",
  password: "postgres",
  database: "basilisk",
  hostname: "localhost",
  port: 5432,
  pool_size: 10
