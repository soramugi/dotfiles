if Gem::Specification.find_all_by_name('guard-bundler').any?
  guard 'bundler' do
    watch('Gemfile')
  end
end

if Gem::Specification.find_all_by_name('guard-rspec').any?
  zeus = File.exists?('.zeus.sock')
  spork = Gem::Specification.find_all_by_name('spork').any?
  spring = Gem::Specification.find_all_by_name('spring').any?

  cmd = ''
  cmd += 'zeus ' if zeus
  cmd += 'spring ' if spring
  cmd += 'rspec '
  cmd += '--drb ' if spork

  guard 'rspec', :all_on_start => false, :all_after_pass => false, :cmd => cmd do
    # Spec files
    watch(%r{^spec/.+_spec\.rb$})

    # Factories
    watch(%r{^spec/factories/(.+)\.rb$})               { |m| ["spec/models/#{m[1].singularize}_spec.rb", "spec/controllers/#{m[1]}_controller_spec.rb", "spec/requests/#{m[1]}_spec.rb"] }

    # Rails specific
    watch(%r{^app/(.+)\.rb$})                          { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^lib/(.+)\.rb$})                          { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$}) { |m| ["spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
    watch('app/controllers/application_controller.rb') { "spec/controllers" }
    watch(%r{^app/views/(.+)$})                        { |m| "spec/views/#{m[1]}_spec.rb" }

    # Capybara request specs
    watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})    { |m| "spec/requests/#{m[1]}_spec.rb" }

    # Controller specs for views
    watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})    { |m| "spec/controllers/#{m[1]}_spec.rb" }

    # Turnip features and steps
    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})  { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }

    # Runs all specs when something in /lib is modified (for Ruby gems development)
    if Dir.glob('*.gemspec').any?
      watch(%r{^lib/.+\.rb$}) { "spec" }
    end

    # Standalone projects
    watch(%r{^(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }

    # Ignore Zeus
    ignore(/\.zeus\.sock/)
  end
end

if Gem::Specification.find_all_by_name('guard-test').any?
  guard 'test', :all_on_start => false, :all_after_pass => false, :bundler => true, :keep_failed => false, :cli => '--verbose=normal', :drb => true do
    watch(%r{^lib/(.+)\.rb$})     { |m| "test/#{m[1]}_test.rb" }
    watch(%r{^test/.+_test\.rb$})
    watch('test/test_helper.rb')  { "test" }

    # Rails
    watch(%r{^app/models/(.+)\.rb$})                   { |m| "test/unit/#{m[1]}_test.rb" }
    watch(%r{^app/controllers/(.+)\.rb$})              { |m| "test/functional/#{m[1]}_test.rb" }
    watch(%r{^app/views/.+\.rb$})                      { "test/integration" }
    watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }
  end
end
