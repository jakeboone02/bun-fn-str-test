const fn = require("./fn");

const localFn = () => {};

it(`\`\${fn}\` should be "${fn}"`, () => {
  expect(`${fn}`).toBe("() => {}");
});

it(`\`\${localFn}\` should be "${localFn}"`, () => {
  expect(`${localFn}`).toBe("() => {}");
});

it(`\`\${() => {}}\` should be "${() => {}}"`, () => {
  expect(`${() => {}}`).toBe("() => {}");
});
