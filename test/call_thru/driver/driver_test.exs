defmodule CallThru.DriverTest do
  use CallThru.DataCase

  alias CallThru.Driver

  describe "calls" do
    alias CallThru.Driver.Call

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def call_fixture(attrs \\ %{}) do
      {:ok, call} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Driver.create_call()

      call
    end

    test "list_calls/0 returns all calls" do
      call = call_fixture()
      assert Driver.list_calls() == [call]
    end

    test "get_call!/1 returns the call with given id" do
      call = call_fixture()
      assert Driver.get_call!(call.id) == call
    end

    test "create_call/1 with valid data creates a call" do
      assert {:ok, %Call{} = call} = Driver.create_call(@valid_attrs)
    end

    test "create_call/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Driver.create_call(@invalid_attrs)
    end

    test "update_call/2 with valid data updates the call" do
      call = call_fixture()
      assert {:ok, call} = Driver.update_call(call, @update_attrs)
      assert %Call{} = call
    end

    test "update_call/2 with invalid data returns error changeset" do
      call = call_fixture()
      assert {:error, %Ecto.Changeset{}} = Driver.update_call(call, @invalid_attrs)
      assert call == Driver.get_call!(call.id)
    end

    test "delete_call/1 deletes the call" do
      call = call_fixture()
      assert {:ok, %Call{}} = Driver.delete_call(call)
      assert_raise Ecto.NoResultsError, fn -> Driver.get_call!(call.id) end
    end

    test "change_call/1 returns a call changeset" do
      call = call_fixture()
      assert %Ecto.Changeset{} = Driver.change_call(call)
    end
  end
end
