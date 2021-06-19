import Head from "next/head";
import Container from "@components/container";
import Layout from "@components/layout";
import Header from "@components/header";
import Footer from "@components/footer";

export default function Index({ subscription }) {
    return (
        <>
            <Layout>
                <Head>
                    <link rel="preconnect" href="https://fonts.gstatic.com" />
                </Head>
                <Container>
                    <Header />
                    <b>Hello OpenCannabis Reference</b>
                    <Footer />
                </Container>
            </Layout>
        </>
    );
}
