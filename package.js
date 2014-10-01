Package.describe({
  summary: " Parse JS SDK.  Compatible with 0.9.0+ ",
  version: "1.0.1",
  git: "https://github.com/timmyg/meteor-parse-sdk"
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.2.2');
  api.addFiles('timmyg13:parse-sdk.js');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('timmyg13:parse-sdk');
  api.addFiles('timmyg13:parse-sdk-tests.js');
});
