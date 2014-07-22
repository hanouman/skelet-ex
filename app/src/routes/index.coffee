express = require("express")
async = require("async")
router = express.Router()

example = (callback) ->
  qryObj =
    query:
      bool:
        must:[
          {
            "match":
              "controller" : "users"
          },
          {
          "match":
            "method" : "POST"
          }
        ]

  callback(qryObj)

router.get "/", (req, res) ->
  async.parallel [
    (callback) ->
      example(callback)
  ], (err, results) ->
    res.render "index",
      data: results
    return


module.exports = router
