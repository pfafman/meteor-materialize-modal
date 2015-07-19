Package.describe({
  name: "pfafman:materialize-modal",
  summary: "Display a modal via Materialize written in coffeescript",
  version: "0.3.4",
  git: "https://github.com/pfafman/meteor-materialize-modal.git"
});

Package.on_use(function(api, where) {
  api.versionsFrom("METEOR@1.0.4");

  api.use([
    'underscore',
    'templating',
    'ui',
    'jquery',
    'coffeescript',
    'reactive-var',
  ], 'client');

  api.use([
    'softwarerero:accounts-t9n@1.1.3',
  ], ["client", "server"]);

  api.add_files([
    'lib/modal.css',
    'lib/modal.html',
    'lib/modal.coffee',
  ], 'client');

  api.add_files([
    'lib/t9n.coffee'
  ], ['client', 'server']);

  if (api.export) {
    api.export('MaterializeModal')
  }

});


Package.on_test(function(api) {
  api.use("pfafman:materialize-modal", 'client');
  api.use(['tinytest', 'test-helpers', 'coffeescript'], 'client');
  api.add_files('modal_tests.coffee', 'client');
});
