
import dynamic from 'next/dynamic'

/**
 * Enumerates different sections of docs.
 */
export enum DocSection {
    /** Conceptual architecture documentation. */
    ARCHITECTURE = 'architecture',

    /** Protocol reference documentation. */
    REFERENCE = 'reference'
}


/**
 * Retrieve the raw Markdown sources for the requested documentation page.
 *
 * @param section Doc section.
 * @param name Doc name.
 * @return Promise for string content.
 */
export async function getPage(section: DocSection, name: string): Promise<string> {
    console.log('Loading doc page "' + name + '" from section "' + section + '".');
    return await require(`./${section}/${name}.md`).default;
}
