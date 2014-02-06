# Filename

Simple Filename helper. Works well with Pathname.

    Pathname.new('ruby') + Filename.new('love', :rb)
	
[![GitHub version](https://badge.fury.io/gh/max-power%2Ffilename.png)](http://badge.fury.io/gh/max-power%2Ffilename)
[![Build Status](https://travis-ci.org/max-power/filename.png?branch=master)](https://travis-ci.org/max-power/filename)

## Installation

Add this line to your application's Gemfile:

    gem 'filename-helper'
	
## Usage

    Filename.new('Gemfile').to_s
	# 'Gemfile'
    
	Filename.new('image', 'jpg').to_s
	# 'image.jpg'
    
	Filename.new('index', ['html', 'erb']).to_s
	#'index.html.erb'
    
	Filename.new('index', 'html', nil, 'erb', nil).to_s 
	# 'index.html.erb'
    
	Filename.new(nil, 'htaccess').to_s 
	# '.htaccess'
	
	Filename.parse('landscape.jpg').suffix('400x300', 'greyscale', 'inverted').to_s
	# 'landscape_400x300_greyscale_inverted.jpg'
	
	Filename.parse('landscape.jpg').prefix('very', 'nice', seperator: '--').to_s
	# 'very--nice--landscape.jpg'
  
Filename is build to work well with Pathname:

	Pathname.new('/this/is-a') + Filename.new('big', 'test', 'file')  
	# '/this/is-a/big.test.file'

## Contributing

1. Fork it ( http://github.com/max-power/filename/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
