class ::Hash
  # Это не рельса. Дип мёрджа нет, пришлось прикручивать.
  # Мёрдж также включает массивы.
  def deep_merge(second)
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
    self.merge(second.to_h, &merger)
  end
end

class SortTreeService
  attr_reader :params
  def initialize(params)
    @params = params
  end

  #
  # Логика, как я её понял для приведённого примера из задания.
  # Не совсем согласен с ней, но сделал, анализируя пример.
  #
  def build_tree_v1
    Behavior.all.map do |b|
      data = b[:properties]
      if data.keys.first.eql?(params.keys.first)
        build_behavior_tree(data, b)
      else
        { default: build_behavior_tree(data, b) }
      end
    end.tap {|arr_hash| pp arr_hash }.reduce({}, :deep_merge)
  end

  #
  # Логика, как я считаю правильным для описания в Т.З.
  # Т.е. строить мы должны по фактически совпадающим action для дерева
  # Были ещё идеи с сортировкой элементов action, но подумал, что порядок их перечисления что - то типа "весов",
  # поэтому выпилил в итоге. Было что - то вроде data = data.sort{|a,b| b<=>a}.to_h
  #
  def build_tree_v2
    Behavior.all.map do |b|
      data = b[:properties]
      # Кол-во ключей в описании
      b_size = data.keys.size
      # Если свойство behavior ПОЛНОСТЬЮ совпадает, то строим дерево для него
      if data.keys.select { |k| included?(k, data[k]) }.size.eql?(b_size)
        build_behavior_tree(data, b)
      else
        { default: build_behavior_tree(data, b) }
      end
    end.tap {|arr_hash| pp arr_hash }.reduce({}, :deep_merge)
  end

  def build_behavior_tree(data, b)
    build_keys(data, b)
  end

  def build_keys(data, b)
    s_data = data.dup
    next_key = data.shift
    next_key = next_key.nil? ? nil : next_key.first
    return [b.id] unless next_key
    {
        key: next_key,
        values: {
            s_data[next_key] => build_keys(data, b)
        }
    }
  end

  def included?(key, value)
    return true if params[key].eql?(value)
    false
  end

end
