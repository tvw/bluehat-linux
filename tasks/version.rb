require './lib/bluehat/version.rb'

def template(template_filename, output_file, b)
  template = File.read(template_filename)

  File.open(output_file, "w+") do |f|
    f.write(ERB.new(template).result(b))
  end
end

namespace :version do
  namespace :bump do
    desc "Bump the major version by 1"
    task :major do
      major = Bluehat::VERSION::MAJOR + 1
      minor = 0
      tiny = 0
      template("lib/bluehat/version.rb.erb", "lib/bluehat/version.rb", binding)
      sh %{git add --dry-run lib/bluehat/version.rb}
      sh %{git commit -m "Version bump to #{major}.#{minor}.#{tiny}"}
    end

    desc "Bump the minor version by 1"
    task :minor do
      major = Bluehat::VERSION::MAJOR
      minor = Bluehat::VERSION::MINOR + 1
      tiny = 0
      template("lib/bluehat/version.rb.erb", "lib/bluehat/version.rb", binding)
      sh %{git add --dry-run lib/bluehat/version.rb}
      sh %{git commit -m "Version bump to #{major}.#{minor}.#{tiny}"}
    end

    desc "Bump the tiny version by 1"
    task :tiny do
      major = Bluehat::VERSION::MAJOR
      minor = Bluehat::VERSION::MINOR
      tiny = Bluehat::VERSION::TINY + 1
      template("lib/bluehat/version.rb.erb", "lib/bluehat/version.rb", binding)
      sh %{git add --dry-run lib/bluehat/version.rb}
      sh %{git commit -m "Version bump to #{major}.#{minor}.#{tiny}"}
    end
  end
end
