import Head from "next/head";

import Container from "@components/container";
import Header from "@components/header";
import Layout from "@components/layout";
import {markdownToHtml, MarkdownContent} from "@components/md-content";

import {
    getPage, DocSection
} from '@docs/docs';


const pagePaths = {
    'intro': '00-intro',
    'design': '01-design'
};

export async function getStaticPaths() {
    return {
        paths: Object.keys(pagePaths).map((page) => `/docs/architecture/${page}`),
        fallback: false,
    };
}

export async function getStaticProps({ params, preview = false }) {
    const source = await getPage(DocSection.ARCHITECTURE, pagePaths[params.docpage]);
    const { html, data } = await markdownToHtml(source);

    return {
        props: {
            preview: preview,
            docpage: params.docpage,
            metadata: data,
            html
        },
    };
}

export default function Docpage({ docpage, preview, html }) {
    const doctitle = `${docpage.charAt(0).toUpperCase()}${docpage.slice(1)}`;

    return (
        <Layout preview={preview}>
            <Head><title>{doctitle} | Architecture Docs | OpenCannabis</title></Head>
            <Container>
                <Header />
                <article>
                    <MarkdownContent content={html} />
                </article>
            </Container>
        </Layout>
    );
}
