// Generated by CoffeeScript 1.10.0
(function() {
  var ArticleSchema, Schema, mongoose;

  mongoose = require('mongoose');

  Schema = mongoose.Schema;

  ArticleSchema = new Schema({
    title: String,
    html: String,
    guid: {
      type: String,
      unique: true
    },
    tags: Array,
    createTime: Number,
    updateTime: Number
  });

  mongoose.model('Article', ArticleSchema);

}).call(this);

//# sourceMappingURL=article.js.map
