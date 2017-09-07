defmodule ElaApiWeb.FactControllerTest do
  use ElaApiWeb.ConnCase

  alias ElaApi.Facts
  alias ElaApi.Facts.Fact

  @create_attrs %{text: "some text"}
  @update_attrs %{text: "some updated text"}
  @invalid_attrs %{text: nil}

  def fixture(:fact) do
    {:ok, fact} = Facts.create_fact(@create_attrs)
    fact
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all facts", %{conn: conn} do
      conn = get conn, fact_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create fact" do
    test "renders fact when data is valid", %{conn: conn} do
      conn = post conn, fact_path(conn, :create), fact: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, fact_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "text" => "some text"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, fact_path(conn, :create), fact: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update fact" do
    setup [:create_fact]

    test "renders fact when data is valid", %{conn: conn, fact: %Fact{id: id} = fact} do
      conn = put conn, fact_path(conn, :update, fact), fact: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, fact_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "text" => "some updated text"}
    end

    test "renders errors when data is invalid", %{conn: conn, fact: fact} do
      conn = put conn, fact_path(conn, :update, fact), fact: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete fact" do
    setup [:create_fact]

    test "deletes chosen fact", %{conn: conn, fact: fact} do
      conn = delete conn, fact_path(conn, :delete, fact)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, fact_path(conn, :show, fact)
      end
    end
  end

  defp create_fact(_) do
    fact = fixture(:fact)
    {:ok, fact: fact}
  end
end
