// Source - https://stackoverflow.com/q/64407003
// Posted by J.Olufsen, modified by community. See post 'Timeline' for change history
// Retrieved 2026-02-19, License - CC BY-SA 4.0

@SpringBootTest
@Testcontainers
public class KafkaContainerTest {
    @ClassRule
    public static KafkaContainer kafka = new KafkaContainer(DockerImageName.parse("confluentinc/cp-kafka:5.2.1"));

    @Test
    public void testUsage() throws Exception {
            kafka.start();
            testKafkaFunctionality(kafka.getBootstrapServers());
    }

}
