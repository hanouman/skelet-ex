express = require("express")
async = require("async")
router = express.Router()

users = [
    {
      date: 'January'
      count: 56
    },
    {
      date: 'February'
      count: 120
    },
    {
      date: 'March'
      count: 90
    },
    {
      date: 'April'
      count: 150
    },
    {
      date: 'May'
      count: 200
    },
    {
      date: 'June'
      count: 267
    },
    {
      date: 'July'
      count: 305
    },


]

router.get "/", (req, res) ->
  res.json users

module.exports = router
