package root.service;

import java.util.List;

import org.slim3.datastore.Datastore;

import root.meta.ActivityMeta;
import root.model.Activity;
import root.model.Project;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

/**
 * Utility class to retrieve/put Activities from/into the datastore.
 * */
public class ActivityService {
    /**
     * Gives a list of Activity given the parameters of desired activities.
     * 
     * @parma type - the type of the search to perform
     * @param value
     *            - the optional value of the param to search
     * @return the List of Activity
     */
    public static List<Activity> getActivityList(String type, String value){
        ActivityMeta activityMeta = ActivityMeta.get();
        
        if(type.equals("linkedTo")){
            Key projectKey = KeyFactory.stringToKey(value);
            Project linkedProject = Datastore.get(Project.class, projectKey);
            return linkedProject.getActivityRef().getModelList();
        } else {
            return Datastore.query(activityMeta).sort(activityMeta.name.asc).asList();
        }
    }

    /**
     * Retrieves an Activity from the Datastore given its key.
     * 
     * @param activityKey
     *            - the Key to search
     * @return the corresponding Activity
     * */
    public static Activity get(Key activityKey) {
        Activity activity = Datastore.get(Activity.class, activityKey);
        return activity;
    }

    /**
     * Puts an Activity into the Datastore
     * 
     * @param activity
     *            - the Activity to put into the Datastore
     * */
    public static void put(Activity activity) {
        Datastore.put(activity);
    }
}
