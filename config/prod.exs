use Mix.Config

# YOU MUST CHANGE THESE
#
# Set parallelism to double the number of cores on your machine
# Higher values for t_cost and m_cost are more secure, but slower
#
# For more info on what the parameters mean and how to choose good values, see
# https://hexdocs.pm/argon2_elixir/Argon2.Stats.html#content
#
# The defaults are configured for an i7-4770k@3.5GHz, targeting 400ms
#
# You can check the timing of various parameters using
# Comeonin.Argon2.report([argon2_type: 2, t_cost: 5, m_cost: 18, parallelism: 16])
# in iex
config :argon2_elixir,
  t_cost: 5,
  m_cost: 18,
  parallelism: 16

# You shouldn't need to change anything below here

config :argon2_elixir,
  argon2_type: 2

import_config "prod.secret.exs"
