defmodule CallThru.Repo.Migrations.UniqueLinesPerSwitch do
  use Ecto.Migration

  def change do
    create unique_index(:lines,[:number,:switch_id],
      name: :lines_number_switch_id_index)
  end
end
