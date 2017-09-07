defmodule ElaApi.FactsTest do
  use ElaApi.DataCase

  alias ElaApi.Facts

  describe "facts" do
    alias ElaApi.Facts.Fact

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def fact_fixture(attrs \\ %{}) do
      {:ok, fact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Facts.create_fact()

      fact
    end

    test "list_facts/0 returns all facts" do
      fact = fact_fixture()
      assert Facts.list_facts() == [fact]
    end

    test "get_fact!/1 returns the fact with given id" do
      fact = fact_fixture()
      assert Facts.get_fact!(fact.id) == fact
    end

    test "create_fact/1 with valid data creates a fact" do
      assert {:ok, %Fact{} = fact} = Facts.create_fact(@valid_attrs)
      assert fact.text == "some text"
    end

    test "create_fact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Facts.create_fact(@invalid_attrs)
    end

    test "update_fact/2 with valid data updates the fact" do
      fact = fact_fixture()
      assert {:ok, fact} = Facts.update_fact(fact, @update_attrs)
      assert %Fact{} = fact
      assert fact.text == "some updated text"
    end

    test "update_fact/2 with invalid data returns error changeset" do
      fact = fact_fixture()
      assert {:error, %Ecto.Changeset{}} = Facts.update_fact(fact, @invalid_attrs)
      assert fact == Facts.get_fact!(fact.id)
    end

    test "delete_fact/1 deletes the fact" do
      fact = fact_fixture()
      assert {:ok, %Fact{}} = Facts.delete_fact(fact)
      assert_raise Ecto.NoResultsError, fn -> Facts.get_fact!(fact.id) end
    end

    test "change_fact/1 returns a fact changeset" do
      fact = fact_fixture()
      assert %Ecto.Changeset{} = Facts.change_fact(fact)
    end
  end
end
