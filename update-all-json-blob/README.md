# update-all-json-blob

## getting started

    docker compose run --rm web rails bin/rails db:setup

## console

    docker compose run --rm web bin/rails c

### query via json

    irb> Cat.where("(config -> 'features' ->> 'chonky')::boolean = ?", true)
      Cat Load (1.1ms)  SELECT "cats".* FROM "cats" WHERE ((config -> 'features' ->> 'chonky')::boolean = TRUE)
    =>
    [#<Cat:0x00007f38b18a03b8 id: 1, name: "Lucy", config: {"foo"=>["bar", "baz"], "features"=>{"chonky"=>true}}>,
     #<Cat:0x00007f38b18a5d90 id: 3, name: "Zaz", config: {"foo"=>["bar", "baz"], "features"=>{"chonky"=>true}}>]

### update_all via jsonb_set

In this case, our `config` column is a `json` type and postgres only has a function for jsonb named `jsonb_set` so we must cast `config` to the correct type by appending `::jsonb`.

    irb> Cat.where("(config -> 'features' ->> 'chonky')::boolean = ?", true).update_all(
    irb*   "config = jsonb_set(config::jsonb, '{features,chonky}', to_json(#{false}::boolean)::jsonb)"
    irb> )
      Cat Update All (2.1ms)  UPDATE "cats" SET config = jsonb_set(config::jsonb, '{features,chonky}'::text[], to_json(false::boolean)::jsonb) WHERE ((config -> 'features' ->> 'chonky')::boolean = TRUE)
    => 2

    irb(main):026:0> Cat.where
      Cat Load (0.7ms)  SELECT "cats".* FROM "cats"
    =>
    #<ActiveRecord::QueryMethods::WhereChain:0x00007f362251be68
     @scope=
      [#<Cat:0x00007f36224ccd68 id: 2, name: "Fen", config: {"foo"=>["bar", "baz"], "features"=>{"chonky"=>false}}>,
       #<Cat:0x00007f36224ccca0 id: 1, name: "Lucy", config: {"foo"=>["bar", "baz"], "features"=>{"chonky"=>false}}>,
       #<Cat:0x00007f36224cc930 id: 3, name: "Zaz", config: {"foo"=>["bar", "baz"], "features"=>{"chonky"=>false}}>]>
