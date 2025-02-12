import Config

config :todo_ecto, TodoEcto.Repo,
  database: "todos",
  username: "postgres",
  password: "Post@localhost127!",
  hostname: "localhost"

config :todo_ecto, ecto_repos: [TodoEcto.Repo]
