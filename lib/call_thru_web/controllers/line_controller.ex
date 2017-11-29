defmodule CallThruWeb.LineController do
  use CallThruWeb, :controller

  alias CallThru.Fabric
  alias CallThru.Fabric.Line

  def index(conn, _params) do
    lines = Fabric.list_lines()
    render(conn, "index.html", lines: lines)
  end

  def new(conn, _params) do
    changeset = Fabric.change_line(%Line{})
    render(conn, "new.html", changeset: changeset,
      switches: Fabric.list_switches)
  end

  def create(conn, %{"line" => line_params}) do
    case Fabric.create_line(line_params) do
      {:ok, line} ->
        conn
        |> put_flash(:info, "Line created successfully.")
        |> redirect(to: line_path(conn, :show, line))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html",
          changeset: changeset,
          switches: Fabric.list_switches
        )
    end
  end

  def show(conn, %{"id" => id}) do
    line = Fabric.get_line!(id)
    render(conn, "show.html", line: line)
  end

  def edit(conn, %{"id" => id}) do
    line = Fabric.get_line!(id)
    changeset = Fabric.change_line(line)
    render(conn, "edit.html", line: line, changeset: changeset,
      switches: Fabric.list_switches )
  end

  def update(conn, %{"id" => id, "line" => line_params}) do
    line = Fabric.get_line!(id)

    case Fabric.update_line(line, line_params) do
      {:ok, line} ->
        conn
        |> put_flash(:info, "Line updated successfully.")
        |> redirect(to: line_path(conn, :show, line))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", line: line, changeset: changeset,
          switches: Fabric.list_switches )
    end
  end

  def delete(conn, %{"id" => id}) do
    line = Fabric.get_line!(id)
    {:ok, _line} = Fabric.delete_line(line)

    conn
    |> put_flash(:info, "Line deleted successfully.")
    |> redirect(to: line_path(conn, :index))
  end
end
