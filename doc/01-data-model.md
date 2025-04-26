## Data model

### A toy model for users

```
+-----------------+
|     users       |
+-----------------+
| id    | integer |
| name  | string  |
| email | string  |
+-----------------+
```
Users of our toy app will have:
- a unique identifier called `id` (of type integer),
- a publicly viewable `name` (of type string), and
- an `email` address (of type string) that will double as a unique username.


### A toy model for microposts

```
+-------------------+
|     microposts    |
+-------------------+
| id      | integer |
| content | string  |
| user_id | integer |
+-------------------+
```

A micropost has:
- an `id`
- a `content` field for the micropost's text (of type `text`).
- user_id - to associate each micropost with a particular user.


### The Accounts context and the Users resource

Now we need to implement a web interface for an invented data model.
We will manage the User model using a _context_.

A context is a module that exposes and groups related functionality such as
data access and data validation.
Is about how to break down complex logic down to simple well-defined contexts.

We will manage the `User` model with an `Accounts` context.
The `Accounts` context will manage user data access and data validation.

create our `Accounts` context and `User` model using Phoenix generators:

```sh
mix phx.gen.html Accounts User users name:string email:string
#                (1)      (2)  (3)      (4)           (5)

* creating lib/toy_app_web/controllers/user_controller.ex
* creating lib/toy_app_web/templates/user/edit.html.heex
* creating lib/toy_app_web/templates/user/form.html.heex
* creating lib/toy_app_web/templates/user/index.html.heex
* creating lib/toy_app_web/templates/user/new.html.heex
* creating lib/toy_app_web/templates/user/show.html.heex
* creating lib/toy_app_web/views/user_view.ex
* creating test/toy_app_web/controllers/user_controller_test.exs
* creating lib/toy_app/accounts/user.ex
* creating priv/repo/migrations/20250425134003_create_users.exs
* creating lib/toy_app/accounts.ex
* injecting lib/toy_app/accounts.ex
* creating test/toy_app/accounts_test.exs
* injecting test/toy_app/accounts_test.exs
* creating test/support/fixtures/accounts_fixtures.ex
* injecting test/support/fixtures/accounts_fixtures.ex

Add the resource to your browser scope in lib/toy_app_web/router.ex:

    resources "/users", UserController


Remember to update your repository by running migrations:

    $ mix ecto.migrate
```

- 1. `Accounts` - the name of the context
- 2. `User` - entity name
- 3. `users` - the table name in database
- 4. add `name` attribute for User entity into owr db table
- 4. add `email` attribute for User entity into owr db table

Note: There is no need to include a parameter for `id`.
      It is created automatically by Phoenix
      for use as the `primary_key` in the database.



update the `lib/toy_app_web/router.ex`:

Listing 2.10: Add users resource.
> lib/toy_app_web/router.ex
```elixir
  # ...
  scope "/", ToyAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
  end
  # ...
```


```sh
mix ecto.create
# The database for ToyApp.Repo has already been created
```

```sh
mix ecto.migrate
# 16:47:35.994 [info]  == Running 20250425134003 ToyApp.Repo.Migrations.CreateUsers.change/0 forward
#
# 16:47:36.004 [info]  create table users
#
# 16:47:36.205 [info]  == Migrated 20250425134003 in 0.1s
```

> RESTful routes provided by the `Users` resource

| HTTP request |      URL      | Action |           Purpose
|--------------|---------------|--------|-----------------------------
| GET          | /users        | index  | page to list all users
| GET          | /users/1      | show   | page to show user with id 1
| GET          | /users/new    | new    | page to make a new user
| POST         | /users        | create | create a new user
| GET          | /users/1/edit | edit   | page to edit user with id 1
| PATCH        | /users/1      | update | update user with id 1
| DELETE       | /users/1      | delete | delete user with id 1






up and running
> term1:
```sh
mix phx.server
# [info] Running ToyAppWeb.Endpoint with cowboy 2.9.0 at 127.0.0.1:4000 (http)
# [info] Access ToyAppWeb.Endpoint at http://localhost:4000
# [watch] build finished, watching for changes...
```

