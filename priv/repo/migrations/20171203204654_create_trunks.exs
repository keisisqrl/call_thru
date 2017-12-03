defmodule CallThru.Repo.Migrations.CreateTrunks do
  use Ecto.Migration

  def change do
    create table(:trunks) do
      add :origin_id, references(:switches, on_delete: :delete_all)
      add :term_id, references(:switches, on_delete: :delete_all)

      timestamps()
    end

    create index(:trunks, [:origin_id])
    create index(:trunks, [:term_id])
  end
end
