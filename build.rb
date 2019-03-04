
path = "_posts/sift"

Dir.foreach(path) do |f|
  fn = File.join(path, f)
  File.delete(fn) if f != '.' && f != '..'
end

Dir.glob("sift/**/*") do |file|
  if !File.directory?(file)
    filename = File.basename(file)
    date = "#{File.mtime(file)}".split(' ')

    output = [
      "---",
      "title: #{filename}",
      "image_basename: #{File.basename(file)}",
      "image_path: /#{file}",
      "categories: i",
      "layout: image",
      "---",
      "{{ page.image_path }}"
    ]

    filename = "#{path}/#{date.first}-#{filename}.html"
    File.open(filename, "w+") do |f|
      output.each { |element| f.puts(element) }
    end

    # puts "#{date.first}"

    # out_file = File.new("#{path}out.txt", "w")
    # out_file.puts("write your stuff here")

  end
end

# site.static_files.each do |file|
#   if file.path["/sift/"]
#     date = "#{File.mtime(file.path)}".split(' ')

#     output = [
#       "---",
#       "title: #{file.basename}",
#       "image_basename: #{File.basename(file.path)}",
#       "image_path: #{file.path.split(Dir.pwd)[1]}",
#       "categories: i",
#       "layout: image",
#       "---",
#       "{{ page.image_path }}"
#     ]

#     filename = "#{path}/#{date.first}-#{file.basename}.html"
#     File.open(filename, "w+") do |f|
#       output.each { |element| f.puts(element) }
#     end

#     # puts "#{date.first}"

#     # out_file = File.new("#{path}out.txt", "w")
#     # out_file.puts("write your stuff here")
    

#       # site.pages << CategoryPage.new(site, site.source, "sift", file.path)
#   end
# end