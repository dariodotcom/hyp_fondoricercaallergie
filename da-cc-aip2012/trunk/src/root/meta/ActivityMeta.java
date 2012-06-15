package root.meta;

//@javax.annotation.Generated(value = { "slim3-gen", "@VERSION@" }, date = "2012-06-15 14:48:48")
/** */
public final class ActivityMeta extends org.slim3.datastore.ModelMeta<root.model.Activity> {

    /** */
    public final org.slim3.datastore.StringUnindexedAttributeMeta<root.model.Activity> description = new org.slim3.datastore.StringUnindexedAttributeMeta<root.model.Activity>(this, "description", "description");

    /** */
    public final org.slim3.datastore.StringUnindexedAttributeMeta<root.model.Activity> generalInfo = new org.slim3.datastore.StringUnindexedAttributeMeta<root.model.Activity>(this, "generalInfo", "generalInfo");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<root.model.Activity, com.google.appengine.api.datastore.Key> key = new org.slim3.datastore.CoreAttributeMeta<root.model.Activity, com.google.appengine.api.datastore.Key>(this, "__key__", "key", com.google.appengine.api.datastore.Key.class);

    /** */
    public final org.slim3.datastore.StringAttributeMeta<root.model.Activity> name = new org.slim3.datastore.StringAttributeMeta<root.model.Activity>(this, "name", "name");

    /** */
    public final org.slim3.datastore.ModelRefAttributeMeta<root.model.Activity, org.slim3.datastore.ModelRef<root.model.Project>, root.model.Project> projectRef = new org.slim3.datastore.ModelRefAttributeMeta<root.model.Activity, org.slim3.datastore.ModelRef<root.model.Project>, root.model.Project>(this, "projectRef", "projectRef", org.slim3.datastore.ModelRef.class, root.model.Project.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<root.model.Activity, java.lang.Long> version = new org.slim3.datastore.CoreAttributeMeta<root.model.Activity, java.lang.Long>(this, "version", "version", java.lang.Long.class);

    private static final ActivityMeta slim3_singleton = new ActivityMeta();

    /**
     * @return the singleton
     */
    public static ActivityMeta get() {
       return slim3_singleton;
    }

    /** */
    public ActivityMeta() {
        super("Activity", root.model.Activity.class);
    }

    @Override
    public root.model.Activity entityToModel(com.google.appengine.api.datastore.Entity entity) {
        root.model.Activity model = new root.model.Activity();
        model.setDescription(textToString((com.google.appengine.api.datastore.Text) entity.getProperty("description")));
        model.setGeneralInfo(textToString((com.google.appengine.api.datastore.Text) entity.getProperty("generalInfo")));
        model.setKey(entity.getKey());
        model.setName((java.lang.String) entity.getProperty("name"));
        if (model.getProjectRef() == null) {
            throw new NullPointerException("The property(projectRef) is null.");
        }
        model.getProjectRef().setKey((com.google.appengine.api.datastore.Key) entity.getProperty("projectRef"));
        model.setVersion((java.lang.Long) entity.getProperty("version"));
        return model;
    }

    @Override
    public com.google.appengine.api.datastore.Entity modelToEntity(java.lang.Object model) {
        root.model.Activity m = (root.model.Activity) model;
        com.google.appengine.api.datastore.Entity entity = null;
        if (m.getKey() != null) {
            entity = new com.google.appengine.api.datastore.Entity(m.getKey());
        } else {
            entity = new com.google.appengine.api.datastore.Entity(kind);
        }
        entity.setUnindexedProperty("description", stringToText(m.getDescription()));
        entity.setUnindexedProperty("generalInfo", stringToText(m.getGeneralInfo()));
        entity.setProperty("name", m.getName());
        if (m.getProjectRef() == null) {
            throw new NullPointerException("The property(projectRef) must not be null.");
        }
        entity.setProperty("projectRef", m.getProjectRef().getKey());
        entity.setProperty("version", m.getVersion());
        entity.setProperty("slim3.schemaVersion", 1);
        return entity;
    }

    @Override
    protected com.google.appengine.api.datastore.Key getKey(Object model) {
        root.model.Activity m = (root.model.Activity) model;
        return m.getKey();
    }

    @Override
    protected void setKey(Object model, com.google.appengine.api.datastore.Key key) {
        validateKey(key);
        root.model.Activity m = (root.model.Activity) model;
        m.setKey(key);
    }

    @Override
    protected long getVersion(Object model) {
        root.model.Activity m = (root.model.Activity) model;
        return m.getVersion() != null ? m.getVersion().longValue() : 0L;
    }

    @Override
    protected void assignKeyToModelRefIfNecessary(com.google.appengine.api.datastore.AsyncDatastoreService ds, java.lang.Object model) {
        root.model.Activity m = (root.model.Activity) model;
        if (m.getProjectRef() == null) {
            throw new NullPointerException("The property(projectRef) must not be null.");
        }
        m.getProjectRef().assignKeyIfNecessary(ds);
    }

    @Override
    protected void incrementVersion(Object model) {
        root.model.Activity m = (root.model.Activity) model;
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
        root.model.Activity m = (root.model.Activity) model;
        writer.beginObject();
        org.slim3.datastore.json.Default encoder0 = new org.slim3.datastore.json.Default();
        if(m.getDescription() != null){
            writer.setNextPropertyName("description");
            encoder0.encode(writer, m.getDescription());
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
        if(m.getProjectRef() != null && m.getProjectRef().getKey() != null){
            writer.setNextPropertyName("projectRef");
            encoder0.encode(writer, m.getProjectRef(), maxDepth, currentDepth);
        }
        if(m.getVersion() != null){
            writer.setNextPropertyName("version");
            encoder0.encode(writer, m.getVersion());
        }
        writer.endObject();
    }

    @Override
    protected root.model.Activity jsonToModel(org.slim3.datastore.json.JsonRootReader rootReader, int maxDepth, int currentDepth) {
        root.model.Activity m = new root.model.Activity();
        org.slim3.datastore.json.JsonReader reader = null;
        org.slim3.datastore.json.Default decoder0 = new org.slim3.datastore.json.Default();
        reader = rootReader.newObjectReader("description");
        m.setDescription(decoder0.decode(reader, m.getDescription()));
        reader = rootReader.newObjectReader("generalInfo");
        m.setGeneralInfo(decoder0.decode(reader, m.getGeneralInfo()));
        reader = rootReader.newObjectReader("key");
        m.setKey(decoder0.decode(reader, m.getKey()));
        reader = rootReader.newObjectReader("name");
        m.setName(decoder0.decode(reader, m.getName()));
        reader = rootReader.newObjectReader("projectRef");
        decoder0.decode(reader, m.getProjectRef(), maxDepth, currentDepth);
        reader = rootReader.newObjectReader("version");
        m.setVersion(decoder0.decode(reader, m.getVersion()));
        return m;
    }
}