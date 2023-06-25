import Home from "../src/app/page";
import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";

describe("Home", () => {
  it("renders the home page", () => {
    render(<Home />);
    // check if components are rendered
    // use appropriate assertions based on your app's components
    expect(screen.getByText("Get started by editing")).toBeInTheDocument();
  });
});
