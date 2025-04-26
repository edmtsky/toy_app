```sh
mix phx.new toy_app

* creating toy_app/config/config.exs
* creating toy_app/config/dev.exs
* creating toy_app/config/prod.exs
* creating toy_app/config/runtime.exs
* creating toy_app/config/test.exs
* creating toy_app/lib/toy_app/application.ex
* creating toy_app/lib/toy_app.ex
* creating toy_app/lib/toy_app_web/views/error_helpers.ex
* creating toy_app/lib/toy_app_web/views/error_view.ex
* creating toy_app/lib/toy_app_web/endpoint.ex
* creating toy_app/lib/toy_app_web/router.ex
* creating toy_app/lib/toy_app_web/telemetry.ex
* creating toy_app/lib/toy_app_web.ex
* creating toy_app/mix.exs
* creating toy_app/README.md
* creating toy_app/.formatter.exs
* creating toy_app/.gitignore
* creating toy_app/test/support/channel_case.ex
* creating toy_app/test/support/conn_case.ex
* creating toy_app/test/test_helper.exs
* creating toy_app/test/toy_app_web/views/error_view_test.exs
* creating toy_app/lib/toy_app/repo.ex
* creating toy_app/priv/repo/migrations/.formatter.exs
* creating toy_app/priv/repo/seeds.exs
* creating toy_app/test/support/data_case.ex
* creating toy_app/lib/toy_app_web/controllers/page_controller.ex
* creating toy_app/lib/toy_app_web/views/page_view.ex
* creating toy_app/test/toy_app_web/controllers/page_controller_test.exs
* creating toy_app/test/toy_app_web/views/page_view_test.exs
* creating toy_app/assets/vendor/topbar.js
* creating toy_app/lib/toy_app_web/templates/layout/root.html.heex
* creating toy_app/lib/toy_app_web/templates/layout/app.html.heex
* creating toy_app/lib/toy_app_web/templates/layout/live.html.heex
* creating toy_app/lib/toy_app_web/views/layout_view.ex
* creating toy_app/lib/toy_app_web/templates/page/index.html.heex
* creating toy_app/test/toy_app_web/views/layout_view_test.exs
* creating toy_app/lib/toy_app/mailer.ex
* creating toy_app/lib/toy_app_web/gettext.ex
* creating toy_app/priv/gettext/en/LC_MESSAGES/errors.po
* creating toy_app/priv/gettext/errors.pot
* creating toy_app/assets/css/phoenix.css
* creating toy_app/assets/css/app.css
* creating toy_app/assets/js/app.js
* creating toy_app/priv/static/robots.txt
* creating toy_app/priv/static/images/phoenix.png
* creating toy_app/priv/static/favicon.ico

Fetch and install dependencies? [Yn] n

We are almost there! The following steps are missing:

    $ cd toy_app
    $ mix deps.get

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```


> fetch deps and build mix.lock
```sh
mix deps.get
Resolving Hex dependencies...
Resolution completed in 0.94s
New:
  castore 1.0.12
  connection 1.1.0
  cowboy 2.13.0
  cowboy_telemetry 0.4.0
  cowlib 2.15.0
  db_connection 2.7.0
  decimal 2.3.0
  ecto 3.7.2
  ecto_sql 3.7.1
  esbuild 0.4.0
  file_system 0.2.10
  floki 0.32.1
  gettext 0.19.1
  html_entities 0.5.2
  jason 1.3.0
  mime 2.0.6
  phoenix 1.6.2
  phoenix_ecto 4.4.0
  phoenix_html 3.2.0
  phoenix_live_dashboard 0.6.5
  phoenix_live_reload 1.3.3
  phoenix_live_view 0.17.10
  phoenix_pubsub 2.1.3
  phoenix_view 1.1.2
  plug 1.17.0
  plug_cowboy 2.5.2
  plug_crypto 1.2.5
  postgrex 0.15.13
  ranch 2.2.0
  swoosh 1.7.1
  telemetry 1.3.0
  telemetry_metrics 0.6.1
  telemetry_poller 1.0.0
* Getting phoenix (Hex package)
...
```

generate correct version of transitive deps to fix mix.lock file:

