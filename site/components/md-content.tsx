import matter from 'gray-matter';
import remark from 'remark';
import html from 'remark-html';

import markdownStyles from './md-content.module.css'


export type MarkdownResult = {
    html: string,
    data: object
};


/**
 * Render the provided Markdown source to HTML, through Gray Matter and Remark.
 *
 * @param markdown Markdown source.
 * @return Promise for rendered HTML content.
 */
export async function markdownToHtml(markdown: string): Promise<MarkdownResult> {
    const { data, content } = matter(markdown);
    const result = await remark().use(html).process(content)
    return {
        html: result.toString(),
        data
    };
}

/**
 * Render styled Markdown content.
 *
 * @param content Content to render, post conversion to HTML.
 * @constructor
 */
export function MarkdownContent({ content }) {
    return (
        <div className="max-w-3xl mx-auto">
            <div className={markdownStyles.markdown}
                 dangerouslySetInnerHTML={{ __html: content }} />
        </div>
    );
}
