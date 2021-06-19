const path = require('path');
require('dotenv').config();

const withMDX = require('@next/mdx')({
  extension: /\.mdx$/
});

const withBundleAnalyzer = require('@next/bundle-analyzer')({
    enabled: process.env.ANALYZE === 'true',
});

module.exports = withBundleAnalyzer(withMDX({
  poweredByHeader: false,
  reactStrictMode: true,
  trailingSlash: false,
  pageExtensions: ['js', 'jsx', 'ts', 'tsx', 'md', 'mdx'],
  webpack5: true,
  future: {strictPostcssConfiguration: true},
  env: {
    NEXT_CMS_DATOCMS_API_TOKEN:
      process.env.NEXT_CMS_DATOCMS_API_TOKEN,
  },
  sassOptions: {
    includePaths: [path.join(__dirname, 'styles')],
  },
  experimental: {
    externalDir: true,
    optimizeImages: true,
    optimizeCss: true
  },
  webpack: (config) => {
    config.module.rules.push(
      {
        test: /\.md$/,
        use: 'raw-loader'
      }
    );
    return config;
  }
}));
