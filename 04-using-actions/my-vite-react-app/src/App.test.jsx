import React from "react";
import { render, screen } from "@testing-library/react";
import App from "./App";
import { describe, test, vi, beforeEach } from 'vitest';
import { expect } from 'vitest';


import { JSDOM } from 'jsdom';

beforeEach(() => {
  const dom = new JSDOM();
  globalThis.window = dom.window;
  globalThis.document = dom.window.document;
});

vi.useFakeTimers();
describe("User", () => {
  test("renders hello world", async () => {
    render(<App />);
    const app = await screen.getByText('Hello, world!');
    expect(app).toBeInTheDocument();
  });
});