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
  },
  async headers() {
    return [
      {
        source: '/',
        headers: [
          {
            key: 'x-frame-options',
            value: 'DENY',
          },
          {
            key: 'x-xss-protection',
            value: '1;mode=block;;report=https://cookies.report-uri.com/r/d/csp/reportOnly',
          },
          {
            key: 'x-content-type-options',
            value: 'nosniff',
          },
          {
            key: 'report-to',
            value: '{"group":"default","max_age":"300","endpoints":[{"url":"https://cookies.report-uri.com/a/d/g"}],"include_subdomains":true}',
          },
          {
            key: 'referrer-policy',
            value: 'strict-origin',
          },
          {
            key: 'accept-ch',
            value: 'dpr, downlink, ect, rtt, viewport-width, width',
          },
          {
            key: 'accept-ch-lifetime',
            value: '604800',
          },
          {
            key: 'feature-policy',
            value: `ch-dpr 'self' https://*.c6cdn.net; ch-ect 'self'; ch-rtt 'self'; ch-viewport-width 'self' https://*.c6cdn.net; ch-width 'self' https://*.c6cdn.net; document-domain 'none'; sync-xhr 'none';`,
          },
          {
            key: 'nel',
            value: `{"report_to":"default","max_age":"300","include_subdomains":true}`,
          },
        ],
      },
    ]
  }
}