```sh
mix fix.lock
Determine point of time by phoenix 1.6.2 ...
Point of time: 2021-10-09 - 2021-12-08

Fetching release dates of transitive dependencies...
  - phoenix_pubsub  (locked: 2.1.3)
  - telemetry  (locked: 1.3.0)
  - connection  (locked: 1.1.0)
  - mime  (locked: 2.0.6)
  - file_system  (locked: 0.2.10)
  - plug  (locked: 1.17.0)
  - cowlib  (locked: 2.15.0)
  - plug_crypto  (locked: 1.2.5)
  - db_connection  (locked: 2.7.0)
  - decimal  (locked: 2.3.0)
  - html_entities  (locked: 0.5.2)
  - cowboy  (locked: 2.13.0)
  - ranch  (locked: 2.2.0)
  - ecto  (locked: 3.7.2)
  - castore  (locked: 1.0.12)
  - cowboy_telemetry  (locked: 0.4.0)
  - phoenix_view  (locked: 1.1.2)

Code snippet for mix.exs with exact versions:

      {:castore, "0.1.13"},
      {:connection, "1.1.0"},
      {:cowboy, "2.9.0"},
      {:cowboy_telemetry, "0.4.0"},
      {:cowlib, "2.11.0"},
      {:db_connection, "2.4.1"},
      {:decimal, "2.0.0"},
      {:ecto, "3.7.1"},
      {:file_system, "0.2.10"},
      {:html_entities, "0.5.2"},
      {:mime, "2.0.2"},
      {:phoenix_pubsub, "2.0.0"},
      {:phoenix_view, "1.0.0"},
      {:plug, "1.12.1"},
      {:plug_crypto, "1.2.2"},
      {:ranch, "2.1.0"},
      {:telemetry, "1.0.0"},


Next steps:

    1. copy generated code into the deps block in your mix.exs file
    2. mix deps.clean --all --unlock
    3. mix deps.get
    4. mix compile
```

copy code snippet to mix.exs and refetch deps and compile the project
```sh
mix deps.clean --all --unlock && mix deps.get && mix compile
```

```sh
==> file_system
Compiling 7 files (.ex)
Generated file_system app
==> connection
Compiling 1 file (.ex)
Generated connection app
==> gettext
Compiling 1 file (.yrl)
Compiling 1 file (.erl)
Compiling 21 files (.ex)
Generated gettext app
===> Analyzing applications...
===> Compiling ranch
===> Analyzing applications...
===> Compiling telemetry
==> telemetry_metrics
Compiling 7 files (.ex)
Generated telemetry_metrics app
===> Analyzing applications...
===> Compiling telemetry_poller
==> decimal
Compiling 4 files (.ex)
Generated decimal app
==> jason
Compiling 10 files (.ex)
Generated jason app
==> html_entities
Compiling 2 files (.ex)
Generated html_entities app
==> castore
Compiling 1 file (.ex)
Generated castore app
==> esbuild
Compiling 3 files (.ex)
Generated esbuild app
==> db_connection
Compiling 14 files (.ex)
Generated db_connection app
==> ecto
Compiling 56 files (.ex)
Generated ecto app
==> phoenix_pubsub
Compiling 11 files (.ex)
Generated phoenix_pubsub app
===> Analyzing applications...
===> Compiling cowlib
===> Analyzing applications...
===> Compiling cowboy
===> Analyzing applications...
===> Compiling cowboy_telemetry
==> mime
Compiling 1 file (.ex)
Generated mime app
==> postgrex
Compiling 62 files (.ex)
Generated postgrex app
==> ecto_sql
Compiling 26 files (.ex)
Generated ecto_sql app
==> plug_crypto
Compiling 5 files (.ex)
Generated plug_crypto app
==> plug
Compiling 1 file (.erl)
Compiling 41 files (.ex)
warning: System.stacktrace/0 is deprecated. Use __STACKTRACE__ instead
  lib/plug/conn/wrapper_error.ex:23: Plug.Conn.WrapperError.reraise/3

Generated plug app
==> phoenix_html
Compiling 8 files (.ex)
Generated phoenix_html app
==> phoenix_view
Compiling 5 files (.ex)
Generated phoenix_view app
==> plug_cowboy
Compiling 5 files (.ex)
Generated plug_cowboy app
==> phoenix
Compiling 68 files (.ex)
Generated phoenix app
==> phoenix_live_reload
Compiling 4 files (.ex)
Generated phoenix_live_reload app
==> phoenix_live_view
Compiling 31 files (.ex)
Generated phoenix_live_view app
==> phoenix_live_dashboard
Compiling 40 files (.ex)
Generated phoenix_live_dashboard app
==> swoosh
Compiling 39 files (.ex)
Generated swoosh app
==> phoenix_ecto
Compiling 7 files (.ex)
Generated phoenix_ecto app
==> toy_app
Compiling 14 files (.ex)
Generated toy_app app
```


