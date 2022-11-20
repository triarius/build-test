import { Pipeline, isPipeline } from "@triarius/pipeline-schema";
import { parse } from "yaml";
import { readFileSync, readdirSync } from "fs";

const pipeline_transformer_filename_pattern = /\.transformer\.js$/;
const filename = "./pipeline.yaml";

async function import_and_transform(
  pipeline: Pipeline,
  name: string
): Promise<Pipeline> {
  const transform = await import(name);
  return transform(pipeline);
}

const pipeline: Pipeline = parse(readFileSync(filename, "utf-8"));
if (!isPipeline(pipeline)) {
  throw new Error(`{filename} is not a valid pipeline`);
}

const files = readdirSync(".", { encoding: "utf-8" }).filter((f) =>
  f.match(pipeline_transformer_filename_pattern)
);

const finalPipeline = await files.reduce(async (pipeline, filename) => {
  const newPipeline = await import_and_transform(await pipeline, filename);
  return newPipeline;
}, Promise.resolve(pipeline));

console.log(JSON.stringify(finalPipeline));
