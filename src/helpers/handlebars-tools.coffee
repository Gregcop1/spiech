module.exports.equal =  (lvalue, rvalue, options)->
  if arguments.length < 3
    throw new Error("Handlebars Helper equal needs 3 parameters");
  if lvalue!=rvalue
    return options.inverse(this);
  else
    return false;