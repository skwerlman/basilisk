use Mix.Config

# DO NOT USE DEV MODE IN PRODUCTION!!

# Dev mode using insecure hash settings to improve the dev experience.
# These settings more or less nullify any hashing done on passwords
# Using them in production is VERY UNSAFE

config :argon2_elixir,
  t_cost: 1,
  m_cost: 8,
  parallelism: System.schedulers_online() * 2,
  argon2_type: 2
