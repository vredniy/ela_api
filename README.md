# ElaApi

* `mix ecto.create`
* `mix ecto.migrate`
* start server `iex -S mix phx.server`
* create Person `curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{ "person": { "name": "first persons" }}' "http://localhost:4000/api/people"`
* create Fact `curl -X POST -H "Content-Type: application/json" -d '{ "fact": { "text": "loves craft" }}' "http://localhost:4000/api/people/1/facts"`
