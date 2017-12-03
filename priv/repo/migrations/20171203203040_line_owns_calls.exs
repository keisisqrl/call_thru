defmodule CallThru.Repo.Migrations.LineOwnsCalls do
  use Ecto.Migration

  def change do
    drop index(:lines, [:call_id])

    alter table(:lines) do
      remove :call_id
    end

    alter table(:calls) do
      add :origin_line_id, references(:calls, on_delete: :nilify_all)
      add :term_line_id, references(:calls, on_delete: :nilify_all)
    end

  end
  
end
