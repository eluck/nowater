async_kladr_return = (err, ret)->
  console.log('inside async kladr')
  if err
    console.log(err)
    return []
  return ret.result

kladrQuery = (token, key, query) ->
  return unless token
  return unless query
  qparams =
    ContentType: 'contentType'
    ContentName: 'query'
    WithParent: 'withParent'
    Limit: 'limit'
  queryVals = []

  if query.ParentType and query.ParentId
    queryVals.push "#{query.ParentType}Id=#{query.ParentId}"

  for index of qparams when query[index] isnt undefined
    queryVals.push "#{qparams[index]}=#{encodeURIComponent query[index]}"

  queryVals.push "#{qparam[i]}=#{encodeURIComponent qval}" for qval, i in query when query[i] isnt undefined
  url = "http://kladr-api.ru/api.php?#{queryVals.join '&'}&token=#{token}&key=#{key}"
  console.log(url)
  return HTTP.get url


Meteor.methods
  addresses: (query, options)->
    return unless query

    options = options || {}

  # guard against client-side DOS: hard limit to 50
    if options.limit
      options.limit = Math.min 50, Math.abs options.limit
    else
      options.limit = 50

    return Addresses.find(inhabintants: $nin : [Meteor.userId()]).fetch()

  kladr_street_search: (query, options) ->

    ret = kladrQuery '54721d677c5239f4168b457b', null,
        ContentName: query
        ContentType: 'street'
        WithParent: 0
        ParentType: 'city'
        ParentId: '4600000100000'

    return ret