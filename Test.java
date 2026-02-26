// Source - https://stackoverflow.com/q/64407003
// Posted by J.Olufsen, modified by community. See post 'Timeline' for change history
// Retrieved 2026-02-19, License - CC BY-SA 4.0

@SpringBootTest
@Testcontainers
public class KafkaContainerTest {

    private static final GenericContainer<?> redis = new GenericContainer<>("redis:8.6.1")
        .withExposedPorts(6379);

    private static final PostgreSQLContainer<?> postgres = new PostgreSQLContainer("postgres:18.3") 
        .withDatabaseName("testdb");

    private static final DockerImageName kafkaImage = DockerImageName.parse("confluentinc/cp-kafka:8.1.1"); 
    
    @ClassRule
    public static KafkaContainer kafka = new KafkaContainer(DockerImageName.parse("confluentinc/cp-kafka:8.1.1"));

    @Test
    public void testUsage() throws Exception {
            kafka.start();
            testKafkaFunctionality(kafka.getBootstrapServers());
    }

}
