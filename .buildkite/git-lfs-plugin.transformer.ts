import { Pipeline, isCommandStep } from "@triarius/pipeline-schema";

export default function (pipeline: Pipeline): Pipeline {
  pipeline.steps = (pipeline.steps || []).map((step) =>
    isCommandStep(step)
      ? {
          ...step,
          plugins: {
            ...(step.plugins || {}),
            "triarius/git-lfs-fetch#v0.1.0": {},
          },
        }
      : step
  );

  return pipeline;
}
