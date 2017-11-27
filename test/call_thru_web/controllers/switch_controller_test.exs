defmodule CallThruWeb.SwitchControllerTest do
  use CallThruWeb.ConnCase

  alias CallThru.Fabric

  @create_attrs %{name: "some name", prefix: "some prefix"}
  @update_attrs %{name: "some updated name", prefix: "some updated prefix"}
  @invalid_attrs %{name: nil, prefix: nil}

  def fixture(:switch) do
    {:ok, switch} = Fabric.create_switch(@create_attrs)
    switch
  end

  describe "index" do
    test "lists all switches", %{conn: conn} do
      conn = get conn, switch_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Switches"
    end
  end

  describe "new switch" do
    test "renders form", %{conn: conn} do
      conn = get conn, switch_path(conn, :new)
      assert html_response(conn, 200) =~ "New Switch"
    end
  end

  describe "create switch" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, switch_path(conn, :create), switch: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == switch_path(conn, :show, id)

      conn = get conn, switch_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Switch"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, switch_path(conn, :create), switch: @invalid_attrs
      assert html_response(conn, 200) =~ "New Switch"
    end
  end

  describe "edit switch" do
    setup [:create_switch]

    test "renders form for editing chosen switch", %{conn: conn, switch: switch} do
      conn = get conn, switch_path(conn, :edit, switch)
      assert html_response(conn, 200) =~ "Edit Switch"
    end
  end

  describe "update switch" do
    setup [:create_switch]

    test "redirects when data is valid", %{conn: conn, switch: switch} do
      conn = put conn, switch_path(conn, :update, switch), switch: @update_attrs
      assert redirected_to(conn) == switch_path(conn, :show, switch)

      conn = get conn, switch_path(conn, :show, switch)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, switch: switch} do
      conn = put conn, switch_path(conn, :update, switch), switch: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Switch"
    end
  end

  describe "delete switch" do
    setup [:create_switch]

    test "deletes chosen switch", %{conn: conn, switch: switch} do
      conn = delete conn, switch_path(conn, :delete, switch)
      assert redirected_to(conn) == switch_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, switch_path(conn, :show, switch)
      end
    end
  end

  defp create_switch(_) do
    switch = fixture(:switch)
    {:ok, switch: switch}
  end
end
