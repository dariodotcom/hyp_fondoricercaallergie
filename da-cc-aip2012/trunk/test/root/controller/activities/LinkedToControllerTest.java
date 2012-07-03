package root.controller.activities;

import org.slim3.tester.ControllerTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class LinkedToControllerTest extends ControllerTestCase {

    @Test
    public void run() throws Exception {
        tester.start("/activities/linkedTo");
        LinkedToController controller = tester.getController();
        assertThat(controller, is(notNullValue()));
        assertThat(tester.isRedirect(), is(false));
        assertThat(tester.getDestinationPath(), is("/activities/linkedTo.jsp"));
    }
}
