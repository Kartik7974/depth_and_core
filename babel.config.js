module.exports = function(api) {
  api.cache(true);
  
  return {
    presets: [
      ['@babel/preset-env', {
        modules: false,
        targets: {
          browsers: '> 1%'
        }
      }]
    ],
    plugins: [
      '@babel/plugin-transform-runtime'
    ]
  };
};
