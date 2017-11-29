defmodule CallThru.Repo.Migrations.CreateCalls do
  use Ecto.Migration

  def change do
    create table(:calls) do
      add :origin, :string
      add :term, :string

      add :success, :boolean, default: false

      add :finish, :naive_datetime

      timestamps()
    end

    create index(:calls, [:origin])
    create index(:calls, [:term])

    alter table(:lines) do
      add :call_id, references(:calls, on_delete: :nilify_all)
    end

    create index(:lines, [:call_id])
  end
end
