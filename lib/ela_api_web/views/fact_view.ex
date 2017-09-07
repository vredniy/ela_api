defmodule ElaApiWeb.FactView do
  use ElaApiWeb, :view
  alias ElaApiWeb.FactView

  def render("index.json", %{facts: facts}) do
    %{data: render_many(facts, FactView, "fact.json")}
  end

  def render("show.json", %{fact: fact}) do
    %{data: render_one(fact, FactView, "fact.json")}
  end

  def render("fact.json", %{fact: fact}) do
    %{id: fact.id,
      text: fact.text}
  end
end
