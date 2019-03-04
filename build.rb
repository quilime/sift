
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

  end
end
