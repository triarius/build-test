import { Pipeline, isCommandStep } from "@triarius/pipeline-schema";

export default function (pipeline: Pipeline): Pipeline {
  pipeline.steps = pipeline.steps?.map((step) => {
    if (isCommandStep(step)) {
      step.priority =
        process.env["BUILDKITE_AUTHOR"] === "dependabot" ? -1 : step.priority;
    }
    return step;
  });

  return pipeline;
}
