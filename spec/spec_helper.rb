ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'ym_core/spec_helper'
require 'ym_users/spec_helper'

FactoryGirl.reload