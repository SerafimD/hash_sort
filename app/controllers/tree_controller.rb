class TreeController < ApplicationController
  #
  # POST Sort tree method v1
  #
  post '/build_tree_v1' do
    render_result SortTreeService.new(json_params).build_tree_v1
  end

  #
  # PoST Sort tree method v2
  #
  post '/build_tree_v1' do
    render_result SortTreeService.new(json_params).build_tree_v2
  end

  #
  # PFD generation based on service object
  #
  post '/build_tree_v1_pdf' do
    rep = Reportage.new
    rep << SortTreeService.new(json_params).build_tree_v1
    rep.to_pdf('tmp/out.pdf')
    content_type :pdf
    send_file('tmp/out.pdf', :disposition => 'attachment', :filename => 'out.pdf')
  end

end
