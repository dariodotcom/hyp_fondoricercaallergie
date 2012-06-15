package root.meta;

//@javax.annotation.Generated(value = { "slim3-gen", "@VERSION@" }, date = "2012-06-15 14:48:44")
/** */
public final class ProjectMeta extends org.slim3.datastore.ModelMeta<root.model.Project> {

    /** */
    public final org.slim3.datastore.StringUnindexedAttributeMeta<root.model.Project> documentation = new org.slim3.datastore.StringUnindexedAttributeMeta<root.model.Project>(this, "documentation", "documentation");

    /** */
    public final org.slim3.datastore.StringUnindexedAttributeMeta<root.model.Project> generalInfo = new org.slim3.datastore.StringUnindexedAttributeMeta<root.model.Project>(this, "generalInfo", "generalInfo");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<root.model.Project, com.google.appengine.api.datastore.Key> key = new org.slim3.datastore.CoreAttributeMeta<root.model.Project, com.google.appengine.api.datastore.Key>(this, "__key__", "key", com.google.appengine.api.datastore.Key.class);

    /** */
    public final org.slim3.datastore.StringAttributeMeta<root.model.Project> name = new org.slim3.datastore.StringAttributeMeta<root.model.Project>(this, "name", "name");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<root.model.Project, java.lang.Long> version = new org.slim3.datastore.CoreAttributeMeta<root.model.Project, java.lang.Long>(this, "version", "version", java.lang.Long.class);

    private static final ProjectMeta slim3_singleton = new ProjectMeta();

    /**
     * @return the singleton
     */
    public static ProjectMeta get() {
       return slim3_singleton;
    }

    /** */
    public ProjectMeta() {
        super("Project", root.model.Project.class);
    }

    @Override
    public root.model.Project entityToModel(com.google.appengine.api.datastore.Entity entity) {
        root.model.Project model = new root.model.Project();
        model.setDocumentation(textToString((com.google.appengine.api.datastore.Text) entity.getProperty("documentation")));
        model.setGeneralInfo(textToString((com.google.appengine.api.datastore.Text) entity.getProperty("generalInfo")));
        model.setKey(entity.getKey());
        model.setName((java.lang.String) entity.getProperty("name"));
        model.setVersion((java.lang.Long) entity.getProperty("version"));
        return model;
    }

    @Override
    public com.google.appengine.api.datastore.Entity modelToEntity(java.lang.Object model) {
        root.model.Project m = (root.model.Project) model;
        com.google.appengine.api.datastore.Entity entity = null;
        if (m.getKey() != null) {
            entity = new com.google.appengine.api.datastore.Entity(m.getKey());
        } else {
            entity = new com.google.appengine.api.datastore.Entity(kind);
        }
        entity.setUnindexedProperty("documentation", stringToText(m.getDocumentation()));
        entity.setUnindexedProperty("generalInfo", stringToText(m.getGeneralInfo()));
        entity.setProperty("name", m.getName());
        entity.setProperty("version", m.getVersion());
        entity.setProperty("slim3.schemaVersion", 1);
        return entity;
    }

    @Override
    protected com.google.appengine.api.datastore.Key getKey(Object model) {
        root.model.Project m = (root.model.Project) model;
        return m.getKey();
    }

    @Override
    protected void setKey(Object model, com.google.appengine.api.datastore.Key key) {
        validateKey(key);
        root.model.Project m = (root.model.Project) model;
        m.setKey(key);
    }

    @Override
    protected long getVersion(Object model) {
        root.model.Project m = (root.model.Project) model;
        return m.getVersion() != null ? m.getVersion().longValue() : 0L;
    }

    @Override
    protected void assignKeyToModelRefIfNecessary(com.google.appengine.api.datastore.AsyncDatastoreService ds, java.lang.Object model) {
    }

    @Override
    protected void incrementVersion(Object model) {
        root.model.Project m = (root.model.Project) model;
        long version = m.getVersion() != null ? m.getVersion().longValue() : 0L;
        m.setVersion(Long.valueOf(version + 1L));
    }

    @Override
    protected void prePut(Object model) {
    }

    @Override
    protected void postGet(Object model) {
    }

    @Override
    public String getSchemaVersionName() {
        return "slim3.schemaVersion";
    }

    @Override
    public String getClassHierarchyListName() {
        return "slim3.classHierarchyList";
    }

    @Override
    protected boolean isCipherProperty(String propertyName) {
        return false;
    }

    @Override
    protected void modelToJson(org.slim3.datastore.json.JsonWriter writer, java.lang.Object model, int maxDepth, int currentDepth) {
        root.model.Project m = (root.model.Project) model;
        writer.beginObject();
        org.slim3.datastore.json.Default encoder0 = new org.slim3.datastore.json.Default();
        if(m.getDocumentation() != null){
            writer.setNextPropertyName("documentation");
            encoder0.encode(writer, m.getDocumentation());
        }
        if(m.getGeneralInfo() != null){
            writer.setNextPropertyName("generalInfo");
            encoder0.encode(writer, m.getGeneralInfo());
        }
        if(m.getKey() != null){
            writer.setNextPropertyName("key");
            encoder0.encode(writer, m.getKey());
        }
        if(m.getName() != null){
            writer.setNextPropertyName("name");
            encoder0.encode(writer, m.getName());
        }
        if(m.getVersion() != null){
            writer.setNextPropertyName("version");
            encoder0.encode(writer, m.getVersion());
        }
        writer.endObject();
    }

    @Override
    protected root.model.Project jsonToModel(org.slim3.datastore.json.JsonRootReader rootReader, int maxDepth, int currentDepth) {
        root.model.Project m = new root.model.Project();
        org.slim3.datastore.json.JsonReader reader = null;
        org.slim3.datastore.json.Default decoder0 = new org.slim3.datastore.json.Default();
        reader = rootReader.newObjectReader("documentation");
        m.setDocumentation(decoder0.decode(reader, m.getDocumentation()));
        reader = rootReader.newObjectReader("generalInfo");
        m.setGeneralInfo(decoder0.decode(reader, m.getGeneralInfo()));
        reader = rootReader.newObjectReader("key");
        m.setKey(decoder0.decode(reader, m.getKey()));
        reader = rootReader.newObjectReader("name");
        m.setName(decoder0.decode(reader, m.getName()));
        reader = rootReader.newObjectReader("version");
        m.setVersion(decoder0.decode(reader, m.getVersion()));
        return m;
    }
}