defmodule CallThruWeb.LineControllerTest do
  use CallThruWeb.ConnCase

  alias CallThru.Fabric

  @create_attrs %{number: "some number"}
  @update_attrs %{number: "some updated number"}
  @invalid_attrs %{number: nil}

  def fixture(:line) do
    {:ok, line} = Fabric.create_line(@create_attrs)
    line
  end

  describe "index" do
    test "lists all lines", %{conn: conn} do
      conn = get conn, line_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Lines"
    end
  end

  describe "new line" do
    test "renders form", %{conn: conn} do
      conn = get conn, line_path(conn, :new)
      assert html_response(conn, 200) =~ "New Line"
    end
  end

  describe "create line" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, line_path(conn, :create), line: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == line_path(conn, :show, id)

      conn = get conn, line_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Line"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, line_path(conn, :create), line: @invalid_attrs
      assert html_response(conn, 200) =~ "New Line"
    end
  end

  describe "edit line" do
    setup [:create_line]

    test "renders form for editing chosen line", %{conn: conn, line: line} do
      conn = get conn, line_path(conn, :edit, line)
      assert html_response(conn, 200) =~ "Edit Line"
    end
  end

  describe "update line" do
    setup [:create_line]

    test "redirects when data is valid", %{conn: conn, line: line} do
      conn = put conn, line_path(conn, :update, line), line: @update_attrs
      assert redirected_to(conn) == line_path(conn, :show, line)

      conn = get conn, line_path(conn, :show, line)
      assert html_response(conn, 200) =~ "some updated number"
    end

    test "renders errors when data is invalid", %{conn: conn, line: line} do
      conn = put conn, line_path(conn, :update, line), line: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Line"
    end
  end

  describe "delete line" do
    setup [:create_line]

    test "deletes chosen line", %{conn: conn, line: line} do
      conn = delete conn, line_path(conn, :delete, line)
      assert redirected_to(conn) == line_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, line_path(conn, :show, line)
      end
    end
  end

  defp create_line(_) do
    line = fixture(:line)
    {:ok, line: line}
  end
end
