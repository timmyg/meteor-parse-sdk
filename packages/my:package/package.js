Package.describe({
  summary: " \* Fill me in! *\ ",
  version: "1.0.0",
  git: " \* Fill me in! *\ "
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.2.2');
  api.addFiles('my:package.js');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('my:package');
  api.addFiles('my:package-tests.js');
});
