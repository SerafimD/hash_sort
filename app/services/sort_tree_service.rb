class SortTreeService
  attr_reader :params
  def initialize(params)
    @params = params
  end

  def build_tree
    result = {}
    Behavior.all.each do |b|
      data = b[:properties]
      result[b[:id]] = (compare_attrs(data))
    end
    result
    result.to_json
  end

  def compare_attrs(data)
    hash = {}
    data.each do |key, value|
      if params[key].eql?(value)
        hash[key] = {
          value: value
        }
      else
        hash['default'] = {
              'key': key,
              'value': value
        }
      end
    end
    hash
  end

end