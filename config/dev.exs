use Mix.Config

# DO NOT USE DEV MODE IN PRODUCTION!!

# Dev mode using insecure hash settings to improve the dev experience.
# These settings more or less nullify any hashing done on passwords
# Using them in production is VERY UNSAFE

config :basilisk,
  server_name: "Fancy Dev Server",
  port: 4747,
  connection_workers: 100

# ==== DATABASE ==============================================================

config :basilisk,
  ecto_repos: [Basilisk.Repo]

config :basilisk, Basilisk.Repo,
  username: "postgres",
  password: "postgres",
  database: "basilisk_dev",
  hostname: "localhost",
  pool_size: 10

# ==== HASHING ===============================================================

config :argon2_elixir,
  t_cost: 1,
  m_cost: 8,
  parallelism: System.schedulers_online() * 2,
  argon2_type: 2

# ==== LOGGING ===============================================================

log_folder = "log"

basilisk_log_name = "basilisk.log"
basilisk_log_level = :debug

ecto_log_name = "ecto.log"
ecto_log_level = :info

other_log_name = "other.log"
other_log_level = :info

config :logger,
  backends: [
    {FlexLogger, :basilisk_file_logger},
    {FlexLogger, :ecto_file_logger},
    {FlexLogger, :misc_file_logger},
    {FlexLogger, :default_logger}
  ]

config :logger, :basilisk_file_logger,
  logger: LoggerFileBackend,
  default_level: :off,
  level_config: [
    [module: Basilisk, level: basilisk_log_level],
    [module: Basilisk.Repo, level: :off]
  ],
  metadata: [:application, :module, :function],
  format: "$time $metadata[$level]$levelpad $message\n",
  path: "#{log_folder}/#{basilisk_log_name}"

config :logger, :ecto_file_logger,
  logger: LoggerFileBackend,
  default_level: :off,
  level_config: [
    [module: Basilisk.Repo, level: ecto_log_level],
    [module: Ecto, level: ecto_log_level],
    [module: Postgrex, level: ecto_log_level],
    [message: ~r/postgrex/, level: ecto_log_level]
  ],
  metadata: [:application, :module, :function],
  format: "$time $metadata[$level]$levelpad $message\n",
  path: "#{log_folder}/#{ecto_log_name}"

config :logger, :misc_file_logger,
  logger: LoggerFileBackend,
  default_level: other_log_level,
  level_config: [
    [module: Basilisk, level: :off],
    [module: Ecto, level: :off],
    [module: Postgrex, level: :off],
    [message: ~r/postgrex/, level: :off]
  ],
  metadata: [:application, :module, :function],
  format: "$time $metadata[$level]$levelpad $message\n",
  path: "#{log_folder}/#{other_log_name}"

config :logger, :default_logger,
  logger: :console,
  default_level: other_log_level,
  level_config: [
    [application: :basilisk, module: Basilisk, level: basilisk_log_level]
  ],
  format: "$time [$level]$levelpad $message\n"
