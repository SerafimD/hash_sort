class SortTreeService
  attr_reader :params
  def initialize(params)
    @params = params
  end

  def build_tree
    result = {}
    params.each do |elem|
      elem.each do |key, value|
        result[value] = [] if result[value].nil?
        result[value] << key
      end
    end
    result.to_json
  end

end