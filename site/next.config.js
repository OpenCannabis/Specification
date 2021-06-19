const path = require('path');
require('dotenv').config()

module.exports = {
  poweredByHeader: false,
  future: {webpack5: true},
  env: {
    NEXT_CMS_DATOCMS_API_TOKEN:
      process.env.NEXT_CMS_DATOCMS_API_TOKEN,
  },
  sassOptions: {
    includePaths: [path.join(__dirname, 'styles')],
  }
}
