package runnerAndSteps;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

// This is the Runner and the tests will be run from here. Right click and run as JUnit tests.
@RunWith(Cucumber.class)
@CucumberOptions(
		format = { "pretty", "html:target/html/result.html" },
		glue = {"runnerAndSteps"},
		dryRun = false,
		tags = { "@TestInProgress" },
		//******************** For TestInProgress ********************
		// Put the features here. Comment the features not being tested. Only one must be active.
		features = "src/test/resource/com/DBResults/APT/RegressionTestCases/Iteration1.feature"
)

public class RunnerTest {
}