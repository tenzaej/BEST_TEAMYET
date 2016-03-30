helpers do
  def preview_post(content)
    content.split("")[0..50].join("") + "..."
  end
end
