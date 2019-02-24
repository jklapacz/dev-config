module.exports = {
  "roots": [
    "<rootDir>/app/javascript"
  ],
  "transform": {
    "^.+\\.tsx?$": "ts-jest"
  },
  "testRegex": "(/__tests__/.*|(\\.|/)(test|spec))\\.tsx?$",
  // "modulePaths": [
  //   "<rootDir>/app/javascript",
  //   "<rootDir>/node_modules"
  // ],
  "moduleFileExtensions": [
    "ts",
    "tsx",
    "js",
    "jsx",
    "json",
    "node"
  ],
  "snapshotSerializers": ["enzyme-to-json/serializer"],
  "setupFilesAfterEnv": ["<rootDir>/app/javascript/setupEnzyme.ts"],
  "collectCoverageFrom": [
    "**/*.{j|t}sx?$",
    "!**/node_modules/**",
    "!**/vendor/**",
    "!**/app/assets/**"
  ]
}
