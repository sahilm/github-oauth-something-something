# frozen_string_literal: true

require 'open3'
require 'time'

class WelcomeController < ApplicationController
  def clone
    @cmd = <<~CMD
      rm -rf /tmp/test-repo &&
      git clone https://#{$token}:x-oauth-basic@github.com/sahilm/test-repo /tmp/test-repo
    CMD
    @stdout, @stderr, @status = Open3.capture3(@cmd)
    render 'welcome/command'
  end

  def push
    @cmd = <<~CMD
      bash -c '
      export GIT_TERMINAL_PROMPT=0
      git --git-dir /tmp/test-repo/.git config credential.helper ""
      git --git-dir /tmp/test-repo/.git commit -m "#{Time.now.utc.iso8601}" --allow-empty &&
      git --git-dir /tmp/test-repo/.git push https://#{$token}:x-oauth-basic@github.com/sahilm/test-repo master
      '
    CMD
    @stdout, @stderr, @status = Open3.capture3(@cmd)
    render 'welcome/command'
  end
end
