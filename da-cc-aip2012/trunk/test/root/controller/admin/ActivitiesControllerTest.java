package root.controller.admin;

import org.slim3.tester.ControllerTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class ActivitiesControllerTest extends ControllerTestCase {

    @Test
    public void run() throws Exception {
        tester.start("/admin/activities");
        ActivitiesController controller = tester.getController();
        assertThat(controller, is(notNullValue()));
        assertThat(tester.isRedirect(), is(false));
        assertThat(tester.getDestinationPath(), is("/admin/activities.jsp"));
    }
}
