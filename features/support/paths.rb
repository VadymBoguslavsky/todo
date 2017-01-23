def path_to(page_name)
  case page_name

  when /the homepage/
    tasks_path
  when /the list of articles/
    tasks_path

  # Add more page name => path mappings here

  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end