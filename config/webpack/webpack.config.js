const { webpackConfig } = require("shakapacker");

// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
var path = require("path");

module.exports = {
  ...webpackConfig,
  resolve: {
    ...webpackConfig?.resolve,
    alias: {
      // Force all modules to use the same jquery version.
      jquery: path.join(__dirname, "node_modules/jquery/src/jquery"),
    },
  },
};
