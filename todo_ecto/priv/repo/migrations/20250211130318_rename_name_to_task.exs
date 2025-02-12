defmodule TodoEcto.Repo.Migrations.RenameNameToTask do
  use Ecto.Migration

  def change do
rename table(:tasks), :name, to: :task
  end
end
