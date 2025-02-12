defmodule TodoEcto.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :task, :string
    field :status, :string, default: "Pending"
    timestamps()
  end
  def changeset(task, params) do
    task
    |> cast(params, [:task])
    |> validate_required([:task])
    # |>  validate_inclusion(:status, ["Pending", "Done"])
    end
end
