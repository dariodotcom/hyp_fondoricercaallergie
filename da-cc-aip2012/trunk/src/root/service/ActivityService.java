package root.service;

import java.util.List;

import org.slim3.datastore.Datastore;

import root.meta.ActivityMeta;
import root.model.Activity;

import com.google.appengine.api.datastore.Key;

public class ActivityService {
    public static List<Activity> getActivityList(){
        return Datastore.query(ActivityMeta.get()).asList();
    }
    
    public static Activity get(Key activityKey) {
        Activity activity = Datastore.get(Activity.class, activityKey);
        return activity;
    }
    
    public static void put(Activity activity){
        Datastore.put(activity);
    }
}
