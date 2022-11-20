import { Pipeline } from "./pipeline-schema/schema";
import { isCommandStep } from "./pipeline-schema/schema.guard";

let pipeline: Pipeline = {
  steps: [
    {
      name: ":buildkite: Run an important command",
    },
  ],
};

pipeline.steps = pipeline.steps?.map((step) => {
  if (isCommandStep(step)) {
    step.priority =
      process.env["BUILDKITE_AUTHOR"] === "dependabot" ? -1 : step.priority;
  }
  return step;
});

export default pipeline;
