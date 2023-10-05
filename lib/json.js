module.exports = function (content) {
  try {
    return JSON.parse(content);
  } catch(err){
    err.message = `Error: "${content}" is not valid JSON`;
    throw err;
  }
};
