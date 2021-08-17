
package sdk.java;


/** Defines static information about the OpenCannabis SDK for Java. */
public final class OpenCannabisSDK {
    /** SDK meta-version. */
    private final static int metaVersion = 2;

    /**
     * Return the current meta-version for the OpenCannabis Java SDK.
     *
     * @return Meta-version integer.
     */
    public static int getMetaVersion() {
        return metaVersion;
    }
}
