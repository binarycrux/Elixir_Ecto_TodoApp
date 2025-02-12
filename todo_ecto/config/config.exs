import Config

config :todo_ecto, TodoEcto.Repo,
  database: "todos",
  username: "your-username",
  password: "your-password",
  hostname: "localhost"

config :todo_ecto, ecto_repos: [TodoEcto.Repo]
