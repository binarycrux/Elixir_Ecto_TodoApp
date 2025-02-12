defmodule TodoEcto.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
create table(:tasks) do
  add :name, :string
  add :status, :string, default: "Pending", null: false
  timestamps()
end
  end
end