> term2:
```sh
http://127.0.0.1:4000/users
# ...
# <h1>Listing Users</h1>
#
# <table>
#   <thead>
#     <tr>
#       <th>Name</th>
#       <th>Email</th>
#
#       <th></th>
#     </tr>
#   </thead>
#   <tbody>
#
#   </tbody>
# </table>
# ...
```

> term1:
```sh
# [info] GET /users
# [debug] Processing with ToyAppWeb.UserController.index/2
#   Parameters: %{}
#   Pipelines: [:browser]
# [debug] QUERY OK source="users" db=0.4ms queue=0.6ms idle=1497.7ms
# SELECT u0."id", u0."email", u0."name", u0."inserted_at", u0."updated_at" FROM "users" AS u0 []
# [info] Sent 200 in 37ms
```


```sh
mix phx.gen.html Posts Micropost microposts content:text user_id:integer
#                (1)      (2)  (3)      (4)           (5)

* creating lib/toy_app_web/controllers/micropost_controller.ex
* creating lib/toy_app_web/templates/micropost/edit.html.heex
* creating lib/toy_app_web/templates/micropost/form.html.heex
* creating lib/toy_app_web/templates/micropost/index.html.heex
* creating lib/toy_app_web/templates/micropost/new.html.heex
* creating lib/toy_app_web/templates/micropost/show.html.heex
* creating lib/toy_app_web/views/micropost_view.ex
* creating test/toy_app_web/controllers/micropost_controller_test.exs
* creating lib/toy_app/posts/micropost.ex
* creating priv/repo/migrations/20250425164825_create_microposts.exs
* creating lib/toy_app/posts.ex
* injecting lib/toy_app/posts.ex
* creating test/toy_app/posts_test.exs
* injecting test/toy_app/posts_test.exs
* creating test/support/fixtures/posts_fixtures.ex
* injecting test/support/fixtures/posts_fixtures.ex

Add the resource to your browser scope in lib/toy_app_web/router.ex:

    resources "/microposts", MicropostController


Remember to update your repository by running migrations:

    $ mix ecto.migrate
```

- 1. `Posts` - the name of the context
- 2. `Micropost` - the entity
- 3. `microposts` - the table name in database
- 4. & 5. attributes


> RESTful routes provided by the `Microposts` resource:

| HTTP request |        URL         | Action |              Purpose
|--------------|--------------------|--------|-----------------------------------
| GET          | /microposts        | index  | page to list all microposts
| GET          | /microposts/1      | show   | page to show microposts with id 1
| GET          | /microposts/new    | new    | page to make a new micropost
| POST         | /microposts        | create | create a new micropost
| GET          | /microposts/1/edit | edit   | page to edit micropost with id 1
| PATCH        | /microposts/1      | update | update micropost with id 1
| DELETE       | /microposts/1      | delete | delete micropost with id 1



### create associations between the User and Microposts data models.

A user has many microposts:
lib/toy_app/accounts/user.ex
```elixir
defmodule ToyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ToyApp.Posts.Micropost       # +

  schema "users" do
    field :email, :string
    field :name, :string
    has_many :microposts, Micropost  # +

    timestamps()
  end
  # ...
end
```


A micropost belongs to a user:
lib/toy_app/posts/micropost.ex
```elixir
defmodule ToyApp.Posts.Micropost do
  use Ecto.Schema
  import Ecto.Changeset
  alias ToyApp.Accounts.User   # +

  schema "microposts" do
    field :content, :string
    # field :user_id, :integer # -
    belongs_to :user, User     # +

    timestamps()
  end
  # ...
end
```

### examine the implications of the added user-micropost association using iex

```sh
iex -S mix
Erlang/OTP 24 [erts-12.3.2.17] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Compiling 2 files (.ex)
Interactive Elixir (1.12.3) - press Ctrl+C to exit (type h() ENTER for help)
```

