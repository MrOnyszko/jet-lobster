#!/usr/bin/env ruby

# Jet Lobster APNS Notifier
# @author Sławomir Onyszko <slawomir.onyszko@gmail.com>

require 'optparse'
require 'apns'

options = {device_token: '', message: '', host: nil, pem: './JetLobster.pem', port: 2195}

OptionParser.new do |option|

  option.banner = 'Usage: jet_lobster.rb [options]'
  option.separator 'JetLobster APNS Notifier'
  option.separator 'Options:'
  
  option.on('-t', '--token TOKEN', 'device token') do |t|
    options[:device_token] = t
  end

  option.on('-m', '--message MESSAGE', 'notification message') do |m|
    options[:message] = m
  end

  option.on('-x', '--host HOST', 'APNS host default is gateway.sandbox.push.apple.com') do |x|
    options[:host] = x
  end

  option.on('-o', '--port PORT', 'APNS port, default is 2195') do |o|
    options[:pem] = o
  end

  option.on('-p', '--pem PATH', 'Path to pem file') do |p|
    options[:pem] = p
  end

end.parse!

unless options[:host].nil? 
	APNS.host = options[:host]
end

APNS.pem = options[:pem]
APNS.port = options[:port]

APNS.send_notification(options[:device_token], :alert => options[:message], :badge => 1, :sound => 'default')
