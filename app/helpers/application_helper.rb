module ApplicationHelper

  def asset_data_uri path
    asset = (Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)).find_asset path

    throw "Could not find asset '#{path}'" if asset.nil?

    base64 = Base64.encode64(asset.to_s).gsub(/\s+/, "")
    "data:#{asset.content_type};base64,#{Rack::Utils.escape(base64)}"
  end

  def virtual_number(total,index)
    if params[:page].present?
      page=params[:page].to_i-1
    else
      page=0
    end

    if params[:per_page].present?
      per_page=params[:per_page].to_i
    else
      per_page=10
    end

    return total-(page*per_page)-index
  end

  def list_param(lparam)
    lparam[:controller]=nil
    lparam[:action]=nil
    lparam[:id]=nil

    return lparam
  end

  def match_factor_display(genotype,factor)
    if genotype.nil?
        return
    end

    if factor.nil?
      return
    end

    raw genotype.gsub('/','').gsub(factor,'<b class="red">'+factor+'</b>')
  end

  def hex_to_rgb input
    a = ( input.match /#(..?)(..?)(..?)/ )[1..3]
    a.map!{ |x| x + x } if input.size == 4
    "#{a[0].hex},#{a[1].hex},#{a[2].hex}"
  end

  def show_param(lparam)


    return lparam
  end

  def enableToString(enable,trans=true)
    if enable
      if trans
        return t(:enable)
      else
        return 'enable'
      end
    else
      if trans
        return t(:disable)
      else
        return 'disable'
      end
    end
  end

  def sexToString(sex,trans=true)
    if sex
      if trans
        return t(:male)
      else
        return 'male'
      end
    else
      if trans
        return t(:female)
      else
        return 'female'
      end
    end
  end

  def flagToString(flag,no_html=false)
    if(no_html)
      if flag
        return t(:flag_true)
      else
        return t(:flag_false)
      end
    else
      if flag
        return '<span class="flag_true">'+t(:flag_true)+'</span>'
      else
        return '<span class="flag_false">'+t(:flag_false)+'</span>'
      end
    end
  end

  def sameOrderToString(same_order,no_html=false)
    if(no_html)
      if same_order
        return t(:same_order_true)
      else
        return t(:same_order_false)
      end
    else
      if same_order
        return '<span class="flag_true">'+t(:same_order_true)+'</span>'
      else
        return '<span class="flag_false">'+t(:same_order_false)+'</span>'
      end
    end
  end

  def link_to_home
    link_to('홈',root_path,:title=>'홈으로')
  end

  def actionNameChange(action_name)
    case action_name
    when 'index'
      return t(:action_index)
    when 'new'
      return t(:action_new)
    when 'edit'
      return t(:action_edit)
    when 'show'
      return t(:action_show)
    else
    end
  end

  def current_controller(aa)
    if aa.include?(params[:controller])
      return 'class="current"'
    end
  end

  def manage_width(model)
    if can?(:delete, model) && can?(:update, model)
      return 'style="width:170px;"'
    else
      return 'style="width:90px"'
    end
  end
end