```elixir
iex(1)> alias ToyApp.Accounts.User
ToyApp.Accounts.User

iex(2)> alias ToyApp.Repo
ToyApp.Repo

iex(3)> import Ecto.Query
Ecto.Query

iex(4)> first_user = first(from u in User, preload: [:microposts]) |> Repo.one()

[debug] QUERY OK source="users" db=19.2ms decode=3.0ms queue=0.6ms idle=1487.4ms
SELECT u0."id", u0."email", u0."name", u0."inserted_at", u0."updated_at" FROM "users" AS u0 ORDER BY u0."id" LIMIT 1 []
[debug] QUERY OK source="microposts" db=0.3ms queue=0.6ms idle=547.0ms
SELECT m0."id", m0."content", m0."user_id", m0."inserted_at", m0."updated_at", m0."user_id" FROM "microposts" AS m0 WHERE (m0."user_id" = $1) ORDER BY m0."user_id" [1]

%ToyApp.Accounts.User{
  __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
  email: "joedoe@example.com",
  id: 1,
  inserted_at: ~N[2025-04-25 13:54:38],
  microposts: [
    %ToyApp.Posts.Micropost{
      __meta__: #Ecto.Schema.Metadata<:loaded, "microposts">,
      content: "First Micropost",
      id: 1,
      inserted_at: ~N[2025-04-25 16:58:24],
      updated_at: ~N[2025-04-25 16:58:24],
      user: #Ecto.Association.NotLoaded<association :user is not loaded>,
      user_id: 1
    },
    %ToyApp.Posts.Micropost{
      __meta__: #Ecto.Schema.Metadata<:loaded, "microposts">,
      content: "<h1> Content </h1>",
      id: 4,
      inserted_at: ~N[2025-04-25 17:02:31],
      updated_at: ~N[2025-04-25 17:02:31],
      user: #Ecto.Association.NotLoaded<association :user is not loaded>,
      user_id: 1
    }
  ],
  name: "Johm Doe",
  updated_at: ~N[2025-04-25 13:55:33]
}

iex(5)> first_user.microposts
[
  %ToyApp.Posts.Micropost{
    __meta__: #Ecto.Schema.Metadata<:loaded, "microposts">,
    content: "First Micropost",
    id: 1,
    inserted_at: ~N[2025-04-25 16:58:24],
    updated_at: ~N[2025-04-25 16:58:24],
    user: #Ecto.Association.NotLoaded<association :user is not loaded>,
    user_id: 1
  },
  %ToyApp.Posts.Micropost{
    __meta__: #Ecto.Schema.Metadata<:loaded, "microposts">,
    content: "<h1> Content </h1>",
    id: 4,
    inserted_at: ~N[2025-04-25 17:02:31],
    updated_at: ~N[2025-04-25 17:02:31],
    user: #Ecto.Association.NotLoaded<association :user is not loaded>,
    user_id: 1
  }
]


iex(6)> micropost = List.first(first_user.microposts) |> Repo.preload(:user)

[debug] QUERY OK source="users" db=0.6ms queue=0.6ms idle=1834.7ms
SELECT u0."id", u0."email", u0."name", u0."inserted_at", u0."updated_at", u0."id" FROM "users" AS u0 WHERE (u0."id" = $1) [1]

%ToyApp.Posts.Micropost{
  __meta__: #Ecto.Schema.Metadata<:loaded, "microposts">,
  content: "First Micropost",
  id: 1,
  inserted_at: ~N[2025-04-25 16:58:24],
  updated_at: ~N[2025-04-25 16:58:24],
  user: %ToyApp.Accounts.User{
    __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
    email: "joedoe@example.com",
    id: 1,
    inserted_at: ~N[2025-04-25 13:54:38],
    microposts: #Ecto.Association.NotLoaded<association :microposts is not loaded>,
    name: "Johm Doe",
    updated_at: ~N[2025-04-25 13:55:33]
  },
  user_id: 1
}

iex(7)> micropost.user
%ToyApp.Accounts.User{
  __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
  email: "joedoe@example.com",
  id: 1,
  inserted_at: ~N[2025-04-25 13:54:38],
  microposts: #Ecto.Association.NotLoaded<association :microposts is not loaded>,
  name: "Johm Doe",
  updated_at: ~N[2025-04-25 13:55:33]
}

```


Ecto does not automatically preload the microposts association on
`first_user.microposts`. You have to preload it yourself like so:

```elixir
first_user = first(from u in User, preload: [:microposts]) |> Repo.one()
```
With this code, `Ecto` returns all the `microposts` with `user_id` equal to the
id of `first_user` (in this case `1`).
