DS.JSONTransforms.array =

  # If the outgoing json is already a valid javascript array
  # then pass it through untouched. In all other cases, replace it
  # with an empty array.  This means null or undefined values
  # automatically become empty arrays when serializing this type.

  serialize: (jsonData)->
    if Em.typeOf(jsonData) is 'array' then jsonData else []


  # If the incoming data is a javascript array, pass it through.
  # If it is a string, then coerce it into an array by splitting
  # it on commas and trimming whitespace on each element.
  # Otherwise pass back an empty array.  This has the effect of
  # turning all other data types (including nulls and undefined
  # values) into empty arrays.

  deserialize: (externalData)->
    switch Em.typeOf(externalData)
      when 'array'  then return externalData
      when 'string' then return externalData.split(',').map((item)-> jQuery.trim(item))
      else               return []