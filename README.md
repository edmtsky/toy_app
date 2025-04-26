# ToyApp

A toy web app made for learning purposes


### Contains:

- configuration to work with PostgreSQL
- two data models: Users and Microposts
- CRUD RESTful interface for interacting with data models
- code for data modles, created using built-in Phoenix scaffolding
- notes [how to init new Phoenix-1.6 poject](./doc/00-init-project.md)
- notes [hot to create data-model and use Ecto in iex](./doc/01-data-model.md)


#### Note:

This repository contains an old version of the Phoenix framework - 1.6.
This old version was chosen to reproduce this project from scratch based on
outdated materials. Phoenix-1.6.2 was released at 2021-10-09. Anf for example,
a next minor version (1.7.0) was released in 2023-02-24. And although specific
versions of the direct dependencies were described in the outdated training
materials, still when creating the new project there were issue with transitive
dependencies.
To solve this problem, you can define specific versions to all other(transitive)
dependencies. Having selected specific versions that were relevant on the date
of the release of the Phoenix-1.6.2.
You can get such specific versions using this [tool](https://github.com/edmtsky/fix_mix_lock)


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
