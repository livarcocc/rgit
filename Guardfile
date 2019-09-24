guard 'rspec', cmd: 'rspec --color --format doc'  do
  # watch /app/ files
  watch(%r{^app/(.+)\.rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  watch(%r{^app/commands/(.+)\.rb$}) do |m|
    "spec/commands/#{m[1]}_spec.rb"
  end

  # watch /spec/ files
  watch(%r{^spec/(.+)\.rb$}) do |m|
    "spec/#{m[1]}.rb"
  end

  watch(%r{^spec/commands/(.+)\.rb$}) do |m|
    "spec/commands/#{m[1]}.rb"
  end
end