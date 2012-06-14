package root.service;

import org.slim3.tester.AppEngineTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class AuthorServiceTest extends AppEngineTestCase {

    private ProjectService service = new ProjectService();

    @Test
    public void test() throws Exception {
        assertThat(service, is(notNullValue()));
    }
}
