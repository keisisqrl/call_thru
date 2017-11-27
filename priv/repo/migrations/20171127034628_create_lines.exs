defmodule CallThru.Repo.Migrations.CreateLines do
  use Ecto.Migration

  def change do
    create table(:lines) do
      add :number, :string
      add :switch_id, references(:switches, on_delete: :nothing)

      timestamps()
    end

    create index(:lines, [:switch_id])
  end
end
