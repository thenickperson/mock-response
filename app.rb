require 'bundler'
Bundler.require

def any(url, verbs = %w(get post put delete options patch), &block)
  verbs.each do |verb|
    send(verb, url, &block)
  end
end

class MockIssues < Sinatra::Base
  codes = {
    '200' => 'Successful',
    '300' => 'Multiple Choices',
    '301' => 'Moved Permanently',
    '302' => 'Found',
    '303' => 'See Other',
    '304' => 'Not Modified',
    '305' => 'Use Proxy',
    '306' => 'Switch Proxy',
    '307' => 'Temporary Redirect',
    '308' => 'Permanent Redirect',
    '400' => 'Bad Request',
    '401' => 'Unauthorized',
    '402' => 'Payment Required',
    '403' => 'Forbidden',
    '404' => 'Not Found',
    '405' => 'Method Not Allowed',
    '406' => 'Not Acceptable',
    '407' => 'Proxy Authentication Required',
    '408' => 'Request Timeout',
    '409' => 'Conflict',
    '410' => 'Gone',
    '411' => 'Length Required',
    '412' => 'Precondition Failed',
    '413' => 'Request Entity Too Large',
    '414' => 'Request-URI Too Long',
    '415' => 'Unsupported Media Type',
    '416' => 'Requested Range Not Satisfiable',
    '417' => 'Expectation Failed',
    '418' => 'I\'m a teapot',
    '422' => 'Unprocessable Entity',
    '423' => 'Locked',
    '424' => 'Failed Dependency',
    '425' => 'Unordered Collection',
    '426' => 'Upgrade Required',
    '449' => 'Retry With',
    '450' => 'Blocked by Windows Parental Controls',
    '451' => 'Legally Restricted',
    '500' => 'Internal Server Error',
    '501' => 'Not Implemented',
    '502' => 'Bad Gateway',
    '503' => 'Service Unavailable',
    '504' => 'Gateway Timeout',
    '505' => 'HTTP Version Not Supported',
    '506' => 'Variant Also Negotiates',
    '507' => 'Insufficient Storage',
    '509' => 'Bandwidth Limit Exceeded',
    '510' => 'Not Extended'
  }

  get '/' do
    @codes = codes
    
    erb :index
  end

  any '/hesitate' do
    sleep 5

    body "5 seconds later..."
  end

  any '/timeout' do
    sleep 28
    body "28 seconds later..."
  end

  any '/:code' do
    code = params[:code]
    message = codes[code]

    if message.nil?
      code = '404'
      message = codes[code]
    end

    body message
    halt code.to_i
  end
end