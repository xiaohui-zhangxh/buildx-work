revision_path = File.expand_path("../GIT_COMMIT", __dir__)
ENV['REVISION'] = File.read(revision_path).strip if File.exist?(revision_path)

revision_tag_path = File.expand_path("../GIT_TAG", __dir__)
ENV['REVISION_TAG'] = File.read(revision_tag_path).strip if File.exist?(revision_tag_path)

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
