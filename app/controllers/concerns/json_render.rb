module JsonRender

  def render_result(json)
    if json.class < ActiveRecord::Base || json.class < ActiveRecord::Relation
      {json: json, root: :result}.to_json
    else
      {json: {result: json}}.to_json
    end
  end

  def render_error code, body={}
    {json: error_response(code, body)}.to_json
  end

end
