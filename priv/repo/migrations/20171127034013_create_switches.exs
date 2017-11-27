defmodule CallThru.Repo.Migrations.CreateSwitches do
  use Ecto.Migration

  def change do
    create table(:switches) do
      add :name, :string
      add :prefix, :string

      timestamps()
    end

    create unique_index(:switches, [:name])
    create unique_index(:switches, [:prefix])
  end
end
