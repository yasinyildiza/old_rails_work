module ApplicationHelper
  def pagination_information(data, name='?')
    content_tag :div, :class => "pagination_information" do
      options={:collection_name => name.downcase}
      page_entries_info(data, options)
    end
  end

  def paginated_collection_content(data, title, items)
    content_tag :div, :class => "content" do
      content_tag :table, :class =>"classic", :id => title do
        thead(items) + tbody(data)
      end
    end
  end

  def paginated_collection_content_for_team_member(data, title, items)
    content_tag :div, :class => "content" do
      content_tag :table, :class =>"classic", :id => title do
        thead(items) + tbody_for_team_member(data)
      end
    end
  end

  def paginate_footer(data)
    content_tag :div, :id => "index_footer" do
      paginate data
    end
  end

  def thead(items)
    content_tag :thead do
      str = "<tr>"
      items.each do |item|
        str << "<th><span>#{item}</span></th>"
      end
      str << "</tr>"
      str.html_safe
    end
  end

  def tbody(data)
    content_tag(:tbody) do
      render data
    end
  end


  def page_entries_info(collection, options = {})

    collection_name = options[:collection_name] || (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))

    if collection.num_pages < 2
      #case collection.size
      #when 0; info = "No #{collection_name.pluralize} found"
      #when 1; info = "Displaying <b><strong>1</strong></b> #{collection_name}"
      #else;   info = "Displaying <b><strong> #{collection.size}</strong></b> #{collection_name.pluralize}"
      #end
      trans_coll= (t collection_name.to_str)
      info = (t "info.display_count", :model => collection_name, :count => collection.size)
    else
      info = (t "info.display_page_count", :model => collection_name, :start => collection.offset_value + 1, :end => collection.offset_value + collection.length, :total => collection.total_count)
      #info = %{Displaying #{collection_name.pluralize} <b><strong>%d&ndash;%d</strong></b> of <b><strong>%d</strong></b> in total}% [
      #  collection.offset_value + 1,
      #  collection.offset_value + collection.length,
      #  collection.total_count
      #]
    end
    info.html_safe
  end

end
