defmodule TodoEcto.Repo do
  use Ecto.Repo,
    otp_app: :todo_ecto,
    adapter: Ecto.Adapters.Postgres
end
