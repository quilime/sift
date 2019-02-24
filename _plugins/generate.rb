module GenImagePosts
  def self.process(site, payload)
    return if @processed

    # puts "hi hi"

    path = "_posts/images"

    Dir.foreach(path) do |f|
      fn = File.join(path, f)
      File.delete(fn) if f != '.' && f != '..'
    end

    puts Dir.pwd

    site.static_files.each do |file|
      if file.path["/images/"]
        date = "#{File.mtime(file.path)}".split(' ')

        output = [
          "---",
          "title: #{file.basename}",
          "image_basename: #{File.basename(file.path)}",
          "image_path: #{file.path.split(Dir.pwd)[1]}",
          "categories: i",
          "layout: image",
          "---",
          "{{ page.image_path }}"
        ]

        filename = "#{path}/#{date.first}-#{file.basename}.html"
        File.open(filename, "w+") do |f|
          output.each { |element| f.puts(element) }
        end

        # puts "#{date.first}"

        # out_file = File.new("#{path}out.txt", "w")
        # out_file.puts("write your stuff here")
        

          # site.pages << CategoryPage.new(site, site.source, "images", file.path)
      end
    end

    @processed = true
  end
end

Jekyll::Hooks.register :site, :pre_render do |site, payload|
  GenImagePosts.process(site, payload)
end