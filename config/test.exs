use Mix.Config

config :argon2_elixir,
  t_cost: 1,
  m_cost: 8,
  parallelism: System.schedulers_online() * 2,
  argon2_type: 2
