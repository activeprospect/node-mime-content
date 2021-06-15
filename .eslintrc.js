module.exports = {
  env: {
    browser: true,
    commonjs: true,
    es2021: true
  },
  extends: [
    'standard'
  ],
  parserOptions: {
    ecmaVersion: 2018
  },
  rules: {
    semi: ['error', 'always'],
    'no-extra-semi': 'error'
  },
  overrides: [
    {
      files: ['test/**/*.js'],
      env: { mocha: true }
    }
  ]
};
