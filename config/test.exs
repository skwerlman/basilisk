use Mix.Config

config :basilisk,
  port: 4747,
  connection_workers: 100

config :basilisk,
  ecto_repos: [Basilisk.Repo]

config :basilisk, Basilisk.Repo,
  username: "postgres",
  password: "postgres",
  database: "basilisk_test",
  hostname: "localhost",
  pool_size: 10

config :argon2_elixir,
  t_cost: 1,
  m_cost: 8,
  parallelism: System.schedulers_online() * 2,
  argon2_type: 2
