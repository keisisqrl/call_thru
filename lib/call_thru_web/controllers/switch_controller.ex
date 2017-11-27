defmodule CallThruWeb.SwitchController do
  use CallThruWeb, :controller

  alias CallThru.Fabric
  alias CallThru.Fabric.Switch

  def index(conn, _params) do
    switches = Fabric.list_switches()
    render(conn, "index.html", switches: switches)
  end

  def new(conn, _params) do
    changeset = Fabric.change_switch(%Switch{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"switch" => switch_params}) do
    case Fabric.create_switch(switch_params) do
      {:ok, switch} ->
        conn
        |> put_flash(:info, "Switch created successfully.")
        |> redirect(to: switch_path(conn, :show, switch))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    switch = Fabric.get_switch!(id)
    render(conn, "show.html", switch: switch)
  end

  def edit(conn, %{"id" => id}) do
    switch = Fabric.get_switch!(id)
    changeset = Fabric.change_switch(switch)
    render(conn, "edit.html", switch: switch, changeset: changeset)
  end

  def update(conn, %{"id" => id, "switch" => switch_params}) do
    switch = Fabric.get_switch!(id)

    case Fabric.update_switch(switch, switch_params) do
      {:ok, switch} ->
        conn
        |> put_flash(:info, "Switch updated successfully.")
        |> redirect(to: switch_path(conn, :show, switch))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", switch: switch, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    switch = Fabric.get_switch!(id)
    {:ok, _switch} = Fabric.delete_switch(switch)

    conn
    |> put_flash(:info, "Switch deleted successfully.")
    |> redirect(to: switch_path(conn, :index))
  end
end
