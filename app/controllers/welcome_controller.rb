# frozen_string_literal: true

require 'open3'

class WelcomeController < ApplicationController
  def clone
    @cmd = <<~CMD
      rm -rf /tmp/test-repo &&
      git clone https://github.com/sahilm/test-repo /tmp/test-repo
    CMD
    @stdout, @stderr, @status = Open3.capture3(@cmd)
  end
end
