defmodule CallThru.Repo.Migrations.AddLinesColumnInUse do
  use Ecto.Migration

  def change do

    alter table("lines") do
      add :in_use, :boolean, default: false
    end
    
  end
end
