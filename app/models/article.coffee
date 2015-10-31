mongoose = require('mongoose')
Schema = mongoose.Schema

ArticleSchema = new Schema
  title:String # 标题
  html:String  # html 内容

  guid:
    type:String  # 笔记guid
    unique: true

  tags:Array   # 标签
  createTime:Number   # 创建时间
  updateTime:Number   # 更新时间


mongoose.model('Article', ArticleSchema)
