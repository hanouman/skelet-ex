define
  day_to_utc: (n_day) ->
    return ((24 * 60 * 60) * 1000) * n_day

  days_ago_to_utc: (day) ->
    d = new Date
    return Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()) - @day_to_utc(day)

  date_now_utc: ->
    now = new Date()
    return Date.UTC(now.getFullYear(), now.getMonth(), now.getDate())

  date_utc: (date) ->
    date = new Date(date)
    return Date.UTC(date.getFullYear(), date.getMonth(), date.getDate())

  nb_days_by_range: (from, to) ->
    return (to - from) / @day_to_utc(1)

  next_day_utc: (date_utc, next = null) ->
    return date_utc + @day_to_utc(next ? 1)

  utc_to_iso: (date_utc) ->
    date = new Date(date_utc)
    return _.last(date.toISOString().match(/(.*)T.*/))
