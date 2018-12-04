use Mix.Config

config :basilisk,
  port: 4747,
  connection_workers: 100

# ==== DATABASE ==============================================================
# Configure the database in prod.secret.exs

# ==== LOGGING ===============================================================

log_folder = "log"
log_file_format = "$time $metadata[$level]$levelpad $message\n"
log_console_format = "$time [$level]$levelpad $message\n"

basilisk_log_name = "basilisk.prod.log"
basilisk_log_level = :info

ecto_log_name = "ecto.prod.log"
ecto_log_level = :warn

misc_log_name = "misc.prod.log"
misc_log_level = :warn

# ==== HASHING ===============================================================
#
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

# ==== OTHER STUFF ===========================================================
# You shouldn't need to change anything below here

config :logger,
  backends: [
    {FlexLogger, :basilisk_file_logger},
    {FlexLogger, :ecto_file_logger},
    {FlexLogger, :misc_file_logger},
    {FlexLogger, :console_logger}
  ]

config :logger, :basilisk_file_logger,
  logger: LoggerFileBackend,
  default_level: :off,
  level_config: [
    [application: :basilisk, module: Basilisk, level: basilisk_log_level]
  ],
  metadata: [:application, :module, :function],
  format: log_file_format,
  path: "#{log_folder}/#{basilisk_log_name}"

config :logger, :ecto_file_logger,
  logger: LoggerFileBackend,
  default_level: :off,
  level_config: [
    [application: :ecto, module: Ecto, level: ecto_log_level]
  ],
  metadata: [:application, :module, :function],
  format: log_file_format,
  path: "#{log_folder}/#{ecto_log_name}"

config :logger, :misc_file_logger,
  logger: LoggerFileBackend,
  default_level: misc_log_level,
  metadata: [:application, :module, :function],
  format: log_file_format,
  path: "#{log_folder}/#{misc_log_name}"

config :logger, :console_logger,
  logger: :console,
  default_level: misc_log_level,
  level_config: [
    [application: :basilisk, module: Basilisk, level: basilisk_log_level]
  ],
  format: log_console_format

config :argon2_elixir,
  argon2_type: 2

config :basilisk,
  ecto_repos: [Basilisk.Repo]

import_config "prod.secret.exs"
