import Head from "next/head";
import { renderMetaTags, useQuerySubscription } from "react-datocms";
import Container from "../components/container";
import Layout from "../components/layout";
import { request } from "../lib/datocms";
import { metaTagsFragment } from "../lib/fragments";
import Header from "../components/header";
import Footer from "../components/footer";

export async function getStaticProps({ preview }) {
  const graphqlRequest = {
    query: `
      {
        site: _site {
          favicon: faviconMetaTags {
            ...metaTagsFragment
          }
        }
      }

      ${metaTagsFragment}
    `,
    preview,
  };

  return {
    props: {
      subscription: preview
        ? {
            ...graphqlRequest,
            initialData: await request(graphqlRequest),
            token: process.env.NEXT_CMS_DATOCMS_API_TOKEN,
            environment: process.env.NEXT_DATOCMS_ENVIRONMENT || null,
          }
        : {
            enabled: false,
            initialData: await request(graphqlRequest),
          },
    },
  };
}

export default function Index({ subscription }) {
  const {
    data: { site },
  } = useQuerySubscription(subscription);

  return (
    <>
      <Layout preview={subscription.preview}>
        <Head>
          <link rel="preconnect" href="https://fonts.gstatic.com" />
        </Head>
        <Container>
            <Header />
            <b>Hello OpenCannabis</b>
            <Footer />
        </Container>
      </Layout>
    </>
  );
}
