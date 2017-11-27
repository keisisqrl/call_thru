defmodule CallThru.FabricTest do
  use CallThru.DataCase

  alias CallThru.Fabric

  describe "switches" do
    alias CallThru.Fabric.Switch

    @valid_attrs %{name: "some name", prefix: "some prefix"}
    @update_attrs %{name: "some updated name", prefix: "some updated prefix"}
    @invalid_attrs %{name: nil, prefix: nil}

    def switch_fixture(attrs \\ %{}) do
      {:ok, switch} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fabric.create_switch()

      switch
    end

    test "list_switches/0 returns all switches" do
      switch = switch_fixture()
      assert Fabric.list_switches() == [switch]
    end

    test "get_switch!/1 returns the switch with given id" do
      switch = switch_fixture()
      assert Fabric.get_switch!(switch.id) == switch
    end

    test "create_switch/1 with valid data creates a switch" do
      assert {:ok, %Switch{} = switch} = Fabric.create_switch(@valid_attrs)
      assert switch.name == "some name"
      assert switch.prefix == "some prefix"
    end

    test "create_switch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fabric.create_switch(@invalid_attrs)
    end

    test "update_switch/2 with valid data updates the switch" do
      switch = switch_fixture()
      assert {:ok, switch} = Fabric.update_switch(switch, @update_attrs)
      assert %Switch{} = switch
      assert switch.name == "some updated name"
      assert switch.prefix == "some updated prefix"
    end

    test "update_switch/2 with invalid data returns error changeset" do
      switch = switch_fixture()
      assert {:error, %Ecto.Changeset{}} = Fabric.update_switch(switch, @invalid_attrs)
      assert switch == Fabric.get_switch!(switch.id)
    end

    test "delete_switch/1 deletes the switch" do
      switch = switch_fixture()
      assert {:ok, %Switch{}} = Fabric.delete_switch(switch)
      assert_raise Ecto.NoResultsError, fn -> Fabric.get_switch!(switch.id) end
    end

    test "change_switch/1 returns a switch changeset" do
      switch = switch_fixture()
      assert %Ecto.Changeset{} = Fabric.change_switch(switch)
    end
  end

  describe "lines" do
    alias CallThru.Fabric.Line

    @valid_attrs %{number: "some number"}
    @update_attrs %{number: "some updated number"}
    @invalid_attrs %{number: nil}

    def line_fixture(attrs \\ %{}) do
      {:ok, line} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fabric.create_line()

      line
    end

    test "list_lines/0 returns all lines" do
      line = line_fixture()
      assert Fabric.list_lines() == [line]
    end

    test "get_line!/1 returns the line with given id" do
      line = line_fixture()
      assert Fabric.get_line!(line.id) == line
    end

    test "create_line/1 with valid data creates a line" do
      assert {:ok, %Line{} = line} = Fabric.create_line(@valid_attrs)
      assert line.number == "some number"
    end

    test "create_line/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fabric.create_line(@invalid_attrs)
    end

    test "update_line/2 with valid data updates the line" do
      line = line_fixture()
      assert {:ok, line} = Fabric.update_line(line, @update_attrs)
      assert %Line{} = line
      assert line.number == "some updated number"
    end

    test "update_line/2 with invalid data returns error changeset" do
      line = line_fixture()
      assert {:error, %Ecto.Changeset{}} = Fabric.update_line(line, @invalid_attrs)
      assert line == Fabric.get_line!(line.id)
    end

    test "delete_line/1 deletes the line" do
      line = line_fixture()
      assert {:ok, %Line{}} = Fabric.delete_line(line)
      assert_raise Ecto.NoResultsError, fn -> Fabric.get_line!(line.id) end
    end

    test "change_line/1 returns a line changeset" do
      line = line_fixture()
      assert %Ecto.Changeset{} = Fabric.change_line(line)
    end
  end
end
