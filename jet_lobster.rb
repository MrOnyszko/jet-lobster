#!/usr/bin/env ruby

# JetLobster local APNs testing tool.
# @author Sławomir Onyszko <slawomir.onyszko@gmail.com>

require 'optparse'
require 'apns'

options = {device_token: nil, message: nil, host: nil, pem: './JetLobster.pem', port: 2195, badge: 1, other: {}}

OptionParser.new do |option|

  option.banner = 'Usage: jet_lobster.rb [options]'
  option.separator 'JetLobster local APNs testing tool'
  option.separator 'Options:'
  
  option.on('-t', '--token TOKEN', 'Device token') do |value|
    options[:device_token] = value
  end

  option.on('-m', '--message MESSAGE', 'Notification message') do |value|
    options[:message] = value
  end

  option.on('-x', '--host HOST', 'APNs host, default is gateway.sandbox.push.apple.com') do |value|
    options[:host] = value
  end

  option.on('-o', '--port PORT', 'APNs port, default is 2195') do |value|
    options[:pem] = value
  end

  option.on('-p', '--pem PATH', 'Path to pem file') do |value|
    options[:pem] = value
  end

  option.on('-b', '--badge VALUE', 'Badge value, default is 1') do |value|
    options[:badge] = value
  end

  option.on('--other HASH', 'Additional data sent with notification, default is an empty Hash') do |value|
    options[:badge] = value
  end

end.parse!

unless options[:host].nil?
  APNS.host = options[:host]
end

APNS.pem = options[:pem]
APNS.port = options[:port]

unless options[:token].nil? and options[:message].nil?
  APNS.send_notification(options[:device_token], :alert => options[:message], :badge => options[:badge], :sound => 'default', :other => options[:other])
  puts "Notification was sent"
else 
  puts 'Device token and message is required'
  puts 'run ruby jest_lobster.rb --help for more information'
end

