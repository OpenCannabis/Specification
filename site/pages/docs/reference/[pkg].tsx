import Head from "next/head";

import Container from "@components/container";
import Header from "@components/header";
import Layout from "@components/layout";
import {markdownToHtml, MarkdownContent} from "@components/md-content";

import {
    getPage, DocSection
} from '@docs/docs';

const docModules = [
    "accounting",
    "base",
    "commerce",
    "contact",
    "content",
    "core",
    "crypto",
    "device",
    "geo",
    "media",
    "oauth",
    "partner",
    "person",
    "proximity",
    "rfid",
    "structs",
    "temporal"
];

export async function getStaticPaths() {
    return {
        paths: docModules.map((pkg) => `/docs/reference/${pkg}`),
        fallback: false,
    };
}

export async function getStaticProps({ params, preview = false }) {
    const { html, data } = await markdownToHtml(await getPage(DocSection.REFERENCE, params.pkg));
    return {
        props: {
            preview: preview,
            docpackage: params.pkg,
            metadata: data,
            html
        },
    };
}

export default function Docpage({ docpackage, preview, html }) {
    const doctitle = `${docpackage.charAt(0).toUpperCase()}${docpackage.slice(1)}`;

    return (
        <Layout preview={preview}>
            <Head><title>{doctitle} | Object Reference | OpenCannabis</title></Head>
            <Container>
                <Header />
                <article>
                    <MarkdownContent content={html} />
                </article>
            </Container>
        </Layout>
    );
}
